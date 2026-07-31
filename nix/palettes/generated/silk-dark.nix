# Silk Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/silk-dark.yaml
# Author: Gabriel Fontes (https://github.com/Misterio77)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/silk-dark.nix. Edits here are lost on the
# next run.

{
  name = "silk-dark";
  displayName = "Silk Dark";
  author = "Gabriel Fontes (https://github.com/Misterio77)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0e3c46";
  surfaceDim = "#00303a";
  surfaceBright = "#376368";
  surfaceContainerLowest = "#00303a";
  surfaceContainerLow = "#0e3c46";
  surfaceContainer = "#1d494e";
  surfaceContainerHigh = "#2a565b";
  surfaceContainerHighest = "#376368";
  surfaceVariant = "#1d494e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d2faff";
  onSurface = "#c7dbdd";
  onSurfaceMuted = "#b2d2d5";
  onSurfaceVariant = "#9dc8cd";
  onSurfaceFaint = "#587073";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5e777a";
  outlineVariant = "#2d5257";

  # --- Accent roles -------------------------------------------------------
  primary = "#46bddd";
  onPrimary = "#0e3c46";
  primaryContainer = "#226a7c";
  onPrimaryContainer = "#d2faff";
  secondary = "#3fb2b9";
  onSecondary = "#0e3c46";
  tertiary = "#756b8a";
  onTertiary = "#d6fbff";
  error = "#fb6953";
  onError = "#0c353f";
  inverseSurface = "#c7dbdd";
  inverseOnSurface = "#0e3c46";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1d494e";
    red = "#fb6953";
    green = "#73d8ad";
    yellow = "#fce380";
    blue = "#46bddd";
    magenta = "#756b8a";
    cyan = "#3fb2b9";
    white = "#c7dbdd";
    brightBlack = "#587073";
    brightRed = "#ff8b77";
    brightGreen = "#87ecc0";
    brightYellow = "#fff8da";
    brightBlue = "#5cd1f1";
    brightMagenta = "#877d9c";
    brightCyan = "#55c5cc";
    brightWhite = "#d2faff";
  };

  orange = "#fcab74";
  brightOrange = "#ffc6a1";
  cursor = "#46bddd";

  tools = {
    bat = "ansi";
  };
}
