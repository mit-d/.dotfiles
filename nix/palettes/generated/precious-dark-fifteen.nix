# Precious Dark Fifteen -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/precious-dark-fifteen.yaml
# Author: 4lex4 <4lex49@zoho.com>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/precious-dark-fifteen.nix. Edits here are lost on the
# next run.

{
  name = "precious-dark-fifteen";
  displayName = "Precious Dark Fifteen";
  author = "4lex4 <4lex49@zoho.com>";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#23262b";
  surfaceDim = "#171a1e";
  surfaceBright = "#4b4e53";
  surfaceContainerLowest = "#171a1e";
  surfaceContainerLow = "#23262b";
  surfaceContainer = "#303337";
  surfaceContainerHigh = "#3d4045";
  surfaceContainerHighest = "#4b4e53";
  surfaceVariant = "#303337";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#bab9b6";
  onSurface = "#bab9b6";
  onSurfaceMuted = "#b2b1af";
  onSurfaceVariant = "#abaaa8";
  onSurfaceFaint = "#898989";

  # --- Borders and dividers -----------------------------------------------
  outline = "#898989";
  outlineVariant = "#3e4044";

  # --- Accent roles -------------------------------------------------------
  primary = "#66b0ef";
  onPrimary = "#23262b";
  primaryContainer = "#3d576f";
  onPrimaryContainer = "#c8c8c5";
  secondary = "#42bda7";
  onSecondary = "#23262b";
  tertiary = "#b799ff";
  onTertiary = "#23262b";
  error = "#ff8782";
  onError = "#23262b";
  inverseSurface = "#bab9b6";
  inverseOnSurface = "#23262b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#303337";
    red = "#ff8782";
    green = "#95b659";
    yellow = "#cfa546";
    blue = "#66b0ef";
    magenta = "#b799ff";
    cyan = "#42bda7";
    white = "#bab9b6";
    brightBlack = "#898989";
    brightRed = "#ffa8a2";
    brightGreen = "#a7c96c";
    brightYellow = "#e3b85a";
    brightBlue = "#7ec3ff";
    brightMagenta = "#c7b3ff";
    brightCyan = "#59d0ba";
    brightWhite = "#bab9b6";
  };

  orange = "#e99857";
  brightOrange = "#feab6a";
  cursor = "#66b0ef";

  tools = {
    bat = "ansi";
  };
}
