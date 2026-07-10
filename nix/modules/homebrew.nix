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

    # Intentional holdouts. C++ toolchain/libs stay until per-project
    # nix dev shells exist; llvm is keg-only here, and nix clang in
    # systemPackages would shadow /usr/bin/clang. postgres has data
    # under /opt/homebrew/var; ollama is a launchd service; nvm is a
    # deferred workflow decision; tap tools have no nixpkgs equivalent.
    brews = [
      "catch2"
      "cli11"
      "eigen"
      # Now in homebrew/core; the installed keg identifies as core, so a
      # tap-qualified name here makes `cleanup` uninstall it.
      "hookdeck"
      "llvm"
      "nlohmann-json"
      "nvm"
      "ollama"
      "postgresql@17"
      "raylib"
      "schpet/tap/linear"
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
      "standard-notes"
      "sublime-merge"
      "zoom"
    ];
  };
}
