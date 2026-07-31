# Neovim Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/neovim-light.yaml
# Author: https://github.com/neovim/neovim/blob/master/src/nvim/highlight_group.c
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/neovim-light.nix. Edits here are lost on the
# next run.

{
  name = "neovim-light";
  displayName = "Neovim Light";
  author = "https://github.com/neovim/neovim/blob/master/src/nvim/highlight_group.c";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#e0e2ea";
  surfaceDim = "#eff1f9";
  surfaceBright = "#d1d4db";
  surfaceContainerLowest = "#eff1f9";
  surfaceContainerLow = "#e0e2ea";
  surfaceContainer = "#eef1f8";
  surfaceContainerHigh = "#dfe2e9";
  surfaceContainerHighest = "#d1d4db";
  surfaceVariant = "#eef1f8";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#07080d";
  onSurface = "#14161b";
  onSurfaceMuted = "#202227";
  onSurfaceVariant = "#2c2e33";
  onSurfaceFaint = "#4f5258";

  # --- Borders and dividers -----------------------------------------------
  outline = "#4f5258";
  outlineVariant = "#9b9ea4";

  # --- Accent roles -------------------------------------------------------
  primary = "#004c73";
  onPrimary = "#e0e2ea";
  primaryContainer = "#90a7bc";
  onPrimaryContainer = "#07080d";
  secondary = "#007373";
  onSecondary = "#e3e5ec";
  tertiary = "#470045";
  onTertiary = "#e0e2ea";
  error = "#590008";
  onError = "#e0e2ea";
  inverseSurface = "#14161b";
  inverseOnSurface = "#e0e2ea";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#eef1f8";
    red = "#590008";
    green = "#005523";
    yellow = "#6b5300";
    blue = "#004c73";
    magenta = "#470045";
    cyan = "#007373";
    white = "#14161b";
    brightBlack = "#4f5258";
    brightRed = "#3f0004";
    brightGreen = "#00421a";
    brightYellow = "#574300";
    brightBlue = "#003b5b";
    brightMagenta = "#31002f";
    brightCyan = "#006060";
    brightWhite = "#07080d";
  };

  orange = "#8b4513";
  brightOrange = "#763500";
  cursor = "#004c73";

  tools = {
    bat = "ansi";
  };
}
