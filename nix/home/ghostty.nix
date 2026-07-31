{ lib, pkgs, ... }:
{
  programs.ghostty = {
    enable = true;

    # Ghostty is installed as a Homebrew cask on darwin, and nixpkgs has no
    # usable darwin build. package = null makes this module manage config
    # only -- the same arrangement firefox.nix uses. On NixOS this should
    # become the real pkgs.ghostty.
    package = null;

    settings = {
      # Window
      window-height = 30;
      window-width = 120;
      window-padding-balance = true;
      window-padding-x = 12;
      window-padding-y = 8;
      window-inherit-working-directory = true;
      window-theme = "dark";
      window-save-state = "always";

      # Theme and Appearance
      theme = "dark:Monokai Remastered,light:Monokai Pro Light Sun";

      # Font. Repeated keys become a list -- programs.ghostty sets
      # listsAsDuplicateKeys, so each element emits its own font-family line.
      # The list is generated from the original config; see the plan, Task 6.
      font-family = import ./ghostty-fonts.nix;
      font-style = "Regular";
      font-style-bold = "Bold";
      font-style-italic = "Italic";
      font-style-bold-italic = "Bold Italic";

      # Performance and rendering
      resize-overlay = "after-first";
      resize-overlay-duration = "500ms";

      # Shell integration
      shell-integration = "zsh";
      shell-integration-features = "cursor,sudo,title";

      # Keybindings
      keybind = [
        "super+t=new_tab"
        "super+w=close_surface"
        "super+shift+t=new_tab"
        "super+equal=increase_font_size:1"
        "super+minus=decrease_font_size:1"
        "super+zero=reset_font_size"
      ];

      # Cursor
      cursor-style = "block";
      cursor-opacity = 1.0;
      cursor-color = "#fe8019";

      # Copy/paste
      copy-on-select = false;
      clipboard-paste-protection = true;

      # Mouse
      mouse-hide-while-typing = true;
      mouse-shift-capture = true;

      # Terminal features
      link-url = true;
      osc-color-report-format = "8-bit";
    }
    # Replaces the old `config-file = ?config-osx` overlay. Same values as
    # ghostty-osx/.config/ghostty/config-osx.
    // lib.optionalAttrs pkgs.stdenv.isDarwin {
      # Bypass /usr/bin/login for faster startup. An exact store path, not
      # `tmux` (needs launchd PATH) and not /run/current-system/sw/bin/tmux
      # (a generation symlink that is not reliably resolvable at login,
      # which is what the standing TODO documented).
      command = "${pkgs.tmux}/bin/tmux";

      macos-option-as-alt = true;
      macos-titlebar-style = "hidden";

      # Overrides the cross-platform values above.
      window-decoration = true;
      font-size = 16;
      background-opacity = 0.80;
      unfocused-split-opacity = 0.61;
      background-blur = true;
    }
    // lib.optionalAttrs (!pkgs.stdenv.isDarwin) {
      window-decoration = false;
      font-size = 14;
      background-opacity = 0.70;
      unfocused-split-opacity = 0.55;
    };

    # From ghostty/.config/ghostty/themes/DerekMinimal.
    themes.DerekMinimal = {
      palette = [
        "0=#21222C"
        "1=#FF5555"
        "2=#50FA7B"
        "3=#F1FA8C"
        "4=#BD93F9"
        "5=#FF79C6"
        "6=#8BE9FD"
        "7=#F8F8F2"
        "8=#21222C"
        "9=#FF5555"
        "10=#50FA7B"
        "11=#F1FA8C"
        "12=#BD93F9"
        "13=#FF79C6"
        "14=#8BE9FD"
        "15=#F8F8F2"
      ];
      background = "#282A36";
      foreground = "#F8F8F2";
      cursor-color = "#f2d5cf";
      cursor-text = "#c6d0f5";
      selection-background = "#626880";
      selection-foreground = "#c6d0f5";
    };
  };
}
