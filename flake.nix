{
  description = "Derek's dotfiles + nix-darwin system config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Upstream colour scheme data for nix/palettes. Not a flake, just YAML.
    # `nix flake update tinted-schemes` then `nix run .#gen-palettes` to refresh
    # the library.
    tinted-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      tinted-schemes,
      ...
    }:
    let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      warrantyhub = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit self; };
        modules = [
          ./nix/modules/core.nix
          ./nix/modules/packages.nix
          ./nix/modules/podman.nix
          ./nix/darwin/homebrew.nix
          ./nix/darwin/defaults.nix
          ./nix/darwin/fonts.nix
          ./nix/darwin/keyboard.nix
          ./nix/darwin/wallpaper.nix
          ./nix/darwin/obsidian-sync.nix
          home-manager.darwinModules.home-manager
          ./nix/home.nix
          ./nix/darwin/firefox.nix
        ];
      };
    in
    {
      darwinConfigurations."warrantyhub" = warrantyhub;
      # Hostname alias: lets `darwin-rebuild switch --flake ~/.dotfiles`
      # resolve without an explicit #attr (darwin-rebuild looks up the
      # local hostname, currently Dereks-MacBook-Pro).
      darwinConfigurations."Dereks-MacBook-Pro" = warrantyhub;

      formatter.aarch64-darwin = pkgs.nixfmt;

      # Every palette in the library, resolved through load.nix so overrides are
      # included, as one JSON file. Built and cached by nix, which is what lets
      # the picker below redraw a preview per keystroke instead of evaluating.
      packages.aarch64-darwin.palette-data =
        let
          index = import ./nix/palettes/generated/_index.nix;
          load = import ./nix/palettes/load.nix;
        in
        pkgs.writeText "palettes.json" (builtins.toJSON (builtins.mapAttrs (name: _: load name) index));

      # Regenerate nix/palettes/generated from the pinned schemes checkout.
      #
      # The generator writes into the working tree, not the store, so it needs
      # the repo path: it defaults to $PWD and takes an explicit path as its
      # first argument. bat's and btop's builtin theme lists come from the same
      # pinned nixpkgs the system is built from, so a palette never claims a
      # builtin that this nixpkgs does not have.
      apps.aarch64-darwin.gen-palettes = {
        type = "app";
        program =
          builtins.toString (
            pkgs.writeShellApplication {
              name = "gen-palettes";
              runtimeInputs = [
                pkgs.python3
                pkgs.nixfmt
                pkgs.bat
                pkgs.btop
              ];
              text = ''
                repo="''${1:-$PWD}"
                if [ ! -d "$repo/nix/palettes" ]; then
                  echo "gen-palettes: $repo is not the dotfiles repo" >&2
                  echo "  run from the repo root, or pass its path" >&2
                  exit 1
                fi

                # Isolate bat from the user's config so the list is builtins only.
                cache=$(mktemp -d)
                trap 'rm -rf "$cache"' EXIT
                BAT_THEMES=$(HOME="$cache" bat --no-config --list-themes)
                export BAT_THEMES
                export BTOP_THEMES_DIR="${pkgs.btop}/share/btop/themes"

                exec python3 ${./nix/palettes/generate.py} \
                  --schemes ${tinted-schemes} \
                  --out "$repo/nix/palettes/generated" \
                  --nixfmt "$(command -v nixfmt)"
              '';
            }
          )
          + "/bin/gen-palettes";
      };

      # Browse the library with a live colour preview:
      #
      #   nix run .#palettes
      #
      # enter prints the name and the line to paste; ctrl-a rewrites active.nix
      # in place. Needs a truecolour terminal, which Ghostty is.
      apps.aarch64-darwin.palettes = {
        type = "app";
        program =
          builtins.toString (
            pkgs.writeShellApplication {
              name = "palettes";
              runtimeInputs = [
                pkgs.fzf
                pkgs.python3
                pkgs.jq
              ];
              text = ''
                data=${self.packages.aarch64-darwin.palette-data}
                preview=${./nix/palettes/preview.py}

                active=""
                if [ -f "$PWD/nix/palettes/active.nix" ]; then
                  active=$(sed -n 's/^import \.\/load\.nix "\(.*\)"$/\1/p' \
                    "$PWD/nix/palettes/active.nix")
                fi

                selection=$(
                  jq -r 'keys[]' "$data" | fzf \
                    --ansi \
                    --expect=ctrl-a \
                    --preview "python3 $preview $data {}" \
                    --preview-window 'right,64%,border-none' \
                    --query "" \
                    --header "enter: print   ctrl-a: set active.nix''${active:+   (now: $active)}" \
                    --prompt 'palette> '
                ) || exit 0

                key=$(printf '%s\n' "$selection" | sed -n 1p)
                name=$(printf '%s\n' "$selection" | sed -n 2p)
                [ -n "$name" ] || exit 0

                if [ "$key" = "ctrl-a" ]; then
                  file="$PWD/nix/palettes/active.nix"
                  if [ ! -f "$file" ]; then
                    echo "palettes: no $file -- run from the repo root" >&2
                    exit 1
                  fi
                  # Only the import line changes; the comment above it stays.
                  tmp=$(mktemp)
                  sed "s|^import \./load\.nix \".*\"$|import ./load.nix \"$name\"|" \
                    "$file" >"$tmp"
                  mv "$tmp" "$file"
                  echo "active.nix -> $name"
                  echo "now: sudo darwin-rebuild switch --flake ~/.dotfiles"
                else
                  echo "import ./load.nix \"$name\""
                fi
              '';
            }
          )
          + "/bin/palettes";
      };

      # Print the active palette as a Slack sidebar theme:
      #
      #   nix run .#slack-theme            # active palette
      #   nix run .#slack-theme -- nord    # any palette in the library
      #
      # Slack has no config file worth writing to: the theme lives in
      # account-synced preferences, so this is a paste-once-per-palette step
      # rather than something a switch can do. Paste into Preferences ->
      # Appearance -> Custom theme, in the box under "Copy and paste these
      # values". Slack's message pane follows the OS light/dark setting, which
      # nix/darwin/defaults.nix already drives from the palette variant.
      apps.aarch64-darwin.slack-theme = {
        type = "app";
        program =
          builtins.toString (
            pkgs.writeShellApplication {
              name = "slack-theme";
              runtimeInputs = [ pkgs.jq ];
              text = ''
                data=${self.packages.aarch64-darwin.palette-data}
                name="''${1:-}"
                if [ -z "$name" ]; then
                  name=$(sed -n 's/^import \.\/load\.nix "\(.*\)"$/\1/p' \
                    "$PWD/nix/palettes/active.nix" 2>/dev/null) || true
                fi
                if [ -z "$name" ]; then
                  echo "slack-theme: pass a palette name, or run from the repo" >&2
                  exit 1
                fi
                if [ "$(jq -r --arg n "$name" 'has($n)' "$data")" != "true" ]; then
                  echo "slack-theme: no palette named '$name'" >&2
                  exit 1
                fi

                # The eight slots Slack's custom theme accepts, in its order:
                # Column BG, Menu BG Hover, Active Item, Active Item Text,
                # Hover Item, Text Color, Active Presence, Mention Badge.
                theme=$(jq -r --arg n "$name" '.[$n] |
                  [ .surfaceContainer,
                    .surfaceContainerHigh,
                    .primary,
                    .onPrimary,
                    .surfaceContainerHighest,
                    .onSurface,
                    .ansi.green,
                    .error
                  ] | join(",")' "$data")

                echo "$theme"
                if command -v pbcopy >/dev/null 2>&1; then
                  printf '%s' "$theme" | pbcopy
                  echo "(copied to clipboard)" >&2
                fi
                echo "paste into Slack: Preferences -> Appearance -> Custom theme" >&2
              '';
            }
          )
          + "/bin/slack-theme";
      };

      # Enforce the guarantees nix/palettes/README.md documents -- contrast
      # floors, text-ramp ordering, legible accent pairs -- across all 335.
      checks.aarch64-darwin.palettes =
        pkgs.runCommand "palette-validation" { nativeBuildInputs = [ pkgs.python3 ]; }
          ''
            python3 ${./nix/palettes/validate.py} \
              ${self.packages.aarch64-darwin.palette-data} | tee $out
          '';

      checks.aarch64-darwin.lint =
        pkgs.runCommand "nix-lint"
          {
            nativeBuildInputs = [
              pkgs.nixfmt
              pkgs.deadnix
              pkgs.statix
            ];
          }
          ''
            cd ${self}
            echo "== nixfmt --check =="
            nixfmt --check $(find . -name '*.nix')
            echo "== deadnix =="
            deadnix --fail .
            echo "== statix =="
            statix check .
            touch $out
          '';
    };
}
