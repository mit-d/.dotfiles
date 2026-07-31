# Brogrammer -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/brogrammer.yaml
# Author: Vik Ramanujam (http://github.com/piggyslasher)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/brogrammer.nix. Edits here are lost on the
# next run.

{
  name = "brogrammer";
  displayName = "Brogrammer";
  author = "Vik Ramanujam (http://github.com/piggyslasher)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1f1f1f";
  surfaceDim = "#121212";
  surfaceBright = "#ff786a";
  surfaceContainerLowest = "#121212";
  surfaceContainerLow = "#1f1f1f";
  surfaceContainer = "#f81118";
  surfaceContainerHigh = "#ff4f43";
  surfaceContainerHighest = "#ff786a";
  surfaceVariant = "#f81118";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d6dbe5";
  onSurface = "#7382c7";
  onSurfaceMuted = "#537dc9";
  onSurfaceVariant = "#2a81cd";
  onSurfaceFaint = "#967a2d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#ecba0f";
  outlineVariant = "#2dc55e";

  # --- Accent roles -------------------------------------------------------
  primary = "#5350b9";
  onPrimary = "#d6dbe5";
  primaryContainer = "#313356";
  onPrimaryContainer = "#d6dbe5";
  secondary = "#1081d6";
  onSecondary = "#141414";
  tertiary = "#0f7ddb";
  onTertiary = "#101010";
  error = "#d6dbe5";
  onError = "#1f1f1f";
  inverseSurface = "#7382c7";
  inverseOnSurface = "#1f1f1f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f81118";
    red = "#d6dbe5";
    green = "#f3bd09";
    yellow = "#1dd361";
    blue = "#5350b9";
    magenta = "#0f7ddb";
    cyan = "#1081d6";
    white = "#4e5ab7";
    brightBlack = "#ecba0f";
    brightRed = "#eaeff9";
    brightGreen = "#ffd364";
    brightYellow = "#41e774";
    brightBlue = "#6362cd";
    brightMagenta = "#2d90f0";
    brightCyan = "#2e94ea";
    brightWhite = "#d6dbe5";
  };

  orange = "#de352e";
  brightOrange = "#f44c41";
  cursor = "#5e5fbe";

  tools = {
    bat = "ansi";
  };
}
