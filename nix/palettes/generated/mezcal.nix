# Mezcal -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/mezcal.yaml
# Author: Teshre
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/mezcal.nix. Edits here are lost on the
# next run.

{
  name = "mezcal";
  displayName = "Mezcal";
  author = "Teshre";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#13110e";
  surfaceDim = "#080604";
  surfaceBright = "#3d3a2e";
  surfaceContainerLowest = "#080604";
  surfaceContainerLow = "#13110e";
  surfaceContainer = "#221f14";
  surfaceContainerHigh = "#2f2c21";
  surfaceContainerHighest = "#3d3a2e";
  surfaceVariant = "#221f14";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f2ead6";
  onSurface = "#e0d8c8";
  onSurfaceMuted = "#c3bbaa";
  onSurfaceVariant = "#a79e8c";
  onSurfaceFaint = "#6e6450";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6e6450";
  outlineVariant = "#36301e";

  # --- Accent roles -------------------------------------------------------
  primary = "#8aa6c0";
  onPrimary = "#13110e";
  primaryContainer = "#3c444a";
  onPrimaryContainer = "#f2ead6";
  secondary = "#6fc8ae";
  onSecondary = "#13110e";
  tertiary = "#c28aa8";
  onTertiary = "#13110e";
  error = "#da6e54";
  onError = "#13110e";
  inverseSurface = "#e0d8c8";
  inverseOnSurface = "#13110e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#221f14";
    red = "#da6e54";
    green = "#a8b84a";
    yellow = "#d9a441";
    blue = "#8aa6c0";
    magenta = "#c28aa8";
    cyan = "#6fc8ae";
    white = "#e0d8c8";
    brightBlack = "#6e6450";
    brightRed = "#ef8166";
    brightGreen = "#bbcb5e";
    brightYellow = "#edb756";
    brightBlue = "#9cb9d3";
    brightMagenta = "#d69cbb";
    brightCyan = "#83dcc1";
    brightWhite = "#f2ead6";
  };

  orange = "#d9a441";
  brightOrange = "#edb756";
  cursor = "#8aa6c0";

  tools = {
    bat = "ansi";
  };
}
