# Precious Dark Eleven -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/precious-dark-eleven.yaml
# Author: 4lex4 <4lex49@zoho.com>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/precious-dark-eleven.nix. Edits here are lost on the
# next run.

{
  name = "precious-dark-eleven";
  displayName = "Precious Dark Eleven";
  author = "4lex4 <4lex49@zoho.com>";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1c1e20";
  surfaceDim = "#101214";
  surfaceBright = "#454749";
  surfaceContainerLowest = "#101214";
  surfaceContainerLow = "#1c1e20";
  surfaceContainer = "#292b2d";
  surfaceContainerHigh = "#37393b";
  surfaceContainerHighest = "#454749";
  surfaceVariant = "#292b2d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#b8b7b6";
  onSurface = "#b8b7b6";
  onSurfaceMuted = "#b0afae";
  onSurfaceVariant = "#a8a8a7";
  onSurfaceFaint = "#858585";

  # --- Borders and dividers -----------------------------------------------
  outline = "#858585";
  outlineVariant = "#37393a";

  # --- Accent roles -------------------------------------------------------
  primary = "#68b0ee";
  onPrimary = "#1c1e20";
  primaryContainer = "#395167";
  onPrimaryContainer = "#c0bfbe";
  secondary = "#42bda7";
  onSecondary = "#1c1e20";
  tertiary = "#b799fe";
  onTertiary = "#1c1e20";
  error = "#ff8782";
  onError = "#1c1e20";
  inverseSurface = "#b8b7b6";
  inverseOnSurface = "#1c1e20";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#292b2d";
    red = "#ff8782";
    green = "#95b658";
    yellow = "#d0a543";
    blue = "#68b0ee";
    magenta = "#b799fe";
    cyan = "#42bda7";
    white = "#b8b7b6";
    brightBlack = "#858585";
    brightRed = "#ffa8a2";
    brightGreen = "#a7c96b";
    brightYellow = "#e4b858";
    brightBlue = "#7fc3ff";
    brightMagenta = "#c7b2ff";
    brightCyan = "#59d0ba";
    brightWhite = "#b8b7b6";
  };

  orange = "#ea9755";
  brightOrange = "#ffaa68";
  cursor = "#68b0ee";

  tools = {
    bat = "ansi";
  };
}
