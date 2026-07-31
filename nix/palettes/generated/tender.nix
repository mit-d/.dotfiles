# tender -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tender.yaml
# Author: Jacobo Tabernero (https://github/com/jacoborus/tender.vim)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tender.nix. Edits here are lost on the
# next run.

{
  name = "tender";
  displayName = "tender";
  author = "Jacobo Tabernero (https://github/com/jacoborus/tender.vim)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#282828";
  surfaceDim = "#1b1b1b";
  surfaceBright = "#555555";
  surfaceContainerLowest = "#1b1b1b";
  surfaceContainerLow = "#282828";
  surfaceContainer = "#383838";
  surfaceContainerHigh = "#464646";
  surfaceContainerHighest = "#555555";
  surfaceVariant = "#383838";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#feffff";
  onSurface = "#eeeeee";
  onSurfaceMuted = "#d3d3d3";
  onSurfaceVariant = "#b8b8b8";
  onSurfaceFaint = "#5c5c5c";

  # --- Borders and dividers -----------------------------------------------
  outline = "#646464";
  outlineVariant = "#484848";

  # --- Accent roles -------------------------------------------------------
  primary = "#b3deef";
  onPrimary = "#282828";
  primaryContainer = "#59676d";
  onPrimaryContainer = "#feffff";
  secondary = "#73cef4";
  onSecondary = "#282828";
  tertiary = "#d3b987";
  onTertiary = "#282828";
  error = "#f43753";
  onError = "#ffffff";
  inverseSurface = "#eeeeee";
  inverseOnSurface = "#282828";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#383838";
    red = "#f43753";
    green = "#c9d05c";
    yellow = "#ffc24b";
    blue = "#b3deef";
    magenta = "#d3b987";
    cyan = "#73cef4";
    white = "#eeeeee";
    brightBlack = "#4c4c4c";
    brightRed = "#ff5f6c";
    brightGreen = "#dce470";
    brightYellow = "#ffdc9f";
    brightBlue = "#ccf1ff";
    brightMagenta = "#e7cc9a";
    brightCyan = "#98e0ff";
    brightWhite = "#feffff";
  };

  orange = "#dc9656";
  brightOrange = "#f0a969";
  cursor = "#b3deef";

  tools = {
    bat = "ansi";
  };
}
