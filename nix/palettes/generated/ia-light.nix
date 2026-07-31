# iA Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/ia-light.yaml
# Author: iA Inc. (modified by aramisgithub)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/ia-light.nix. Edits here are lost on the
# next run.

{
  name = "ia-light";
  displayName = "iA Light";
  author = "iA Inc. (modified by aramisgithub)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f6f6f6";
  surfaceDim = "#ffffff";
  surfaceBright = "#bbbbbb";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f6f6f6";
  surfaceContainer = "#dedede";
  surfaceContainerHigh = "#cccccc";
  surfaceContainerHighest = "#bbbbbb";
  surfaceVariant = "#dedede";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#545454";
  onSurface = "#545454";
  onSurfaceMuted = "#545454";
  onSurfaceVariant = "#767676";
  onSurfaceFaint = "#898989";

  # --- Borders and dividers -----------------------------------------------
  outline = "#898989";
  outlineVariant = "#b2d8e5";

  # --- Accent roles -------------------------------------------------------
  primary = "#48bac2";
  onPrimary = "#ffffff";
  primaryContainer = "#bbe0e2";
  onPrimaryContainer = "#5f5f5f";
  secondary = "#2d6bb1";
  onSecondary = "#f6f6f6";
  tertiary = "#a94598";
  onTertiary = "#f6f6f6";
  error = "#9c5a02";
  onError = "#f6f6f6";
  inverseSurface = "#545454";
  inverseOnSurface = "#f6f6f6";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#dedede";
    red = "#9c5a02";
    green = "#38781c";
    yellow = "#c48218";
    blue = "#48bac2";
    magenta = "#a94598";
    cyan = "#2d6bb1";
    white = "#181818";
    brightBlack = "#898989";
    brightRed = "#854b00";
    brightGreen = "#266600";
    brightYellow = "#ae7100";
    brightBlue = "#30a7af";
    brightMagenta = "#953286";
    brightCyan = "#19599e";
    brightWhite = "#e8e8e8";
  };

  orange = "#c43e18";
  brightOrange = "#ad2c00";
  cursor = "#3b9ca3";

  tools = {
    bat = "ansi";
  };
}
