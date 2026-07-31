{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      # The flake is the source of truth: brew packages not declared
      # here are removed on the next switch.
      cleanup = "uninstall";
    };

    taps = [ "hookdeck/hookdeck" ];

    # Only genuine holdouts remain.
    #
    # The C++ libraries (catch2, cli11, eigen, nlohmann-json, raylib, spdlog)
    # and nvm are gone: per-project nix dev shells are how those dependencies
    # get provided now. All six libraries were leaves -- `brew uses --installed`
    # reported no consumers -- so removing them broke nothing, and all six are
    # in nixpkgs with darwin support when a dev shell needs them.
    #
    # ollama moved to nix/modules/packages.nix. The old comment here claimed it
    # was a launchd service, but `brew services list` reported it as `none`, so
    # there was no service to preserve.
    brews = [
      # Not in nixpkgs under any name; comes from the tap above.
      "hookdeck"
    ];

    # Casks stay on Homebrew deliberately, even though nixpkgs has darwin builds
    # for most of them. Two reasons outweigh the tidiness of moving them:
    #
    #  - They self-update. Pinning them to nixpkgs means security fixes for a
    #    browser, a password manager and a conferencing client arrive only when
    #    someone runs `nix flake update`. That is a worse posture, not a better
    #    one.
    #  - macOS binds TCC grants (Accessibility, Camera, Microphone, Screen
    #    Recording, Full Disk Access) to an app's path and signature, so moving a
    #    bundle into the nix store resets them. Ghostty made this concrete:
    #    replacing its cask relocated the bundle and invalidated a ZDOTDIR that a
    #    long-lived tmux server had captured, which silently stopped every new
    #    shell from loading its config. Raycast, 1Password and Zoom depend on
    #    those permissions far more than Ghostty did.
    #
    # sublime-merge and firefox@nightly have no usable darwin build in nixpkgs
    # regardless. slack-cli moved to packages.nix -- it is a plain CLI, so
    # neither reason above applies to it.
    casks = [
      "1password"
      "1password-cli"
      "bruno"
      "firefox@nightly"
      "google-chrome"
      "grandperspective"
      "jetbrains-toolbox"
      "linear"
      "obsidian"
      "raycast"
      "slack"
      "sublime-merge"
      "zoom"
    ];
  };
}
