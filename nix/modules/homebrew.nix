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

    taps = [
      "hookdeck/hookdeck"
    ];

    # Intentional holdouts. C++ libs stay until per-project nix dev
    # shells exist; ollama is a launchd service; nvm serves node projects
    # that don't yet have a dev shell (retires as each gets one; see the
    # ~/.dotfiles_wh vanguard shell); tap tools have no nixpkgs equivalent.
    brews = [
      "catch2"
      "cli11"
      "eigen"
      "hookdeck"
      "nlohmann-json"
      "nvm"
      "ollama"
      "raylib"
      "spdlog"
    ];

    casks = [
      "1password"
      "1password-cli"
      "bruno"
      "docker-desktop"
      "firefox@nightly"
      "ghostty"
      "google-chrome"
      "grandperspective"
      "jetbrains-toolbox"
      "linear"
      "obsidian"
      "raycast"
      "slack"
      "slack-cli"
      "sublime-merge"
      "zoom"
    ];
  };
}
