# Tinta -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tinta.yaml
# Author: Teshre
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tinta.nix. Edits here are lost on the
# next run.

{
  name = "tinta";
  displayName = "Tinta";
  author = "Teshre";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#101012";
  surfaceDim = "#050507";
  surfaceBright = "#3b3b3f";
  surfaceContainerLowest = "#050507";
  surfaceContainerLow = "#101012";
  surfaceContainer = "#202023";
  surfaceContainerHigh = "#2d2d31";
  surfaceContainerHighest = "#3b3b3f";
  surfaceVariant = "#202023";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#eeece6";
  onSurface = "#d8d6d0";
  onSurfaceMuted = "#bab9b6";
  onSurfaceVariant = "#9d9c9d";
  onSurfaceFaint = "#62626a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#62626a";
  outlineVariant = "#2e2e31";

  # --- Accent roles -------------------------------------------------------
  primary = "#8a9ab0";
  onPrimary = "#101012";
  primaryContainer = "#3a3f48";
  onPrimaryContainer = "#eeece6";
  secondary = "#80b8b4";
  onSecondary = "#101012";
  tertiary = "#b0a0b8";
  onTertiary = "#101012";
  error = "#d0726a";
  onError = "#101012";
  inverseSurface = "#d8d6d0";
  inverseOnSurface = "#101012";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#202023";
    red = "#d0726a";
    green = "#9aa890";
    yellow = "#c8b86a";
    blue = "#8a9ab0";
    magenta = "#b0a0b8";
    cyan = "#80b8b4";
    white = "#d8d6d0";
    brightBlack = "#62626a";
    brightRed = "#e4847c";
    brightGreen = "#adbba2";
    brightYellow = "#dbcb7d";
    brightBlue = "#9cadc3";
    brightMagenta = "#c3b3cb";
    brightCyan = "#93cbc7";
    brightWhite = "#eeece6";
  };

  orange = "#e8843a";
  brightOrange = "#fd974f";
  cursor = "#8a9ab0";

  tools = {
    bat = "ansi";
  };
}
