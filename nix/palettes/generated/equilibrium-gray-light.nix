# Equilibrium Gray Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/equilibrium-gray-light.yaml
# Author: Carlo Abelli
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/equilibrium-gray-light.nix. Edits here are lost on the
# next run.

{
  name = "equilibrium-gray-light";
  displayName = "Equilibrium Gray Light";
  author = "Carlo Abelli";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f1f1f1";
  surfaceDim = "#ffffff";
  surfaceBright = "#c5c5c5";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f1f1f1";
  surfaceContainer = "#e2e2e2";
  surfaceContainerHigh = "#d3d3d3";
  surfaceContainerHighest = "#c5c5c5";
  surfaceVariant = "#e2e2e2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1b1b1b";
  onSurface = "#474747";
  onSurfaceMuted = "#525252";
  onSurfaceVariant = "#5e5e5e";
  onSurfaceFaint = "#777777";

  # --- Borders and dividers -----------------------------------------------
  outline = "#777777";
  outlineVariant = "#cecdcd";

  # --- Accent roles -------------------------------------------------------
  primary = "#0073b5";
  onPrimary = "#f1f1f1";
  primaryContainer = "#a2c1dc";
  onPrimaryContainer = "#1b1b1b";
  secondary = "#007a72";
  onSecondary = "#f1f1f1";
  tertiary = "#4e66b6";
  onTertiary = "#f1f1f1";
  error = "#d02023";
  onError = "#f1f1f1";
  inverseSurface = "#474747";
  inverseOnSurface = "#f1f1f1";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e2e2e2";
    red = "#d02023";
    green = "#637200";
    yellow = "#9d6f00";
    blue = "#0073b5";
    magenta = "#4e66b6";
    cyan = "#007a72";
    white = "#474747";
    brightBlack = "#777777";
    brightRed = "#b80012";
    brightGreen = "#536000";
    brightYellow = "#875f00";
    brightBlue = "#00619a";
    brightMagenta = "#3e54a3";
    brightCyan = "#006760";
    brightWhite = "#1b1b1b";
  };

  orange = "#bf3e05";
  brightOrange = "#a43300";
  cursor = "#0073b5";

  tools = {
    bat = "ansi";
  };
}
