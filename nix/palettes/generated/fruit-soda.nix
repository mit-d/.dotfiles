# Fruit Soda -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/fruit-soda.yaml
# Author: jozip
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/fruit-soda.nix. Edits here are lost on the
# next run.

{
  name = "fruit-soda";
  displayName = "Fruit Soda";
  author = "jozip";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f1ecf1";
  surfaceDim = "#fffcff";
  surfaceBright = "#c2c0c2";
  surfaceContainerLowest = "#fffcff";
  surfaceContainerLow = "#f1ecf1";
  surfaceContainer = "#e0dee0";
  surfaceContainerHigh = "#d1cfd1";
  surfaceContainerHighest = "#c2c0c2";
  surfaceVariant = "#e0dee0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#2d2c2c";
  onSurface = "#515151";
  onSurfaceMuted = "#737274";
  onSurfaceVariant = "#7f7d7f";
  onSurfaceFaint = "#a2a1a3";

  # --- Borders and dividers -----------------------------------------------
  outline = "#989798";
  outlineVariant = "#cdcaca";

  # --- Accent roles -------------------------------------------------------
  primary = "#2931df";
  onPrimary = "#f1ecf1";
  primaryContainer = "#9baef1";
  onPrimaryContainer = "#2d2c2c";
  secondary = "#0f9cfd";
  onSecondary = "#2d2c2c";
  tertiary = "#611fce";
  onTertiary = "#f1ecf1";
  error = "#fe3e31";
  onError = "#ffffff";
  inverseSurface = "#515151";
  inverseOnSurface = "#f1ecf1";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e0dee0";
    red = "#fe3e31";
    green = "#47f74c";
    yellow = "#f7e203";
    blue = "#2931df";
    magenta = "#611fce";
    cyan = "#0f9cfd";
    white = "#515151";
    brightBlack = "#b5b4b6";
    brightRed = "#e82119";
    brightGreen = "#25e332";
    brightYellow = "#e2ce00";
    brightBlue = "#200fca";
    brightMagenta = "#5100b4";
    brightCyan = "#0089e1";
    brightWhite = "#2d2c2c";
  };

  orange = "#fe6d08";
  brightOrange = "#e25f00";
  cursor = "#2931df";

  tools = {
    bat = "ansi";
  };
}
