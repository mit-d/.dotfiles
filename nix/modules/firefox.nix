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
    # Firefox owns several of the files this module will take over.
    backupFileExtension = "hm-bak";

    users.${user}.home.stateVersion = "26.05";
  };
}
