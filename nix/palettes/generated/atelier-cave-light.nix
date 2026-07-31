# Atelier Cave Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-cave-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-cave-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-cave-light";
  displayName = "Atelier Cave Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#efecf4";
  surfaceDim = "#fcfaff";
  surfaceBright = "#c8c5cd";
  surfaceContainerLowest = "#fcfaff";
  surfaceContainerLow = "#efecf4";
  surfaceContainer = "#e2dfe7";
  surfaceContainerHigh = "#d5d2da";
  surfaceContainerHighest = "#c8c5cd";
  surfaceVariant = "#e2dfe7";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#19171c";
  onSurface = "#585260";
  onSurfaceMuted = "#5e5866";
  onSurfaceVariant = "#655f6d";
  onSurfaceFaint = "#7e7887";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7e7887";
  outlineVariant = "#8b8792";

  # --- Accent roles -------------------------------------------------------
  primary = "#576ddb";
  onPrimary = "#040405";
  primaryContainer = "#b2bdee";
  onPrimaryContainer = "#19171c";
  secondary = "#398bc6";
  onSecondary = "#19171c";
  tertiary = "#955ae7";
  onTertiary = "#0f0d11";
  error = "#be4678";
  onError = "#f7f6fa";
  inverseSurface = "#585260";
  inverseOnSurface = "#efecf4";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e2dfe7";
    red = "#be4678";
    green = "#2a9292";
    yellow = "#a06e3b";
    blue = "#576ddb";
    magenta = "#955ae7";
    cyan = "#398bc6";
    white = "#585260";
    brightBlack = "#7e7887";
    brightRed = "#aa3367";
    brightGreen = "#078080";
    brightYellow = "#8d5d29";
    brightBlue = "#475ac7";
    brightMagenta = "#8346d2";
    brightCyan = "#2379b2";
    brightWhite = "#19171c";
  };

  orange = "#aa573c";
  brightOrange = "#96452b";
  cursor = "#576ddb";

  tools = {
    bat = "ansi";
  };
}
