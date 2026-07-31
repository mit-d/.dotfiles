# Everforest Light (Hard) -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/everforest-light-hard.yaml
# Author: Marcio Sobel (https://github.com/marciosobel)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/everforest-light-hard.nix. Edits here are lost on the
# next run.

{
  name = "everforest-light-hard";
  displayName = "Everforest Light (Hard)";
  author = "Marcio Sobel (https://github.com/marciosobel)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fffbef";
  surfaceDim = "#ffffff";
  surfaceBright = "#e9e6d6";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fffbef";
  surfaceContainer = "#f8f5e4";
  surfaceContainerHigh = "#f1eedd";
  surfaceContainerHighest = "#e9e6d6";
  surfaceVariant = "#f8f5e4";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#272e33";
  onSurface = "#5c6a72";
  onSurfaceMuted = "#6f7d7a";
  onSurfaceVariant = "#7c8a7c";
  onSurfaceFaint = "#939f91";

  # --- Borders and dividers -----------------------------------------------
  outline = "#939f91";
  outlineVariant = "#d8d7c9";

  # --- Accent roles -------------------------------------------------------
  primary = "#3a94c5";
  onPrimary = "#20262b";
  primaryContainer = "#b8d4e1";
  onPrimaryContainer = "#272e33";
  secondary = "#35a77c";
  onSecondary = "#272e33";
  tertiary = "#df69ba";
  onTertiary = "#272e33";
  error = "#f85552";
  onError = "#22292d";
  inverseSurface = "#5c6a72";
  inverseOnSurface = "#fffbef";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f8f5e4";
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
    brightWhite = "#272e33";
  };

  orange = "#f57d26";
  brightOrange = "#df6a00";
  cursor = "#3a94c5";

  tools = {
    bat = "ansi";
  };
}
