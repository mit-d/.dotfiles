{ config, pkgs, ... }:
let
  # Single source of truth for the applehv VM's resources. Mirrored into
  # both the declarative containers.conf and the reconcile script below,
  # so the two never drift.
  machine = {
    cpus = 8;
    memory = 16384; # MiB (16 GiB)
    diskSize = 100; # GiB
  };

  # macOS podman reads ~/.config/containers/containers.conf, NOT /etc, so
  # this is materialized into the user's home by the activation script
  # rather than via environment.etc. `provider = "applehv"` is pinned
  # deliberately: podman 6 defaults to libkrun, which cannot use Rosetta
  # (Hypervisor.framework, not Virtualization.framework) -- staying on
  # applehv keeps the Rosetta path below viable. Rosetta itself is NOT
  # set here: podman's applehv init ignores `[machine] rosetta`; it's
  # enabled guest-side by the reconcile script instead.
  containersConf = pkgs.writeText "containers.conf" ''
    [machine]
    cpus = ${toString machine.cpus}
    memory = ${toString machine.memory}
    disk_size = ${toString machine.diskSize}
    provider = "applehv"
  '';

  # Reconciles the imperative `podman machine` VM to the pinned settings
  # above. nix-darwin can't declare machine state, so this is how the
  # tuning becomes repeatable. `--recreate` does the destructive rebuild.
  reconcile = pkgs.writeShellApplication {
    name = "podman-machine-reconcile";
    runtimeInputs = [ pkgs.podman ];
    text = ''
      machine="podman-machine-default"
      cpus=${toString machine.cpus}
      memory=${toString machine.memory}
      disk=${toString machine.diskSize}

      init() {
        podman machine init \
          --rootful \
          --cpus "$cpus" \
          --memory "$memory" \
          --disk-size "$disk" \
          --now \
          "$machine"
      }

      # Enable Apple Rosetta for amd64 images (e.g. jaguar-debug/celery).
      # podman-machine-os ships Rosetta disabled by default because it is
      # broken on macOS Sequoia (Apple fixed it in macOS 26 but did not
      # backport). We're on macOS 26+, so opt in via podman's own gate
      # file + activation unit -- the supported mechanism, no binfmt
      # hacking. The marker lives in the guest's persistent /etc, so it
      # survives restarts; re-running this after a --recreate re-applies
      # it. See podman-machine-os#212. NOTE: this whole path sunsets when
      # podman 6 makes libkrun the default (no Rosetta there).
      ensure_rosetta() {
        # Already active (marker persisted, unit ran at boot)? Nothing to
        # do -- re-running the activation unit errors on the already-
        # registered binfmt handler.
        if podman machine ssh "$machine" \
             'test -e /proc/sys/fs/binfmt_misc/rosetta' 2>/dev/null; then
          echo "Rosetta active -- amd64 images translate via Rosetta." >&2
          return
        fi
        # `systemctl start` (not restart) re-checks the unit's
        # ConditionPathExists gate now that the marker exists, and is a
        # no-op if it somehow already ran.
        podman machine ssh "$machine" \
          'sudo touch /etc/containers/enable-rosetta \
           && sudo systemctl start rosetta-activation.service' 2>/dev/null || true
        if podman machine ssh "$machine" \
             'test -e /proc/sys/fs/binfmt_misc/rosetta' 2>/dev/null; then
          echo "Rosetta active -- amd64 images translate via Rosetta." >&2
        else
          echo "WARNING: Rosetta not active (needs macOS 26+; broken on" >&2
          echo "Sequoia). amd64 images will fall back to slow qemu-user." >&2
        fi
      }

      if [ "''${1:-}" = "--recreate" ]; then
        echo "recreating $machine (this destroys the VM disk + all images)..." >&2
        podman machine stop "$machine" 2>/dev/null || true
        podman machine rm -f "$machine" 2>/dev/null || true
        init
      elif ! podman machine inspect "$machine" >/dev/null 2>&1; then
        echo "no $machine found; creating..." >&2
        init
      else
        echo "reconciling $machine resources (rootful/cpus/memory)..." >&2
        podman machine stop "$machine" 2>/dev/null || true
        # `podman machine set --disk-size` only grows the disk and errors
        # if the value isn't strictly larger than the current size, so
        # only pass it when we're actually growing.
        set_args=(--rootful --cpus "$cpus" --memory "$memory")
        current_disk=$(podman machine inspect "$machine" \
          --format '{{.Resources.DiskSize}}' 2>/dev/null || echo 0)
        if [ "$disk" -gt "$current_disk" ]; then
          set_args+=(--disk-size "$disk")
        fi
        podman machine set "''${set_args[@]}" "$machine"
        podman machine start "$machine"
      fi

      ensure_rosetta
    '';
  };

  # Real Docker CLI + Compose v2 + buildx from nixpkgs (no daemon). The
  # client talks to the Podman machine's Docker-compatible socket via a
  # `docker context` (set up once; see docs/Code/podman.md). This replaces
  # the earlier podman-as-docker shim: `./stack` and the podman docs drive
  # `docker` / `docker compose`, which need the genuine CLI -- context
  # support and faithful compose networking/CMD that podman-compose lacks.
  # docker-client bundles no plugins, so compose + buildx are wired into
  # ~/.docker/cli-plugins by the activation script below.
  dockerCompose = pkgs.docker-compose;
  dockerBuildx = pkgs.docker-buildx;
in
{
  environment.systemPackages = [
    pkgs.podman
    pkgs.podman-compose
    reconcile
    pkgs.docker-client
    dockerCompose
    dockerBuildx
  ];

  # Podman's Docker-compat API has no BuildKit, but the modern docker CLI
  # defaults to it; force the classic builder (buildah underneath) so
  # `docker build` / `docker compose build` work against the podman socket.
  environment.variables.DOCKER_BUILDKIT = "0";

  # Materialize containers.conf into the primary user's home. macOS podman
  # reads ~/.config, not /etc. nix-darwin only runs the fixed-name
  # activation hooks (pre/post/extraActivation), so this MUST hang off
  # postActivation -- an arbitrary-named script is silently never run.
  # Activation runs as root, so install with the user's ownership.
  system.activationScripts.postActivation.text =
    let
      user = config.system.primaryUser;
      home = "/Users/${user}";
    in
    ''
      echo "installing containers.conf for ${user}..." >&2
      /usr/bin/install -d -o ${user} -m 0755 "${home}/.config/containers"
      /usr/bin/install -o ${user} -m 0644 \
        ${containersConf} "${home}/.config/containers/containers.conf"

      echo "wiring docker cli-plugins (compose, buildx) for ${user}..." >&2
      /usr/bin/install -d -o ${user} -m 0755 "${home}/.docker" "${home}/.docker/cli-plugins"
      /bin/ln -sfn ${dockerCompose}/bin/docker-compose "${home}/.docker/cli-plugins/docker-compose"
      /bin/ln -sfn ${dockerBuildx}/bin/docker-buildx "${home}/.docker/cli-plugins/docker-buildx"
      /usr/sbin/chown -h ${user} \
        "${home}/.docker/cli-plugins/docker-compose" \
        "${home}/.docker/cli-plugins/docker-buildx"
    '';
}
