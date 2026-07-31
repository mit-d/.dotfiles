# Atelier Estuary Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-estuary-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-estuary-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-estuary-light";
  displayName = "Atelier Estuary Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f4f3ec";
  surfaceDim = "#ffffff";
  surfaceBright = "#cdccc6";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f4f3ec";
  surfaceContainer = "#e7e6df";
  surfaceContainerHigh = "#dad9d2";
  surfaceContainerHighest = "#cdccc6";
  surfaceVariant = "#e7e6df";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#22221b";
  onSurface = "#5f5e4e";
  onSurfaceMuted = "#656454";
  onSurfaceVariant = "#6c6b5a";
  onSurfaceFaint = "#878573";

  # --- Borders and dividers -----------------------------------------------
  outline = "#878573";
  outlineVariant = "#929181";

  # --- Accent roles -------------------------------------------------------
  primary = "#36a166";
  onPrimary = "#22221b";
  primaryContainer = "#b2d4b8";
  onPrimaryContainer = "#22221b";
  secondary = "#5b9d48";
  onSecondary = "#22221b";
  tertiary = "#5f9182";
  onTertiary = "#21211b";
  error = "#ba6236";
  onError = "#0e0d0d";
  inverseSurface = "#5f5e4e";
  inverseOnSurface = "#f4f3ec";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e7e6df";
    red = "#ba6236";
    green = "#7d9726";
    yellow = "#a5980d";
    blue = "#36a166";
    magenta = "#5f9182";
    cyan = "#5b9d48";
    white = "#5f5e4e";
    brightBlack = "#878573";
    brightRed = "#a65023";
    brightGreen = "#6c8503";
    brightYellow = "#918600";
    brightBlue = "#1c8e55";
    brightMagenta = "#4d7f70";
    brightCyan = "#498a35";
    brightWhite = "#22221b";
  };

  orange = "#ae7313";
  brightOrange = "#996200";
  cursor = "#369e65";

  tools = {
    bat = "ansi";
  };
}
