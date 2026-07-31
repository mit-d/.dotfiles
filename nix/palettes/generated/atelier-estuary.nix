# Atelier Estuary -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-estuary.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-estuary.nix. Edits here are lost on the
# next run.

{
  name = "atelier-estuary";
  displayName = "Atelier Estuary";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#22221b";
  surfaceDim = "#16150f";
  surfaceBright = "#4c4b43";
  surfaceContainerLowest = "#16150f";
  surfaceContainerLow = "#22221b";
  surfaceContainer = "#302f27";
  surfaceContainerHigh = "#3e3d34";
  surfaceContainerHighest = "#4c4b43";
  surfaceVariant = "#302f27";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f4f3ec";
  onSurface = "#929181";
  onSurfaceMuted = "#8c8b7a";
  onSurfaceVariant = "#878573";
  onSurfaceFaint = "#6c6b5a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6c6b5a";
  outlineVariant = "#5f5e4e";

  # --- Accent roles -------------------------------------------------------
  primary = "#36a166";
  onPrimary = "#22221b";
  primaryContainer = "#304f36";
  onPrimaryContainer = "#f4f3ec";
  secondary = "#5b9d48";
  onSecondary = "#22221b";
  tertiary = "#5f9182";
  onTertiary = "#21211b";
  error = "#ba6236";
  onError = "#0e0d0d";
  inverseSurface = "#929181";
  inverseOnSurface = "#22221b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#302f27";
    red = "#ba6236";
    green = "#7d9726";
    yellow = "#a5980d";
    blue = "#36a166";
    magenta = "#5f9182";
    cyan = "#5b9d48";
    white = "#929181";
    brightBlack = "#6c6b5a";
    brightRed = "#ce7448";
    brightGreen = "#8faa3d";
    brightYellow = "#b8ab2f";
    brightBlue = "#4cb478";
    brightMagenta = "#71a394";
    brightCyan = "#6db05a";
    brightWhite = "#f4f3ec";
  };

  orange = "#ae7313";
  brightOrange = "#c1852e";
  cursor = "#36a166";

  tools = {
    bat = "ansi";
  };
}
