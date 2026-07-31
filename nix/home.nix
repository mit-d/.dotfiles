{ config, ... }:
let
  user = config.system.primaryUser;
in
{
  # home-manager's nix-darwin integration resolves the home directory from
  # users.users.<name>.home, which this flake has never declared. Declaring
  # `home` alone does not make nix-darwin manage or create the account --
  # that requires listing the user in users.knownUsers.
  users.users.${user}.home = "/Users/${user}";

  home-manager = {
    # Stay on the flake's nixpkgs rather than home-manager's own.
    useGlobalPkgs = true;

    # Move pre-existing real files aside instead of aborting activation.
    backupFileExtension = "hm-bak";

    users.${user} = {
      home.stateVersion = "26.05";

      # Per-tool modules. Kept platform-agnostic so a future NixOS or
      # standalone home-manager configuration can import the same list.
      imports = [
        ./home/bash.nix
        ./home/tmux.nix
        ./home/git.nix
        ./home/mpv.nix
        ./home/ghostty.nix
        ./home/nvim.nix
        ./home/fish.nix
        ./home/zsh.nix
        ./home/zoxide.nix
        ./home/k9s.nix
        ./home/fzf.nix
        ./home/btop.nix
        ./home/bat.nix
        ./home/obsidian.nix
        ./home/jetbrains.nix
      ];
    };
  };
}
