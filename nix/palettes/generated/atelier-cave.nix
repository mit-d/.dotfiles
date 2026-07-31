# Atelier Cave -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-cave.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-cave.nix. Edits here are lost on the
# next run.

{
  name = "atelier-cave";
  displayName = "Atelier Cave";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#19171c";
  surfaceDim = "#0d0b10";
  surfaceBright = "#413e45";
  surfaceContainerLowest = "#0d0b10";
  surfaceContainerLow = "#19171c";
  surfaceContainer = "#26232a";
  surfaceContainerHigh = "#333037";
  surfaceContainerHighest = "#413e45";
  surfaceVariant = "#26232a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#efecf4";
  onSurface = "#8b8792";
  onSurfaceMuted = "#847f8c";
  onSurfaceVariant = "#7e7887";
  onSurfaceFaint = "#655f6d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#655f6d";
  outlineVariant = "#585260";

  # --- Accent roles -------------------------------------------------------
  primary = "#576ddb";
  onPrimary = "#040405";
  primaryContainer = "#2f365e";
  onPrimaryContainer = "#efecf4";
  secondary = "#398bc6";
  onSecondary = "#19171c";
  tertiary = "#955ae7";
  onTertiary = "#0f0d11";
  error = "#be4678";
  onError = "#f7f6fa";
  inverseSurface = "#8b8792";
  inverseOnSurface = "#19171c";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#26232a";
    red = "#be4678";
    green = "#2a9292";
    yellow = "#a06e3b";
    blue = "#576ddb";
    magenta = "#955ae7";
    cyan = "#398bc6";
    white = "#8b8792";
    brightBlack = "#655f6d";
    brightRed = "#d3598a";
    brightGreen = "#41a5a4";
    brightYellow = "#b3804d";
    brightBlue = "#6780f0";
    brightMagenta = "#a76dfc";
    brightCyan = "#4d9eda";
    brightWhite = "#efecf4";
  };

  orange = "#aa573c";
  brightOrange = "#be694d";
  cursor = "#576ddb";

  tools = {
    bat = "ansi";
  };
}
