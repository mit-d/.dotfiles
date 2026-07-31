# Atelier Lakeside -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-lakeside.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-lakeside.nix. Edits here are lost on the
# next run.

{
  name = "atelier-lakeside";
  displayName = "Atelier Lakeside";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#161b1d";
  surfaceDim = "#0a0f11";
  surfaceBright = "#3a454b";
  surfaceContainerLowest = "#0a0f11";
  surfaceContainerLow = "#161b1d";
  surfaceContainer = "#1f292e";
  surfaceContainerHigh = "#2c373c";
  surfaceContainerHighest = "#3a454b";
  surfaceVariant = "#1f292e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ebf8ff";
  onSurface = "#7ea2b4";
  onSurfaceMuted = "#779bae";
  onSurfaceVariant = "#7195a8";
  onSurfaceFaint = "#5a7b8c";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5a7b8c";
  outlineVariant = "#516d7b";

  # --- Accent roles -------------------------------------------------------
  primary = "#257fad";
  onPrimary = "#070809";
  primaryContainer = "#213e4f";
  onPrimaryContainer = "#ebf8ff";
  secondary = "#2d8f6f";
  onSecondary = "#131719";
  tertiary = "#6b6bb8";
  onTertiary = "#f2faff";
  error = "#d22d72";
  onError = "#eef9ff";
  inverseSurface = "#7ea2b4";
  inverseOnSurface = "#161b1d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1f292e";
    red = "#d22d72";
    green = "#568c3b";
    yellow = "#8a8a0f";
    blue = "#257fad";
    magenta = "#6b6bb8";
    cyan = "#2d8f6f";
    white = "#7ea2b4";
    brightBlack = "#5a7b8c";
    brightRed = "#e84484";
    brightGreen = "#689f4d";
    brightYellow = "#9c9d2d";
    brightBlue = "#3b91c0";
    brightMagenta = "#7c7dcc";
    brightCyan = "#43a281";
    brightWhite = "#ebf8ff";
  };

  orange = "#935c25";
  brightOrange = "#a66e38";
  cursor = "#257fad";

  tools = {
    bat = "ansi";
  };
}
