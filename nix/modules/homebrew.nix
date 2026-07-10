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
      "molovo/revolver"
      "schpet/tap"
      "zunit-zsh/zunit"
    ];

    brews = [
      "catch2"
      "cli11"
      "eigen"
      "fish"
      # Now in homebrew/core; the installed keg identifies as core, so a
      # tap-qualified name here makes `cleanup` uninstall it.
      "hookdeck"
      "jupyterlab"
      # Keg-only toolchain holdout: nix clang in systemPackages would
      # shadow /usr/bin/clang system-wide. Revisit with dev shells.
      "llvm"
      "nlohmann-json"
      "nvm"
      "ollama"
      "opencode"
      "postgresql@17"
      "python@3.12"
      "raylib"
      "schpet/tap/linear"
      "spdlog"
      "zsh-autosuggestions"
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
      "standard-notes"
      "sublime-merge"
      "zoom"
    ];
  };
}
