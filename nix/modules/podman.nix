{ config, pkgs, ... }:
let
  # Single source of truth for the applehv VM's resources. Mirrored into
  # both the declarative containers.conf (read by `podman machine init`)
  # and the reconcile script below, so the two never drift.
  machine = {
    cpus = 5;
    memory = 16384; # MiB (16 GiB)
    diskSize = 100; # GiB
  };

  # macOS podman reads ~/.config/containers/containers.conf, NOT /etc, so
  # this is materialized into the user's home by the activation script
  # rather than via environment.etc. `rosetta = true` is the key line: it
  # makes a freshly-init'd machine translate amd64 images (jaguar-debug/
  # celery) via Rosetta 2 instead of slow qemu userspace emulation.
  containersConf = pkgs.writeText "containers.conf" ''
    [machine]
    cpus = ${toString machine.cpus}
    memory = ${toString machine.memory}
    disk_size = ${toString machine.diskSize}
    provider = "applehv"
    rosetta = true
  '';

  # Reconciles the imperative `podman machine` VM to the pinned settings
  # above. nix-darwin can't declare machine state, so this is how the
  # tuning becomes repeatable. `--recreate` does the destructive rebuild
  # (needed to flip Rosetta, which is init-only).
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

      if [ "''${1:-}" = "--recreate" ]; then
        echo "recreating $machine (this destroys the VM disk + all images)..." >&2
        podman machine stop "$machine" 2>/dev/null || true
        podman machine rm -f "$machine" 2>/dev/null || true
        init
      elif ! podman machine inspect "$machine" >/dev/null 2>&1; then
        echo "no $machine found; creating..." >&2
        init
      else
        echo "reconciling $machine resources (rootful/cpus/memory/disk)..." >&2
        podman machine stop "$machine" 2>/dev/null || true
        podman machine set \
          --rootful \
          --cpus "$cpus" \
          --memory "$memory" \
          --disk-size "$disk" \
          "$machine"
        podman machine start "$machine"
      fi

      rosetta=$(podman machine inspect "$machine" --format '{{.Rosetta}}' 2>/dev/null || echo unknown)
      if [ "$rosetta" != "true" ]; then
        echo "WARNING: Rosetta is '$rosetta' on $machine. amd64 images will run" >&2
        echo "under slow emulation. Rosetta is init-only -- run:" >&2
        echo "    podman-machine-reconcile --recreate" >&2
      else
        echo "Rosetta enabled -- amd64 images translate natively." >&2
      fi
    '';
  };
in
{
  environment.systemPackages = [
    pkgs.podman
    pkgs.podman-compose
    reconcile
  ];

  # Materialize containers.conf into the primary user's home. Activation
  # runs as root, so install with the user's ownership.
  system.activationScripts.podmanContainersConf.text =
    let
      home = "/Users/${config.system.primaryUser}";
      dir = "${home}/.config/containers";
    in
    ''
      echo "installing containers.conf for ${config.system.primaryUser}..." >&2
      /usr/bin/install -d -o ${config.system.primaryUser} -m 0755 "${dir}"
      /usr/bin/install -o ${config.system.primaryUser} -m 0644 \
        ${containersConf} "${dir}/containers.conf"
    '';
}
