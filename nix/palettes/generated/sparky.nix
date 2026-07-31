# Sparky -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/sparky.yaml
# Author: Leila Sother (https://github.com/mixcoac)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/sparky.nix. Edits here are lost on the
# next run.

{
  name = "sparky";
  displayName = "Sparky";
  author = "Leila Sother (https://github.com/mixcoac)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#072b31";
  surfaceDim = "#02262b";
  surfaceBright = "#0e3c48";
  surfaceContainerLowest = "#02262b";
  surfaceContainerLow = "#072b31";
  surfaceContainer = "#00313c";
  surfaceContainerHigh = "#063742";
  surfaceContainerHighest = "#0e3c48";
  surfaceVariant = "#00313c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#f4f5f0";
  onSurfaceMuted = "#8cb5bd";
  onSurfaceVariant = "#328597";
  onSurfaceFaint = "#3b616c";

  # --- Borders and dividers -----------------------------------------------
  outline = "#456974";
  outlineVariant = "#11444e";

  # --- Accent roles -------------------------------------------------------
  primary = "#4698cb";
  onPrimary = "#072b31";
  primaryContainer = "#1d5267";
  onPrimaryContainer = "#ffffff";
  secondary = "#2dccd3";
  onSecondary = "#072b31";
  tertiary = "#d59ed7";
  onTertiary = "#072b31";
  error = "#ff585d";
  onError = "#072b31";
  inverseSurface = "#f4f5f0";
  inverseOnSurface = "#072b31";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#00313c";
    red = "#ff585d";
    green = "#78d64b";
    yellow = "#fbdd40";
    blue = "#4698cb";
    magenta = "#d59ed7";
    cyan = "#2dccd3";
    white = "#f4f5f0";
    brightBlack = "#003b49";
    brightRed = "#ff827f";
    brightGreen = "#8bea60";
    brightYellow = "#fff2b3";
    brightBlue = "#5aabdf";
    brightMagenta = "#e9b1eb";
    brightCyan = "#4be0e7";
    brightWhite = "#ffffff";
  };

  orange = "#ff8f1c";
  brightOrange = "#ffae6e";
  cursor = "#4698cb";

  tools = {
    bat = "ansi";
  };
}
