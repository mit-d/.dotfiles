# Equilibrium Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/equilibrium-light.yaml
# Author: Carlo Abelli
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/equilibrium-light.nix. Edits here are lost on the
# next run.

{
  name = "equilibrium-light";
  displayName = "Equilibrium Light";
  author = "Carlo Abelli";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f5f0e7";
  surfaceDim = "#fffffe";
  surfaceBright = "#cbc7be";
  surfaceContainerLowest = "#fffffe";
  surfaceContainerLow = "#f5f0e7";
  surfaceContainer = "#e7e2d9";
  surfaceContainerHigh = "#d9d4cb";
  surfaceContainerHighest = "#cbc7be";
  surfaceVariant = "#e7e2d9";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#181c22";
  onSurface = "#43474e";
  onSurfaceMuted = "#4e535a";
  onSurfaceVariant = "#5a5f66";
  onSurfaceFaint = "#73777f";

  # --- Borders and dividers -----------------------------------------------
  outline = "#73777f";
  outlineVariant = "#d0cdc4";

  # --- Accent roles -------------------------------------------------------
  primary = "#0073b5";
  onPrimary = "#f5f0e7";
  primaryContainer = "#a5c1d6";
  onPrimaryContainer = "#181c22";
  secondary = "#007a72";
  onSecondary = "#f5f0e7";
  tertiary = "#4e66b6";
  onTertiary = "#f5f0e7";
  error = "#d02023";
  onError = "#f5f0e7";
  inverseSurface = "#43474e";
  inverseOnSurface = "#f5f0e7";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e7e2d9";
    red = "#d02023";
    green = "#637200";
    yellow = "#9d6f00";
    blue = "#0073b5";
    magenta = "#4e66b6";
    cyan = "#007a72";
    white = "#43474e";
    brightBlack = "#73777f";
    brightRed = "#b80012";
    brightGreen = "#536000";
    brightYellow = "#875f00";
    brightBlue = "#00619a";
    brightMagenta = "#3e54a3";
    brightCyan = "#006760";
    brightWhite = "#181c22";
  };

  orange = "#bf3e05";
  brightOrange = "#a43300";
  cursor = "#0073b5";

  tools = {
    bat = "ansi";
  };
}
