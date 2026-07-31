# DanQing Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/danqing-light.yaml
# Author: Wenhan Zhu (Cosmos) (zhuwenhan950913@gmail.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/danqing-light.nix. Edits here are lost on the
# next run.

{
  name = "danqing-light";
  displayName = "DanQing Light";
  author = "Wenhan Zhu (Cosmos) (zhuwenhan950913@gmail.com)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fcfefd";
  surfaceDim = "#ffffff";
  surfaceBright = "#d8e2de";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fcfefd";
  surfaceContainer = "#ecf6f2";
  surfaceContainerHigh = "#e2ece8";
  surfaceContainerHighest = "#d8e2de";
  surfaceVariant = "#ecf6f2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#2d302f";
  onSurface = "#5a605d";
  onSurfaceMuted = "#78807d";
  onSurfaceVariant = "#818a87";
  onSurfaceFaint = "#a5b0ac";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9ba5a1";
  outlineVariant = "#cddbda";

  # --- Accent roles -------------------------------------------------------
  primary = "#b0a4e3";
  onPrimary = "#2d302f";
  primaryContainer = "#dedcf4";
  onPrimaryContainer = "#2d302f";
  secondary = "#30dff3";
  onSecondary = "#2d302f";
  tertiary = "#cca4e3";
  onTertiary = "#2d302f";
  error = "#f9906f";
  onError = "#2d302f";
  inverseSurface = "#5a605d";
  inverseOnSurface = "#fcfefd";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ecf6f2";
    red = "#f9906f";
    green = "#8ab361";
    yellow = "#f0c239";
    blue = "#b0a4e3";
    magenta = "#cca4e3";
    cyan = "#30dff3";
    white = "#5a605d";
    brightBlack = "#cad8d2";
    brightRed = "#e47d5d";
    brightGreen = "#78a04f";
    brightYellow = "#dcaf17";
    brightBlue = "#9d91cf";
    brightMagenta = "#b991cf";
    brightCyan = "#00cbde";
    brightWhite = "#2d302f";
  };

  orange = "#b38a61";
  brightOrange = "#a0784f";
  cursor = "#968dbf";

  tools = {
    bat = "ansi";
  };
}
