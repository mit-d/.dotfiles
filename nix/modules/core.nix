{
  self,
  config,
  lib,
  pkgs,
  ...
}:
{
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Deduplicate the store on write and prune it weekly.
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 3;
      Minute = 0;
    };
    options = "--delete-older-than 30d";
  };

  # GUI apps (Ghostty, etc.) inherit launchd's environment, not the
  # shell's, so give launchd the nix system PATH. Lets app configs use
  # bare command names (e.g. Ghostty `command = tmux`). Apps pick it
  # up on next launch after activation. launchd env vars are literal
  # strings, so expand the $HOME systemPath placeholder ourselves.
  #
  # TODO: this seemed to work, but may be broken now. For Ghostty
  #  specifically, `command = tmux` breaks it (seems to try to use
  #  login shell). I've updated my conf there to use the absolute PATH
  #  of `/run/current-system/sw/bin/tmux` + added another TODO there
  launchd.user.envVariables.PATH =
    lib.replaceStrings [ "$HOME" ] [ "/Users/${config.system.primaryUser}" ]
      config.environment.systemPath;

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;
  # direnv + nix-direnv, wired via /etc/direnv/direnvrc from a real
  # /nix/store path (the hand-rolled version sourced a path
  # nix-darwin's pathsToLink never links).
  programs.direnv.enable = true;
  # Installs fish; environment.shells is what actually registers
  # shells in /etc/shells (for chsh).
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];

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
