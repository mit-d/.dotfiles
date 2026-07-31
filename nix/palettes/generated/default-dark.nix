# Default Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/default-dark.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/default-dark.nix. Edits here are lost on the
# next run.

{
  name = "default-dark";
  displayName = "Default Dark";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#181818";
  surfaceDim = "#0c0c0c";
  surfaceBright = "#444444";
  surfaceContainerLowest = "#0c0c0c";
  surfaceContainerLow = "#181818";
  surfaceContainer = "#282828";
  surfaceContainerHigh = "#363636";
  surfaceContainerHighest = "#444444";
  surfaceVariant = "#282828";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f8f8f8";
  onSurface = "#d8d8d8";
  onSurfaceMuted = "#c8c8c8";
  onSurfaceVariant = "#b8b8b8";
  onSurfaceFaint = "#585858";

  # --- Borders and dividers -----------------------------------------------
  outline = "#595958";
  outlineVariant = "#383838";

  # --- Accent roles -------------------------------------------------------
  primary = "#7cafc2";
  onPrimary = "#181818";
  primaryContainer = "#3c4c52";
  onPrimaryContainer = "#f8f8f8";
  secondary = "#86c1b9";
  onSecondary = "#181818";
  tertiary = "#ba8baf";
  onTertiary = "#181818";
  error = "#ab4642";
  onError = "#f8f8f8";
  inverseSurface = "#d8d8d8";
  inverseOnSurface = "#181818";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282828";
    red = "#ab4642";
    green = "#a1b56c";
    yellow = "#f7ca88";
    blue = "#7cafc2";
    magenta = "#ba8baf";
    cyan = "#86c1b9";
    white = "#d8d8d8";
    brightBlack = "#585858";
    brightRed = "#bf5853";
    brightGreen = "#b4c87e";
    brightYellow = "#ffe1b6";
    brightBlue = "#8fc2d5";
    brightMagenta = "#cd9dc2";
    brightCyan = "#99d4cc";
    brightWhite = "#f8f8f8";
  };

  orange = "#dc9656";
  brightOrange = "#f0a969";
  cursor = "#7cafc2";

  tools = {
    bat = "ansi";
  };
}
