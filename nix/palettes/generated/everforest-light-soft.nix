# Everforest Light (Soft) -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/everforest-light-soft.yaml
# Author: Marcio Sobel (https://github.com/marciosobel)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/everforest-light-soft.nix. Edits here are lost on the
# next run.

{
  name = "everforest-light-soft";
  displayName = "Everforest Light (Soft)";
  author = "Marcio Sobel (https://github.com/marciosobel)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f3ead3";
  surfaceDim = "#faf1da";
  surfaceBright = "#dcd6bc";
  surfaceContainerLowest = "#faf1da";
  surfaceContainerLow = "#f3ead3";
  surfaceContainer = "#eae4ca";
  surfaceContainerHigh = "#e3ddc3";
  surfaceContainerHighest = "#dcd6bc";
  surfaceVariant = "#eae4ca";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#333c43";
  onSurface = "#5c6a72";
  onSurfaceMuted = "#677573";
  onSurfaceVariant = "#727f74";
  onSurfaceFaint = "#939f91";

  # --- Borders and dividers -----------------------------------------------
  outline = "#8d988c";
  outlineVariant = "#ccc8b2";

  # --- Accent roles -------------------------------------------------------
  primary = "#3a94c5";
  onPrimary = "#20262b";
  primaryContainer = "#b1cad0";
  onPrimaryContainer = "#333c43";
  secondary = "#35a77c";
  onSecondary = "#282f35";
  tertiary = "#df69ba";
  onTertiary = "#272e33";
  error = "#f85552";
  onError = "#22292e";
  inverseSurface = "#5c6a72";
  inverseOnSurface = "#f3ead3";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#eae4ca";
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
    brightWhite = "#333c43";
  };

  orange = "#f57d26";
  brightOrange = "#df6a00";
  cursor = "#3b8ebd";

  tools = {
    bat = "ansi";
  };
}
