# Bright -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/bright.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/bright.nix. Edits here are lost on the
# next run.

{
  name = "bright";
  displayName = "Bright";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#4d4d4d";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#303030";
  surfaceContainerHigh = "#3e3e3e";
  surfaceContainerHighest = "#4d4d4d";
  surfaceVariant = "#303030";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#e0e0e0";
  onSurfaceMuted = "#d8d8d8";
  onSurfaceVariant = "#d0d0d0";
  onSurfaceFaint = "#b0b0b0";

  # --- Borders and dividers -----------------------------------------------
  outline = "#b0b0b0";
  outlineVariant = "#505050";

  # --- Accent roles -------------------------------------------------------
  primary = "#6fb3d2";
  onPrimary = "#000000";
  primaryContainer = "#172c35";
  onPrimaryContainer = "#ffffff";
  secondary = "#76c7b7";
  onSecondary = "#000000";
  tertiary = "#d381c3";
  onTertiary = "#000000";
  error = "#fb0120";
  onError = "#000000";
  inverseSurface = "#e0e0e0";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#303030";
    red = "#fb0120";
    green = "#a1c659";
    yellow = "#fda331";
    blue = "#6fb3d2";
    magenta = "#d381c3";
    cyan = "#76c7b7";
    white = "#e0e0e0";
    brightBlack = "#b0b0b0";
    brightRed = "#ff564e";
    brightGreen = "#b4da6d";
    brightYellow = "#ffbf7b";
    brightBlue = "#82c6e6";
    brightMagenta = "#e794d7";
    brightCyan = "#89dbca";
    brightWhite = "#ffffff";
  };

  orange = "#fc6d24";
  brightOrange = "#ff8f5f";
  cursor = "#6fb3d2";

  tools = {
    bat = "ansi";
  };
}
