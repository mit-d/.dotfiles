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

  # Trim /etc/zshrc down to what we actually use. Measured on this machine, the
  # generated /etc/zshrc accounted for ~75ms of a ~130ms interactive startup,
  # almost all of it work that ~/.zsh then overrides.
  #
  # Global compinit is the big one, and it is not merely redundant but wrong
  # here: /etc/zshrc runs it before ~/.zsh/completion.zsh has added
  # $ZDOTDIR/completions to fpath, so it never sees our completions and our own
  # compinit has to redo the work anyway. nix-darwin's own option docs describe
  # exactly this case -- "can be disabled if the user wants to extend its fpath
  # and a custom compinit call in the local config is required". Ours also has a
  # 24-hour cache-freshness check that the global call lacks. ~30ms warm,
  # ~220ms cold.
  programs.zsh.enableGlobalCompInit = false;

  # `promptinit && prompt suse` loads a theme that ~/.zsh/prompt.zsh replaces on
  # the first precmd. ~10ms.
  programs.zsh.promptInit = "";

  # bashcompinit exists to register bash-style completions. Nothing here does:
  # no `complete -F/-o/-C` anywhere in ~/.zsh, the work overlay, or the docker
  # completions (which are zsh-native). ~10ms.
  programs.zsh.enableBashCompletion = false;
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
