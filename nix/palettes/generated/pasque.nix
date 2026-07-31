# Pasque -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/pasque.yaml
# Author: Gabriel Fontes (https://github.com/Misterio77)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/pasque.nix. Edits here are lost on the
# next run.

{
  name = "pasque";
  displayName = "Pasque";
  author = "Gabriel Fontes (https://github.com/Misterio77)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#271c3a";
  surfaceDim = "#1a0f2c";
  surfaceBright = "#291c40";
  surfaceContainerLowest = "#1a0f2c";
  surfaceContainerLow = "#271c3a";
  surfaceContainer = "#100323";
  surfaceContainerHigh = "#1c0e31";
  surfaceContainerHighest = "#291c40";
  surfaceVariant = "#100323";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#edeaef";
  onSurface = "#dedcdf";
  onSurfaceMuted = "#cecccf";
  onSurfaceVariant = "#bebcbf";
  onSurfaceFaint = "#5d5766";

  # --- Borders and dividers -----------------------------------------------
  outline = "#625d6b";
  outlineVariant = "#423160";

  # --- Accent roles -------------------------------------------------------
  primary = "#8e7dc6";
  onPrimary = "#261c39";
  primaryContainer = "#4c3e6c";
  onPrimaryContainer = "#edeaef";
  secondary = "#7263aa";
  onSecondary = "#f1eff2";
  tertiary = "#953b9d";
  onTertiary = "#edeaef";
  error = "#a92258";
  onError = "#edeaef";
  inverseSurface = "#dedcdf";
  inverseOnSurface = "#271c3a";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#100323";
    red = "#a92258";
    green = "#c6914b";
    yellow = "#804ead";
    blue = "#8e7dc6";
    magenta = "#953b9d";
    cyan = "#7263aa";
    white = "#dedcdf";
    brightBlack = "#5d5766";
    brightRed = "#be3869";
    brightGreen = "#daa45e";
    brightYellow = "#9260c1";
    brightBlue = "#a08fda";
    brightMagenta = "#a84eb0";
    brightCyan = "#8375bd";
    brightWhite = "#edeaef";
  };

  orange = "#918889";
  brightOrange = "#a39a9b";
  cursor = "#8e7dc6";

  tools = {
    bat = "ansi";
  };
}
