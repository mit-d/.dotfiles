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

    users.${user} = {
      home.stateVersion = "26.05";

      programs.firefox = {
        enable = true;

        # Nightly comes from the homebrew cask. nixpkgs' firefox does not
        # build usefully on darwin, and Nightly is not in nixpkgs at all;
        # package = null makes this module manage config only.
        package = null;

        # Policies are delivered by system.defaults.CustomUserPreferences
        # instead (see the bottom of this file). Leaving this set would make
        # home-manager run `defaults import`, which replaces the entire
        # domain and would drop Nightly's own Cocoa window state on every
        # switch.
        darwinDefaultsId = null;

        # The live profiles.ini is Version=2; home-manager defaults this to
        # null on darwin, which omits the line entirely.
        profileVersion = 2;

        profiles.default-nightly = {
          id = 0;
          isDefault = true;

          # Must match the on-disk directory. This option defaults to the
          # attribute name ("default-nightly"), which would point Firefox at
          # a directory that does not exist. home-manager prepends
          # "Profiles/" itself on darwin, so it must not appear here.
          path = "hszus8yz.default-nightly";

          storeId = "489c2007";
        };
      };
    };
  };
}
