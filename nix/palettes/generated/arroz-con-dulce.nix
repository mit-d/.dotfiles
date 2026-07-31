# Arroz con Dulce -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/arroz-con-dulce.yaml
# Author: Richard Martinez
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/arroz-con-dulce.nix. Edits here are lost on the
# next run.

{
  name = "arroz-con-dulce";
  displayName = "Arroz con Dulce";
  author = "Richard Martinez";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fff8e7";
  surfaceDim = "#ffffff";
  surfaceBright = "#dfd3bb";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fff8e7";
  surfaceContainer = "#f7ebd3";
  surfaceContainerHigh = "#ebdfc7";
  surfaceContainerHighest = "#dfd3bb";
  surfaceVariant = "#f7ebd3";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#21110b";
  onSurface = "#4a2c20";
  onSurfaceMuted = "#604332";
  onSurfaceVariant = "#765b45";
  onSurfaceFaint = "#c5a578";

  # --- Borders and dividers -----------------------------------------------
  outline = "#ba9a70";
  outlineVariant = "#e5d1b4";

  # --- Accent roles -------------------------------------------------------
  primary = "#5940a0";
  onPrimary = "#fff8e7";
  primaryContainer = "#bab2d0";
  onPrimaryContainer = "#21110b";
  secondary = "#98263e";
  onSecondary = "#fff8e7";
  tertiary = "#8c1f68";
  onTertiary = "#fff8e7";
  error = "#a11d48";
  onError = "#fff8e7";
  inverseSurface = "#4a2c20";
  inverseOnSurface = "#fff8e7";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f7ebd3";
    red = "#a11d48";
    green = "#a2380c";
    yellow = "#855500";
    blue = "#5940a0";
    magenta = "#8c1f68";
    cyan = "#98263e";
    white = "#4a2c20";
    brightBlack = "#c8a77a";
    brightRed = "#8b0039";
    brightGreen = "#8a2b00";
    brightYellow = "#6f4600";
    brightBlue = "#492e8d";
    brightMagenta = "#780357";
    brightCyan = "#840d2e";
    brightWhite = "#21110b";
  };

  orange = "#a3470a";
  brightOrange = "#8b3900";
  cursor = "#5940a0";

  tools = {
    bat = "ansi";
  };
}
