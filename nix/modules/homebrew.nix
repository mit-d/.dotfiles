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
      "clang-format"
      "cli11"
      "cmake"
      "eigen"
      "fish"
      "fonttools"
      "go"
      "gradle"
      # Now in homebrew/core; the installed keg identifies as core, so a
      # tap-qualified name here makes `cleanup` uninstall it.
      "hookdeck"
      "imagemagick"
      "jupyterlab"
      "lcov"
      "lefthook"
      "llvm"
      "markdownlint-cli2"
      "mpv"
      "neovim"
      "newsboat"
      "ninja"
      "nlohmann-json"
      "nvm"
      "ollama"
      "opencode"
      "openjdk@21"
      "postgresql@17"
      "prettier"
      "python@3.12"
      "raylib"
      "ruff"
      "schpet/tap/linear"
      "spdlog"
      "tmux"
      "uv"
      "whisper-cpp"
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
