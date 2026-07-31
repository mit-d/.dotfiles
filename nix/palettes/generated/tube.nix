# London Tube -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tube.yaml
# Author: Jan T. Sott
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tube.nix. Edits here are lost on the
# next run.

{
  name = "tube";
  displayName = "London Tube";
  author = "Jan T. Sott";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#231f20";
  surfaceDim = "#161213";
  surfaceBright = "#3960b9";
  surfaceContainerLowest = "#161213";
  surfaceContainerLow = "#231f20";
  surfaceContainer = "#1c3f95";
  surfaceContainerHigh = "#2a4fa7";
  surfaceContainerHighest = "#3960b9";
  surfaceVariant = "#1c3f95";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#d9d8d8";
  onSurfaceMuted = "#b6babc";
  onSurfaceVariant = "#959ca1";
  onSurfaceFaint = "#737171";

  # --- Borders and dividers -----------------------------------------------
  outline = "#737171";
  outlineVariant = "#5a5758";

  # --- Accent roles -------------------------------------------------------
  primary = "#009ddc";
  onPrimary = "#231f20";
  primaryContainer = "#2d4c61";
  onPrimaryContainer = "#ffffff";
  secondary = "#85cebc";
  onSecondary = "#231f20";
  tertiary = "#98005d";
  onTertiary = "#ffffff";
  error = "#ee2e24";
  onError = "#ffffff";
  inverseSurface = "#d9d8d8";
  inverseOnSurface = "#231f20";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1c3f95";
    red = "#ee2e24";
    green = "#00853e";
    yellow = "#ffd204";
    blue = "#009ddc";
    magenta = "#98005d";
    cyan = "#85cebc";
    white = "#d9d8d8";
    brightBlack = "#737171";
    brightRed = "#ff5041";
    brightGreen = "#27984f";
    brightYellow = "#ffe9a3";
    brightBlue = "#2eb0f0";
    brightMagenta = "#ad236e";
    brightCyan = "#98e2cf";
    brightWhite = "#ffffff";
  };

  orange = "#f386a1";
  brightOrange = "#ff9fb5";
  cursor = "#009ddc";

  tools = {
    bat = "ansi";
  };
}
