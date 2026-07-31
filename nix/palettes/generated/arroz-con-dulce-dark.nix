# Arroz con Dulce Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/arroz-con-dulce-dark.yaml
# Author: Richard Martinez
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/arroz-con-dulce-dark.nix. Edits here are lost on the
# next run.

{
  name = "arroz-con-dulce-dark";
  displayName = "Arroz con Dulce Dark";
  author = "Richard Martinez";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#21140f";
  surfaceDim = "#190d08";
  surfaceBright = "#3d2a22";
  surfaceContainerLowest = "#190d08";
  surfaceContainerLow = "#21140f";
  surfaceContainer = "#2c1a13";
  surfaceContainerHigh = "#34221b";
  surfaceContainerHighest = "#3d2a22";
  surfaceVariant = "#2c1a13";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fff8e7";
  onSurface = "#f2dfc0";
  onSurfaceMuted = "#ddc39d";
  onSurfaceVariant = "#c8a77a";
  onSurfaceFaint = "#a98568";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a98568";
  outlineVariant = "#442d22";

  # --- Accent roles -------------------------------------------------------
  primary = "#b99ac8";
  onPrimary = "#21140f";
  primaryContainer = "#56424e";
  onPrimaryContainer = "#fff8e7";
  secondary = "#d98276";
  onSecondary = "#21140f";
  tertiary = "#d58ab4";
  onTertiary = "#21140f";
  error = "#e07a8a";
  onError = "#21140f";
  inverseSurface = "#f2dfc0";
  inverseOnSurface = "#21140f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2c1a13";
    red = "#e07a8a";
    green = "#d47a50";
    yellow = "#d9a441";
    blue = "#b99ac8";
    magenta = "#d58ab4";
    cyan = "#d98276";
    white = "#f2dfc0";
    brightBlack = "#a98568";
    brightRed = "#f58d9c";
    brightGreen = "#e88d62";
    brightYellow = "#edb756";
    brightBlue = "#ccaddc";
    brightMagenta = "#e99dc7";
    brightCyan = "#ed9588";
    brightWhite = "#fff8e7";
  };

  orange = "#e68a4a";
  brightOrange = "#fb9d5d";
  cursor = "#b99ac8";

  tools = {
    bat = "ansi";
  };
}
