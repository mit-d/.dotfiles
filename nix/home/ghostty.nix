{ lib, pkgs, ... }:
let
  # The same palette Firefox is themed from, so the terminal and the browser
  # cannot drift apart. Ghostty does ship a builtin "Gruvbox Dark Hard" whose
  # values happen to match this file exactly today -- generating the theme
  # instead means a future edit to the palette reaches every surface at once,
  # rather than silently leaving the terminal behind.
  palette = import ../palettes/gruvbox-dark-hard.nix;
in
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

      # Theme and Appearance. Generated below from the shared palette rather
      # than naming Ghostty's builtin, and dark-only: the palette file has no
      # light variant, and window-theme plus AppleInterfaceStyle are both dark.
      theme = "gruvbox-dark-hard";

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

      # Cursor. Deliberately overrides the theme's cursor colour with gruvbox
      # bright orange, which reads far better against bg0_hard than the theme's
      # default of plain foreground.
      cursor-style = "block";
      cursor-opacity = 1.0;
      cursor-color = palette.brightOrange;

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

    # Generated from nix/palettes/gruvbox-dark-hard.nix. The ANSI slots follow
    # the canonical gruvbox mapping: 0-7 are the normal colours (with 7 as fg4,
    # the dimmest foreground) and 8-15 the bright ones (with 15 as fg1).
    #
    # The previous DerekMinimal theme was removed rather than kept: it was a
    # Dracula-derived palette that nothing referenced -- `theme` pointed at
    # Monokai -- so it was dead config, and it contradicts standardising on
    # gruvbox. It is in git history if it is ever wanted back.
    themes.gruvbox-dark-hard = {
      palette = [
        "0=${palette.bg0_hard}"
        "1=${palette.red}"
        "2=${palette.green}"
        "3=${palette.yellow}"
        "4=${palette.blue}"
        "5=${palette.purple}"
        "6=${palette.aqua}"
        "7=${palette.fg4}"
        "8=${palette.gray}"
        "9=${palette.brightRed}"
        "10=${palette.brightGreen}"
        "11=${palette.brightYellow}"
        "12=${palette.brightBlue}"
        "13=${palette.brightPurple}"
        "14=${palette.brightAqua}"
        "15=${palette.fg1}"
      ];
      background = palette.bg0_hard;
      foreground = palette.fg1;
      cursor-color = palette.fg1;
      cursor-text = palette.bg0_hard;
      selection-background = palette.bg3;
      selection-foreground = palette.fg1;
    };
  };
}
