# Classic Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/classic-light.yaml
# Author: Jason Heeris (http://heeris.id.au)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/classic-light.nix. Edits here are lost on the
# next run.

{
  name = "classic-light";
  displayName = "Classic Light";
  author = "Jason Heeris (http://heeris.id.au)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f5f5f5";
  surfaceDim = "#ffffff";
  surfaceBright = "#bcbcbc";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f5f5f5";
  surfaceContainer = "#e0e0e0";
  surfaceContainerHigh = "#cecece";
  surfaceContainerHighest = "#bcbcbc";
  surfaceVariant = "#e0e0e0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#151515";
  onSurface = "#303030";
  onSurfaceMuted = "#404040";
  onSurfaceVariant = "#505050";
  onSurfaceFaint = "#a7a7a7";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9d9d9d";
  outlineVariant = "#d0d0d0";

  # --- Accent roles -------------------------------------------------------
  primary = "#6a9fb5";
  onPrimary = "#151515";
  primaryContainer = "#c0d4dd";
  onPrimaryContainer = "#151515";
  secondary = "#75b5aa";
  onSecondary = "#151515";
  tertiary = "#aa759f";
  onTertiary = "#151515";
  error = "#ac4142";
  onError = "#f5f5f5";
  inverseSurface = "#303030";
  inverseOnSurface = "#f5f5f5";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e0e0e0";
    red = "#ac4142";
    green = "#90a959";
    yellow = "#f4bf75";
    blue = "#6a9fb5";
    magenta = "#aa759f";
    cyan = "#75b5aa";
    white = "#303030";
    brightBlack = "#b0b0b0";
    brightRed = "#982e32";
    brightGreen = "#7e9647";
    brightYellow = "#e0ac62";
    brightBlue = "#588da2";
    brightMagenta = "#97638d";
    brightCyan = "#63a297";
    brightWhite = "#151515";
  };

  orange = "#d28445";
  brightOrange = "#be7231";
  cursor = "#6495a9";

  tools = {
    bat = "ansi";
  };
}
