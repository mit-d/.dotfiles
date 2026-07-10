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
      "age"
      "bat"
      "catch2"
      "clang-format"
      "cli11"
      "cmake"
      "cmatrix"
      "codespell"
      "cowsay"
      "csvkit"
      "eigen"
      "fastfetch"
      "fd"
      "fish"
      "fonttools"
      "fx"
      "fzf"
      "gawk"
      "gh"
      "git-quick-stats"
      "glab"
      "gnu-getopt"
      "gnu-sed"
      "go"
      "go-task"
      "gradle"
      # Now in homebrew/core; the installed keg identifies as core, so a
      # tap-qualified name here makes `cleanup` uninstall it.
      "hookdeck"
      "htop"
      "imagemagick"
      "jira-cli"
      "jq"
      "jupyterlab"
      "k9s"
      "lcov"
      "lefthook"
      "lftp"
      "llvm"
      "markdownlint-cli2"
      "most"
      "mpv"
      "ncdu"
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
      "pv"
      "python@3.12"
      "raylib"
      "ruff"
      "schpet/tap/linear"
      "shellcheck"
      "shfmt"
      "spdlog"
      "stow"
      "taplo"
      "tmux"
      "tree"
      "tree-sitter-cli"
      "uv"
      "whisper-cpp"
      "yq"
      "zsh-autosuggestions"
    ];

    casks = [
      "1password"
      "1password-cli"
      "bruno"
      "docker-desktop"
      "firefox@nightly"
      "font-noto-color-emoji"
      "font-noto-sans"
      "font-noto-sans-cjk"
      "font-noto-sans-math"
      "font-noto-sans-mono"
      "font-noto-sans-symbols"
      "font-noto-sans-symbols-2"
      "font-noto-serif"
      "font-noto-serif-cjk"
      "font-sauce-code-pro-nerd-font"
      "font-source-code-pro"
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
