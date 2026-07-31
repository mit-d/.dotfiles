# Summerfruit Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/summerfruit-dark.yaml
# Author: Christopher Corley (http://christop.club/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/summerfruit-dark.nix. Edits here are lost on the
# next run.

{
  name = "summerfruit-dark";
  displayName = "Summerfruit Dark";
  author = "Christopher Corley (http://christop.club/)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#151515";
  surfaceDim = "#0b0b0b";
  surfaceBright = "#383838";
  surfaceContainerLowest = "#0b0b0b";
  surfaceContainerLow = "#151515";
  surfaceContainer = "#202020";
  surfaceContainerHigh = "#2c2c2c";
  surfaceContainerHighest = "#383838";
  surfaceVariant = "#202020";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#d0d0d0";
  onSurfaceMuted = "#c0c0c0";
  onSurfaceVariant = "#b0b0b0";
  onSurfaceFaint = "#505050";

  # --- Borders and dividers -----------------------------------------------
  outline = "#575756";
  outlineVariant = "#313131";

  # --- Accent roles -------------------------------------------------------
  primary = "#3777e6";
  onPrimary = "#0f0f0f";
  primaryContainer = "#24395d";
  onPrimaryContainer = "#ffffff";
  secondary = "#1faaaa";
  onSecondary = "#151515";
  tertiary = "#ad00a1";
  onTertiary = "#ffffff";
  error = "#ff0086";
  onError = "#151515";
  inverseSurface = "#d0d0d0";
  inverseOnSurface = "#151515";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#202020";
    red = "#ff0086";
    green = "#00c918";
    yellow = "#aba800";
    blue = "#3777e6";
    magenta = "#ad00a1";
    cyan = "#1faaaa";
    white = "#d0d0d0";
    brightBlack = "#505050";
    brightRed = "#ff5e9a";
    brightGreen = "#34dd38";
    brightYellow = "#bebb2d";
    brightBlue = "#498afb";
    brightMagenta = "#c229b4";
    brightCyan = "#3dbdbd";
    brightWhite = "#ffffff";
  };

  orange = "#fd8900";
  brightOrange = "#ffa763";
  cursor = "#3777e6";

  tools = {
    bat = "ansi";
  };
}
