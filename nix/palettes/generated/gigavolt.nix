# Gigavolt -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gigavolt.yaml
# Author: Aidan Swope (http://github.com/Whillikers)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gigavolt.nix. Edits here are lost on the
# next run.

{
  name = "gigavolt";
  displayName = "Gigavolt";
  author = "Aidan Swope (http://github.com/Whillikers)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#202126";
  surfaceDim = "#131419";
  surfaceBright = "#494d5b";
  surfaceContainerLowest = "#131419";
  surfaceContainerLow = "#202126";
  surfaceContainer = "#2d303d";
  surfaceContainerHigh = "#3b3e4c";
  surfaceContainerHighest = "#494d5b";
  surfaceVariant = "#2d303d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f2fbff";
  onSurface = "#e9e7e1";
  onSurfaceMuted = "#d9ddf1";
  onSurfaceVariant = "#cad3ff";
  onSurfaceFaint = "#a1d2e6";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a1d2e6";
  outlineVariant = "#5a576e";

  # --- Accent roles -------------------------------------------------------
  primary = "#40bfff";
  onPrimary = "#202126";
  primaryContainer = "#345871";
  onPrimaryContainer = "#f2fbff";
  secondary = "#fb6acb";
  onSecondary = "#202126";
  tertiary = "#ae94f9";
  onTertiary = "#202126";
  error = "#ff661a";
  onError = "#202126";
  inverseSurface = "#e9e7e1";
  inverseOnSurface = "#202126";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2d303d";
    red = "#ff661a";
    green = "#f2e6a9";
    yellow = "#ffdc2d";
    blue = "#40bfff";
    magenta = "#ae94f9";
    cyan = "#fb6acb";
    white = "#e9e7e1";
    brightBlack = "#a1d2e6";
    brightRed = "#ff8c5e";
    brightGreen = "#fff9dc";
    brightYellow = "#fff2b9";
    brightBlue = "#7fd0ff";
    brightMagenta = "#bfabff";
    brightCyan = "#ff90d7";
    brightWhite = "#f2fbff";
  };

  orange = "#19f988";
  brightOrange = "#9effbb";
  cursor = "#40bfff";

  tools = {
    bat = "ansi";
  };
}
