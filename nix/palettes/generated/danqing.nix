# DanQing -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/danqing.yaml
# Author: Wenhan Zhu (Cosmos) (zhuwenhan950913@gmail.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/danqing.nix. Edits here are lost on the
# next run.

{
  name = "danqing";
  displayName = "DanQing";
  author = "Wenhan Zhu (Cosmos) (zhuwenhan950913@gmail.com)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2d302f";
  surfaceDim = "#202322";
  surfaceBright = "#616664";
  surfaceContainerLowest = "#202322";
  surfaceContainerLow = "#2d302f";
  surfaceContainer = "#434846";
  surfaceContainerHigh = "#525755";
  surfaceContainerHighest = "#616664";
  surfaceVariant = "#434846";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fcfefd";
  onSurface = "#e0f0ef";
  onSurfaceMuted = "#d5e4e0";
  onSurfaceVariant = "#cad8d2";
  onSurfaceFaint = "#9da8a3";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9da8a3";
  outlineVariant = "#5a605d";

  # --- Accent roles -------------------------------------------------------
  primary = "#b0a4e3";
  onPrimary = "#2d302f";
  primaryContainer = "#5b5a6e";
  onPrimaryContainer = "#fcfefd";
  secondary = "#30dff3";
  onSecondary = "#2d302f";
  tertiary = "#cca4e3";
  onTertiary = "#2d302f";
  error = "#f9906f";
  onError = "#2d302f";
  inverseSurface = "#e0f0ef";
  inverseOnSurface = "#2d302f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#434846";
    red = "#f9906f";
    green = "#8ab361";
    yellow = "#f0c239";
    blue = "#b0a4e3";
    magenta = "#cca4e3";
    cyan = "#30dff3";
    white = "#e0f0ef";
    brightBlack = "#9da8a3";
    brightRed = "#ffac91";
    brightGreen = "#9cc673";
    brightYellow = "#ffd76b";
    brightBlue = "#c3b7f7";
    brightMagenta = "#e0b7f7";
    brightCyan = "#78efff";
    brightWhite = "#fcfefd";
  };

  orange = "#b38a61";
  brightOrange = "#c69c73";
  cursor = "#b0a4e3";

  tools = {
    bat = "ansi";
  };
}
