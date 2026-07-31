# Github Light High Contrast -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/github-light-high-contrast.yaml
# Author: Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/github-light-high-contrast.nix. Edits here are lost on the
# next run.

{
  name = "github-light-high-contrast";
  displayName = "Github Light High Contrast";
  author = "Tinted Theming (https://github.com/tinted-theming)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#c3c8cc";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#e7ecf0";
  surfaceContainerHigh = "#d5dade";
  surfaceContainerHighest = "#c3c8cc";
  surfaceVariant = "#e7ecf0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#0e1116";
  onSurface = "#343b43";
  onSurfaceMuted = "#4c555e";
  onSurfaceVariant = "#66707b";
  onSurfaceFaint = "#88929d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#88929d";
  outlineVariant = "#acb6c0";

  # --- Accent roles -------------------------------------------------------
  primary = "#622cbc";
  onPrimary = "#ffffff";
  primaryContainer = "#bdb3ea";
  onPrimaryContainer = "#0e1116";
  secondary = "#024c1a";
  onSecondary = "#ffffff";
  tertiary = "#a0111f";
  onTertiary = "#ffffff";
  error = "#702c00";
  onError = "#ffffff";
  inverseSurface = "#343b43";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e7ecf0";
    red = "#702c00";
    green = "#032563";
    yellow = "#956400";
    blue = "#622cbc";
    magenta = "#a0111f";
    cyan = "#024c1a";
    white = "#343b43";
    brightBlack = "#88929d";
    brightRed = "#582100";
    brightGreen = "#001749";
    brightYellow = "#7f5400";
    brightBlue = "#5311a8";
    brightMagenta = "#860014";
    brightCyan = "#003a11";
    brightWhite = "#0e1116";
  };

  orange = "#023b95";
  brightOrange = "#002d77";
  cursor = "#622cbc";

  tools = {
    bat = "ansi";
  };
}
