{
  description = "Derek's dotfiles + nix-darwin system config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
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
