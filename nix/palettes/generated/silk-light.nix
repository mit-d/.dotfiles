# Silk Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/silk-light.yaml
# Author: Gabriel Fontes (https://github.com/Misterio77)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/silk-light.nix. Edits here are lost on the
# next run.

{
  name = "silk-light";
  displayName = "Silk Light";
  author = "Gabriel Fontes (https://github.com/Misterio77)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#e9f1ef";
  surfaceDim = "#ffffff";
  surfaceBright = "#a9b1b0";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#e9f1ef";
  surfaceContainer = "#ccd4d3";
  surfaceContainerHigh = "#bac2c1";
  surfaceContainerHighest = "#a9b1b0";
  surfaceVariant = "#ccd4d3";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#0e3c46";
  onSurface = "#385156";
  onSurfaceMuted = "#42565a";
  onSurfaceVariant = "#4b5b5f";
  onSurfaceFaint = "#5c787b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5c787b";
  outlineVariant = "#90b7b6";

  # --- Accent roles -------------------------------------------------------
  primary = "#39aac9";
  onPrimary = "#ffffff";
  primaryContainer = "#add6e1";
  onPrimaryContainer = "#0e3c46";
  secondary = "#329ca2";
  onSecondary = "#ffffff";
  tertiary = "#6e6582";
  onTertiary = "#e9f1ef";
  error = "#cf432e";
  onError = "#f9fbfb";
  inverseSurface = "#385156";
  inverseOnSurface = "#e9f1ef";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ccd4d3";
    red = "#cf432e";
    green = "#6ca38c";
    yellow = "#cfad25";
    blue = "#39aac9";
    magenta = "#6e6582";
    cyan = "#329ca2";
    white = "#385156";
    brightBlack = "#5c787b";
    brightRed = "#ba2e19";
    brightGreen = "#5a917a";
    brightYellow = "#bb9a00";
    brightBlue = "#1d97b6";
    brightMagenta = "#5d5470";
    brightCyan = "#158a90";
    brightWhite = "#0e3c46";
  };

  orange = "#d27f46";
  brightOrange = "#be6d33";
  cursor = "#3196b1";

  tools = {
    bat = "ansi";
  };
}
