# Gruvbox Dark Hard, expressed in the shared palette schema.
#
# Semantic roles use Material 3 names (`surface`, `onSurfaceVariant`,
# `surfaceContainerHigh`, `outline`, `primary`) rather than gruvbox's own
# (`bg0_hard`, `fg3`, `bg2`, `gray`), so a completely different theme can be
# dropped in by editing ./active.nix alone. See ./README.md for the full schema.
#
# Values are canonical gruvbox. Note this differs slightly from
# hypr/.config/hypr/palettes/gruvbox-dark-hard.conf, which is a partial
# 10-colour palette generated from a Ghostty theme and maps its `$orange` to
# #d79921 -- canonically gruvbox *yellow*.
{
  name = "gruvbox-dark-hard";
  variant = "dark";

  # Firefox compares this to decide whether to reinstall a policy-installed
  # theme; it does not notice that install_url points at a new store path. Bump
  # it whenever a colour below changes, or the edit will not take effect in an
  # already-installed profile.
  version = "2.0.0";

  # --- Material 3 semantic roles ---------------------------------------------
  #
  # Surfaces. "hard" refers to `surface` being darker than gruvbox's medium
  # variant (#282828, which is surfaceContainerLow here). The container ramp
  # runs away from `surface`: lighter for a dark theme, darker for a light one,
  # so consumers must not assume a direction.
  surface = "#1d2021";
  surfaceDim = "#1d2021";
  surfaceBright = "#504945";
  surfaceContainerLowest = "#1d2021";
  surfaceContainerLow = "#282828";
  surfaceContainer = "#3c3836";
  surfaceContainerHigh = "#504945";
  surfaceContainerHighest = "#665c54";
  surfaceVariant = "#3c3836";

  # Text on those surfaces, strongest to faintest.
  onSurfaceStrong = "#fbf1c7";
  onSurface = "#ebdbb2";
  onSurfaceMuted = "#d5c4a1";
  onSurfaceVariant = "#bdae93";
  onSurfaceFaint = "#a89984";

  # Borders and dividers.
  outline = "#928374";
  outlineVariant = "#504945";

  # Accent roles. gruvbox's signature is its warm yellow, so that is `primary`;
  # blue and aqua fall out as secondary/tertiary.
  primary = "#fabd2f";
  onPrimary = "#1d2021";
  primaryContainer = "#d79921";
  onPrimaryContainer = "#1d2021";

  secondary = "#83a598";
  onSecondary = "#1d2021";

  tertiary = "#8ec07c";
  onTertiary = "#1d2021";

  error = "#fb4934";
  onError = "#1d2021";

  # Inverted pair, for selections and "current line" style highlights.
  inverseSurface = "#ebdbb2";
  inverseOnSurface = "#1d2021";

  # --- ANSI 16 ---------------------------------------------------------------
  #
  # Kept separate and explicit because Material 3 has no notion of 16 indexed
  # colours, and terminals address them by number: Ghostty's `palette = N=...`,
  # fish's `fish_color_*`, k9s skins, tmux's colour names. Deriving these from
  # the M3 roles would be lossy in both directions, so a palette states both.
  #
  # gruvbox's `purple` and `aqua` occupy the magenta and cyan slots.
  ansi = {
    black = "#1d2021";
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    magenta = "#b16286";
    cyan = "#689d6a";
    white = "#a89984";

    brightBlack = "#928374";
    brightRed = "#fb4934";
    brightGreen = "#b8bb26";
    brightYellow = "#fabd2f";
    brightBlue = "#83a598";
    brightMagenta = "#d3869b";
    brightCyan = "#8ec07c";
    brightWhite = "#ebdbb2";
  };

  # Not an ANSI slot, but both gruvbox and solarized define one and it is the
  # most legible cursor against `surface`.
  orange = "#d65d0e";
  brightOrange = "#fe8019";

  cursor = "#fe8019";

  # --- Per-tool builtin theme names ------------------------------------------
  #
  # Some tools will not accept a list of hex values: bat themes are compiled
  # Sublime colour schemes and btop themes are their own file format. Both ship
  # builtins for common palettes, so the palette states its own name in each
  # tool's vocabulary rather than a consumer guessing. A palette with no builtin
  # would have to generate a real theme file instead.
  tools = {
    bat = "gruvbox-dark"; # `bat --list-themes`
    btop = "gruvbox_dark_v2"; # $out/share/btop/themes
  };
}
