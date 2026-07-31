# Bespin -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/bespin.yaml
# Author: Jan T. Sott
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/bespin.nix. Edits here are lost on the
# next run.

{
  name = "bespin";
  displayName = "Bespin";
  author = "Jan T. Sott";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#28211c";
  surfaceDim = "#1b1410";
  surfaceBright = "#534e4b";
  surfaceContainerLowest = "#1b1410";
  surfaceContainerLow = "#28211c";
  surfaceContainer = "#36312e";
  surfaceContainerHigh = "#443f3c";
  surfaceContainerHighest = "#534e4b";
  surfaceVariant = "#36312e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#baae9e";
  onSurface = "#8a8986";
  onSurfaceMuted = "#81817e";
  onSurfaceVariant = "#797977";
  onSurfaceFaint = "#666666";

  # --- Borders and dividers -----------------------------------------------
  outline = "#666666";
  outlineVariant = "#5e5d5c";

  # --- Accent roles -------------------------------------------------------
  primary = "#5ea6ea";
  onPrimary = "#28211c";
  primaryContainer = "#3f5063";
  onPrimaryContainer = "#c7beb1";
  secondary = "#afc4db";
  onSecondary = "#28211c";
  tertiary = "#9b859d";
  onTertiary = "#28211c";
  error = "#cf6a4c";
  onError = "#251f1a";
  inverseSurface = "#8a8986";
  inverseOnSurface = "#28211c";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#36312e";
    red = "#cf6a4c";
    green = "#54be0d";
    yellow = "#f9ee98";
    blue = "#5ea6ea";
    magenta = "#9b859d";
    cyan = "#afc4db";
    white = "#8a8986";
    brightBlack = "#666666";
    brightRed = "#e47c5e";
    brightGreen = "#68d232";
    brightYellow = "#fffffd";
    brightBlue = "#71b9fe";
    brightMagenta = "#ae97b0";
    brightCyan = "#c2d7ef";
    brightWhite = "#baae9e";
  };

  orange = "#cf7d34";
  brightOrange = "#e39049";
  cursor = "#5ea6ea";

  tools = {
    bat = "ansi";
  };
}
