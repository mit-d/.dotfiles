# Blue Forest -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/blueforest.yaml
# Author: alonsodomin (https://github.com/alonsodomin)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/blueforest.nix. Edits here are lost on the
# next run.

{
  name = "blueforest";
  displayName = "Blue Forest";
  author = "alonsodomin (https://github.com/alonsodomin)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#141f2e";
  surfaceDim = "#081220";
  surfaceBright = "#3f7c3e";
  surfaceContainerLowest = "#081220";
  surfaceContainerLow = "#141f2e";
  surfaceContainer = "#1e5c1e";
  surfaceContainerHigh = "#2f6c2e";
  surfaceContainerHighest = "#3f7c3e";
  surfaceVariant = "#1e5c1e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#aad8ff";
  onSurface = "#ffcc33";
  onSurfaceMuted = "#91932b";
  onSurfaceVariant = "#457f5e";
  onSurfaceFaint = "#4e7d63";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a0ffa0";
  outlineVariant = "#273e5c";

  # --- Accent roles -------------------------------------------------------
  primary = "#a2cff5";
  onPrimary = "#141f2e";
  primaryContainer = "#455c73";
  onPrimaryContainer = "#aad8ff";
  secondary = "#80ff80";
  onSecondary = "#141f2e";
  tertiary = "#0099ff";
  onTertiary = "#141f2e";
  error = "#fffab1";
  onError = "#141f2e";
  inverseSurface = "#ffcc33";
  inverseOnSurface = "#141f2e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1e5c1e";
    red = "#fffab1";
    green = "#80ff80";
    yellow = "#91ccff";
    blue = "#a2cff5";
    magenta = "#0099ff";
    cyan = "#80ff80";
    white = "#ffcc33";
    brightBlack = "#a0ffa0";
    brightRed = "#ffffff";
    brightGreen = "#d5ffd3";
    brightYellow = "#b8deff";
    brightBlue = "#bfe1ff";
    brightMagenta = "#54adff";
    brightCyan = "#d5ffd3";
    brightWhite = "#aad8ff";
  };

  orange = "#ff8080";
  brightOrange = "#ffa29f";
  cursor = "#a2cff5";

  tools = {
    bat = "ansi";
  };
}
