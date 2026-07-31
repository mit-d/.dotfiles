{ lib, pkgs, ... }:
{
  # Nothing needed to surface the .app: at home.stateVersion >= 25.11
  # targets.darwin.copyApps is enabled by default and copies bundles from the
  # user profile into ~/Applications/Home Manager Apps. (linkApps is the older
  # mechanism, off by default at this stateVersion, and the two are mutually
  # exclusive -- enabling it here fails the build on conflicting assertions.)
  #
  # Note the app's path changes versus the Homebrew cask
  # (/Applications/Ghostty.app), so macOS treats it as a different app: any TCC
  # grants (Accessibility, Full Disk Access) need re-approving, and a pinned Dock
  # icon needs re-pinning.

  programs.ghostty = {
    enable = true;

    # nixpkgs splits ghostty by platform: `ghostty` is a source build limited
    # to Linux, while `ghostty-bin` repackages upstream's prebuilt macOS app
    # (building it from source needs Xcode and Swift). Both were 1.3.1 when
    # this replaced the Homebrew cask, so the swap was version-neutral.
    #
    # A real derivation here rather than null also buys config validation:
    # home-manager attaches `ghostty +validate-config` as an onChange hook on
    # the generated config, so an unknown field or malformed value surfaces at
    # `darwin-rebuild switch` (it exits 1) rather than being silently ignored,
    # which is what happened under the cask with package = null. Note this is
    # activation-time and only fires when the config actually changes -- it is
    # not a build-time gate.
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

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

      # Appearance. These were previously duplicated across a darwin /
      # non-darwin split, because the two sets of values came from two stow
      # packages -- `ghostty/config` (shared with Arch) and
      # `ghostty-osx/config-osx`. There is one host now, so one set of values.
      window-decoration = true;
      font-size = 16;
      background-opacity = 0.80;
      unfocused-split-opacity = 0.61;
      background-blur = true;

      # Bypass /usr/bin/login for faster startup. An exact store path, not
      # `tmux` (needs launchd PATH) and not /run/current-system/sw/bin/tmux
      # (a generation symlink that is not reliably resolvable at login,
      # which is what the standing TODO documented).
      command = "${pkgs.tmux}/bin/tmux";
    }
    # The only genuinely platform-exclusive keys left. ghostty exits non-zero on
    # unknown fields, and the +validate-config onChange hook runs on activation,
    # so one of these leaking onto a non-darwin host would be caught at switch
    # rather than silently ignored.
    // lib.optionalAttrs pkgs.stdenv.isDarwin {
      macos-option-as-alt = true;
      macos-titlebar-style = "hidden";
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
