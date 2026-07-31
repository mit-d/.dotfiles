# Chalk -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/chalk.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/chalk.nix. Edits here are lost on the
# next run.

{
  name = "chalk";
  displayName = "Chalk";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#151515";
  surfaceDim = "#0b0b0b";
  surfaceBright = "#383838";
  surfaceContainerLowest = "#0b0b0b";
  surfaceContainerLow = "#151515";
  surfaceContainer = "#202020";
  surfaceContainerHigh = "#2c2c2c";
  surfaceContainerHighest = "#383838";
  surfaceVariant = "#202020";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5f5f5";
  onSurface = "#d0d0d0";
  onSurfaceMuted = "#c0c0c0";
  onSurfaceVariant = "#b0b0b0";
  onSurfaceFaint = "#505050";

  # --- Borders and dividers -----------------------------------------------
  outline = "#565656";
  outlineVariant = "#313131";

  # --- Accent roles -------------------------------------------------------
  primary = "#6fc2ef";
  onPrimary = "#151515";
  primaryContainer = "#37505f";
  onPrimaryContainer = "#f5f5f5";
  secondary = "#12cfc0";
  onSecondary = "#151515";
  tertiary = "#e1a3ee";
  onTertiary = "#151515";
  error = "#fb9fb1";
  onError = "#151515";
  inverseSurface = "#d0d0d0";
  inverseOnSurface = "#151515";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#202020";
    red = "#fb9fb1";
    green = "#acc267";
    yellow = "#ddb26f";
    blue = "#6fc2ef";
    magenta = "#e1a3ee";
    cyan = "#12cfc0";
    white = "#d0d0d0";
    brightBlack = "#505050";
    brightRed = "#ffbcc8";
    brightGreen = "#bfd67a";
    brightYellow = "#f1c582";
    brightBlue = "#89d5ff";
    brightMagenta = "#f3b8ff";
    brightCyan = "#3de3d3";
    brightWhite = "#f5f5f5";
  };

  orange = "#eda987";
  brightOrange = "#ffbd9c";
  cursor = "#6fc2ef";

  tools = {
    bat = "ansi";
  };
}
