# Atelier Lakeside Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-lakeside-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-lakeside-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-lakeside-light";
  displayName = "Atelier Lakeside Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ebf8ff";
  surfaceDim = "#ffffff";
  surfaceBright = "#9ec0d2";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ebf8ff";
  surfaceContainer = "#c1e4f6";
  surfaceContainerHigh = "#afd2e4";
  surfaceContainerHighest = "#9ec0d2";
  surfaceVariant = "#c1e4f6";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#161b1d";
  onSurface = "#516d7b";
  onSurfaceMuted = "#557483";
  onSurfaceVariant = "#5a7b8c";
  onSurfaceFaint = "#7195a8";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7195a8";
  outlineVariant = "#7ea2b4";

  # --- Accent roles -------------------------------------------------------
  primary = "#257fad";
  onPrimary = "#ffffff";
  primaryContainer = "#a4c9e0";
  onPrimaryContainer = "#161b1d";
  secondary = "#2d8f6f";
  onSecondary = "#ffffff";
  tertiary = "#6b6bb8";
  onTertiary = "#f1faff";
  error = "#d22d72";
  onError = "#eef9ff";
  inverseSurface = "#516d7b";
  inverseOnSurface = "#ebf8ff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#c1e4f6";
    red = "#d22d72";
    green = "#568c3b";
    yellow = "#8a8a0f";
    blue = "#257fad";
    magenta = "#6b6bb8";
    cyan = "#2d8f6f";
    white = "#516d7b";
    brightBlack = "#7195a8";
    brightRed = "#bd0c61";
    brightGreen = "#457a28";
    brightYellow = "#787800";
    brightBlue = "#046d9a";
    brightMagenta = "#5a59a5";
    brightCyan = "#107d5e";
    brightWhite = "#161b1d";
  };

  orange = "#935c25";
  brightOrange = "#804b0f";
  cursor = "#257fad";

  tools = {
    bat = "ansi";
  };
}
