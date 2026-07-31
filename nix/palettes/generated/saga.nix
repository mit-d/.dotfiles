# SAGA -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/saga.yaml
# Author: https://github.com/SAGAtheme/SAGA
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/saga.nix. Edits here are lost on the
# next run.

{
  name = "saga";
  displayName = "SAGA";
  author = "https://github.com/SAGAtheme/SAGA";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#05080a";
  surfaceDim = "#010304";
  surfaceBright = "#1b2126";
  surfaceContainerLowest = "#010304";
  surfaceContainerLow = "#05080a";
  surfaceContainer = "#0a1014";
  surfaceContainerHigh = "#12181d";
  surfaceContainerHighest = "#1b2126";
  surfaceVariant = "#0a1014";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f8eae7";
  onSurface = "#dce2f7";
  onSurfaceMuted = "#737d8d";
  onSurfaceVariant = "#62676d";
  onSurfaceFaint = "#42494f";

  # --- Borders and dividers -----------------------------------------------
  outline = "#4b5157";
  outlineVariant = "#242b31";

  # --- Accent roles -------------------------------------------------------
  primary = "#c9fff7";
  onPrimary = "#05080a";
  primaryContainer = "#455958";
  onPrimaryContainer = "#f8eae7";
  secondary = "#c5edc1";
  onSecondary = "#05080a";
  tertiary = "#dcc3f9";
  onTertiary = "#05080a";
  error = "#ffd4e9";
  onError = "#05080a";
  inverseSurface = "#dce2f7";
  inverseOnSurface = "#05080a";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#0a1014";
    red = "#ffd4e9";
    green = "#f7ddff";
    yellow = "#fbebc8";
    blue = "#c9fff7";
    magenta = "#dcc3f9";
    cyan = "#c5edc1";
    white = "#dce2f7";
    brightBlack = "#141f27";
    brightRed = "#fff2f8";
    brightGreen = "#fefaff";
    brightYellow = "#ffffff";
    brightBlue = "#ffffff";
    brightMagenta = "#ebdbff";
    brightCyan = "#ddffda";
    brightWhite = "#f8eae7";
  };

  orange = "#fbcbae";
  brightOrange = "#ffe4d4";
  cursor = "#c9fff7";

  tools = {
    bat = "ansi";
  };
}
