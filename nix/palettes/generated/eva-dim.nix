# Eva Dim -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/eva-dim.yaml
# Author: kjakapat (https://github.com/kjakapat)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/eva-dim.nix. Edits here are lost on the
# next run.

{
  name = "eva-dim";
  displayName = "Eva Dim";
  author = "kjakapat (https://github.com/kjakapat)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2a3b4d";
  surfaceDim = "#1c2d3e";
  surfaceBright = "#5b7590";
  surfaceContainerLowest = "#1c2d3e";
  surfaceContainerLow = "#2a3b4d";
  surfaceContainer = "#3d566f";
  surfaceContainerHigh = "#4c667f";
  surfaceContainerHighest = "#5b7590";
  surfaceVariant = "#3d566f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#a0a3a6";
  onSurfaceMuted = "#8f9aa5";
  onSurfaceVariant = "#7f90a3";
  onSurfaceFaint = "#55799c";

  # --- Borders and dividers -----------------------------------------------
  outline = "#55799c";
  outlineVariant = "#4b6988";

  # --- Accent roles -------------------------------------------------------
  primary = "#1ae1dc";
  onPrimary = "#2a3b4d";
  primaryContainer = "#347680";
  onPrimaryContainer = "#ffffff";
  secondary = "#4b8f77";
  onSecondary = "#1b1b1b";
  tertiary = "#9c6cd3";
  onTertiary = "#1b1b1b";
  error = "#c4676c";
  onError = "#1b1b1b";
  inverseSurface = "#a0a3a6";
  inverseOnSurface = "#2a3b4d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3d566f";
    red = "#c4676c";
    green = "#5de561";
    yellow = "#cfd05d";
    blue = "#1ae1dc";
    magenta = "#9c6cd3";
    cyan = "#4b8f77";
    white = "#9fa2a6";
    brightBlack = "#55799c";
    brightRed = "#d8797e";
    brightGreen = "#73f975";
    brightYellow = "#e2e471";
    brightBlue = "#43f5f0";
    brightMagenta = "#af7ee7";
    brightCyan = "#5da189";
    brightWhite = "#ffffff";
  };

  orange = "#ff9966";
  brightOrange = "#ffb795";
  cursor = "#1ae1dc";

  tools = {
    bat = "ansi";
  };
}
