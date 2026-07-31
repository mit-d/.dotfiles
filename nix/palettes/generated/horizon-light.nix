# Horizon Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/horizon-light.yaml
# Author: Michael Ball (http://github.com/michael-ball/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/horizon-light.nix. Edits here are lost on the
# next run.

{
  name = "horizon-light";
  displayName = "Horizon Light";
  author = "Michael Ball (http://github.com/michael-ball/)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fdf0ed";
  surfaceDim = "#ffffff";
  surfaceBright = "#d7b9b0";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fdf0ed";
  surfaceContainer = "#fadad1";
  surfaceContainerHigh = "#e9c9c0";
  surfaceContainerHighest = "#d7b9b0";
  surfaceVariant = "#fadad1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#201c1d";
  onSurface = "#403c3d";
  onSurfaceMuted = "#686362";
  onSurfaceVariant = "#877f7e";
  onSurfaceFaint = "#ada4a2";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a29998";
  outlineVariant = "#f2c5b9";

  # --- Accent roles -------------------------------------------------------
  primary = "#da103f";
  onPrimary = "#fdf0ed";
  primaryContainer = "#f9aaa9";
  onPrimaryContainer = "#201c1d";
  secondary = "#dc3318";
  onSecondary = "#fefbfa";
  tertiary = "#1d8991";
  onTertiary = "#ffffff";
  error = "#f7939b";
  onError = "#201c1d";
  inverseSurface = "#403c3d";
  inverseOnSurface = "#fdf0ed";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#fadad1";
    red = "#f7939b";
    green = "#94e1b0";
    yellow = "#fbe0d9";
    blue = "#da103f";
    magenta = "#1d8991";
    cyan = "#dc3318";
    white = "#403c3d";
    brightBlack = "#bdb3b1";
    brightRed = "#e28089";
    brightGreen = "#81cd9d";
    brightYellow = "#e7ccc6";
    brightBlue = "#be0033";
    brightMagenta = "#00767e";
    brightCyan = "#c31f00";
    brightWhite = "#201c1d";
  };

  orange = "#f6661e";
  brightOrange = "#de5500";
  cursor = "#da103f";

  tools = {
    bat = "ansi";
  };
}
