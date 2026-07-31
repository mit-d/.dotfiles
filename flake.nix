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
