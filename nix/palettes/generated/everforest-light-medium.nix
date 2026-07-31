# Everforest Light (Medium) -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/everforest-light-medium.yaml
# Author: Marcio Sobel (https://github.com/marciosobel)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/everforest-light-medium.nix. Edits here are lost on the
# next run.

{
  name = "everforest-light-medium";
  displayName = "Everforest Light (Medium)";
  author = "Marcio Sobel (https://github.com/marciosobel)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fdf6e3";
  surfaceDim = "#fffdf9";
  surfaceBright = "#e5e1cb";
  surfaceContainerLowest = "#fffdf9";
  surfaceContainerLow = "#fdf6e3";
  surfaceContainer = "#f4f0d9";
  surfaceContainerHigh = "#ede9d2";
  surfaceContainerHighest = "#e5e1cb";
  surfaceVariant = "#f4f0d9";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#2d353b";
  onSurface = "#5c6a72";
  onSurfaceMuted = "#6e7d79";
  onSurfaceVariant = "#79877a";
  onSurfaceFaint = "#939f91";

  # --- Borders and dividers -----------------------------------------------
  outline = "#939f91";
  outlineVariant = "#d6d3bf";

  # --- Accent roles -------------------------------------------------------
  primary = "#3a94c5";
  onPrimary = "#ffffff";
  primaryContainer = "#b7d1da";
  onPrimaryContainer = "#2d353b";
  secondary = "#35a77c";
  onSecondary = "#ffffff";
  tertiary = "#df69ba";
  onTertiary = "#ffffff";
  error = "#f85552";
  onError = "#ffffff";
  inverseSurface = "#5c6a72";
  inverseOnSurface = "#fdf6e3";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f4f0d9";
    red = "#f85552";
    green = "#8da101";
    yellow = "#dfa000";
    blue = "#3a94c5";
    magenta = "#df69ba";
    cyan = "#35a77c";
    white = "#5c6a72";
    brightBlack = "#939f91";
    brightRed = "#e24040";
    brightGreen = "#7c8e00";
    brightYellow = "#c78f00";
    brightBlue = "#2382b2";
    brightMagenta = "#ca56a7";
    brightCyan = "#18946a";
    brightWhite = "#2d353b";
  };

  orange = "#f57d26";
  brightOrange = "#df6a00";
  cursor = "#3a94c5";

  tools = {
    bat = "ansi";
  };
}
