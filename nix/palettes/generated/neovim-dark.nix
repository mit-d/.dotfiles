# Neovim Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/neovim-dark.yaml
# Author: https://github.com/neovim/neovim/blob/master/src/nvim/highlight_group.c
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/neovim-dark.nix. Edits here are lost on the
# next run.

{
  name = "neovim-dark";
  displayName = "Neovim Dark";
  author = "https://github.com/neovim/neovim/blob/master/src/nvim/highlight_group.c";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#14161b";
  surfaceDim = "#080a0f";
  surfaceBright = "#1f2026";
  surfaceContainerLowest = "#080a0f";
  surfaceContainerLow = "#14161b";
  surfaceContainer = "#07080d";
  surfaceContainerHigh = "#121419";
  surfaceContainerHighest = "#1f2026";
  surfaceVariant = "#07080d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#eef1f8";
  onSurface = "#e0e2ea";
  onSurfaceMuted = "#d2d4db";
  onSurfaceVariant = "#c4c6cd";
  onSurfaceFaint = "#9b9ea4";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9b9ea4";
  outlineVariant = "#4f5258";

  # --- Accent roles -------------------------------------------------------
  primary = "#a6dbff";
  onPrimary = "#14161b";
  primaryContainer = "#465968";
  onPrimaryContainer = "#eef1f8";
  secondary = "#8cf8f7";
  onSecondary = "#14161b";
  tertiary = "#ffcaff";
  onTertiary = "#14161b";
  error = "#ffc0b9";
  onError = "#14161b";
  inverseSurface = "#e0e2ea";
  inverseOnSurface = "#14161b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#07080d";
    red = "#ffc0b9";
    green = "#b3f6c0";
    yellow = "#fce094";
    blue = "#a6dbff";
    magenta = "#ffcaff";
    cyan = "#8cf8f7";
    white = "#e0e2ea";
    brightBlack = "#9b9ea4";
    brightRed = "#ffdcd8";
    brightGreen = "#e4ffe8";
    brightYellow = "#fff6dd";
    brightBlue = "#cfebff";
    brightMagenta = "#ffebff";
    brightCyan = "#dbfffe";
    brightWhite = "#eef1f8";
  };

  orange = "#ffa500";
  brightOrange = "#ffc176";
  cursor = "#a6dbff";

  tools = {
    bat = "ansi";
  };
}
