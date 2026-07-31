{ lib, pkgs, ... }:
let
  # The same palette Firefox is themed from, so the terminal and the browser
  # cannot drift apart. Ghostty does ship a builtin "Gruvbox Dark Hard" whose
  # values happen to match this file exactly today -- generating the theme
  # instead means a future edit to the palette reaches every surface at once,
  # rather than silently leaving the terminal behind.
  palette = import ../palettes/active.nix;
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
      window-theme = palette.variant;
      window-save-state = "always";

      # Theme and Appearance, both driven by the palette so a swap reaches them.
      # The theme itself is generated at the bottom of this file.
      theme = palette.name;

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
      # NOTE `no-cursor`: the per-vi-mode cursor shape is driven by
      # zsh/.zsh/interactive.zsh instead, not by Ghostty's integration.
      #
      # Ghostty's `cursor` feature hardcodes a *blinking* block for
      # vicmd/visual, which is disorienting in normal mode -- the eye loses the
      # caret mid-motion. Neither built-in escape works:
      #
      #   - `cursor:steady` is syntax the integration *script* understands in
      #     $GHOSTTY_SHELL_FEATURES, but Ghostty's config parser rejects it
      #     outright: `shell-integration-features: invalid value`.
      #   - `cursor-style-blink = false` is documented as "just the default
      #     state; running programs may override the cursor style using
      #     DECSCUSR", and the integration does exactly that -- so it loses.
      #
      # Doing it in zsh also gives per-mode control the feature never had:
      # steady block in normal, blinking bar left alone in insert.
      shell-integration-features = "no-cursor,sudo,title";

      # Keybindings
      keybind = [
        "super+t=new_tab"
        "super+w=close_surface"
        "super+shift+t=new_tab"
        "super+equal=increase_font_size:1"
        "super+minus=decrease_font_size:1"
        "super+zero=reset_font_size"
      ];

      # Cursor.
      #
      # cursor-style is only the *static fallback*. In an interactive zsh the
      # shape is driven live by the `cursor` entry in shell-integration-features
      # below: Ghostty's zsh integration hooks zle's keymap-select and emits
      # DECSCUSR, so the cursor is a bar in insert mode and a block in
      # normal/visual. That is intended -- do not "fix" the apparent
      # contradiction by dropping `cursor` from the feature list, which would
      # lose the per-mode shape entirely.
      #
      # `cursor:steady` in that list would make the block non-blinking. Note
      # upstream's own caveat that this implementation can leak a blinking block
      # into external commands such as fzf.
      cursor-style = "block";
      cursor-opacity = 1.0;
      cursor-color = palette.cursor;

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
      background-opacity = 0.99;
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

    # Generated from whichever palette nix/palettes/active.nix points at, and
    # named after it, so swapping palettes swaps this theme wholesale rather than
    # leaving a file called "gruvbox" full of some other theme's colours.
    #
    # Slots come straight from the palette's `ansi` attrset rather than being
    # improvised from surface/text roles: terminals address these by index, and
    # every palette states all 16 explicitly for exactly this reason.
    #
    # The previous DerekMinimal theme was removed rather than kept: it was a
    # Dracula-derived palette that nothing referenced -- `theme` pointed at
    # Monokai -- so it was dead config, and it contradicts having one palette.
    themes.${palette.name} = {
      palette = [
        "0=${palette.ansi.black}"
        "1=${palette.ansi.red}"
        "2=${palette.ansi.green}"
        "3=${palette.ansi.yellow}"
        "4=${palette.ansi.blue}"
        "5=${palette.ansi.magenta}"
        "6=${palette.ansi.cyan}"
        "7=${palette.ansi.white}"
        "8=${palette.ansi.brightBlack}"
        "9=${palette.ansi.brightRed}"
        "10=${palette.ansi.brightGreen}"
        "11=${palette.ansi.brightYellow}"
        "12=${palette.ansi.brightBlue}"
        "13=${palette.ansi.brightMagenta}"
        "14=${palette.ansi.brightCyan}"
        "15=${palette.ansi.brightWhite}"
      ];
      background = palette.surface;
      foreground = palette.onSurface;
      cursor-color = palette.cursor;
      cursor-text = palette.surface;
      selection-background = palette.surfaceContainerHighest;
      selection-foreground = palette.onSurface;
    };
  };
}
