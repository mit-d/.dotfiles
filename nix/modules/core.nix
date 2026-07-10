{ self, config, lib, ... }:
{
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # GUI apps (Ghostty, etc.) inherit launchd's environment, not the
  # shell's, so give launchd the nix system PATH. Lets app configs use
  # bare command names (e.g. Ghostty `command = tmux`). Apps pick it
  # up on next launch after activation. launchd env vars are literal
  # strings, so expand the $HOME systemPath placeholder ourselves.
  launchd.user.envVariables.PATH =
    lib.replaceStrings [ "$HOME" ] [ "/Users/derekmitten" ]
      config.environment.systemPath;

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;
  # Installs fish and registers it in /etc/shells.
  programs.fish.enable = true;

  # User-scoped options (homebrew, system.defaults) apply to this user
  # now that activation always runs as root.
  system.primaryUser = "derekmitten";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
