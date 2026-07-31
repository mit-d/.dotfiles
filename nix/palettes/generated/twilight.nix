# Twilight -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/twilight.yaml
# Author: David Hart (https://github.com/hartbit)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/twilight.nix. Edits here are lost on the
# next run.

{
  name = "twilight";
  displayName = "Twilight";
  author = "David Hart (https://github.com/hartbit)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1e1e1e";
  surfaceDim = "#121212";
  surfaceBright = "#4f5254";
  surfaceContainerLowest = "#121212";
  surfaceContainerLow = "#1e1e1e";
  surfaceContainer = "#323537";
  surfaceContainerHigh = "#404345";
  surfaceContainerHighest = "#4f5254";
  surfaceVariant = "#323537";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#a7a7a7";
  onSurfaceMuted = "#959495";
  onSurfaceVariant = "#838184";
  onSurfaceFaint = "#5f5a60";

  # --- Borders and dividers -----------------------------------------------
  outline = "#605b61";
  outlineVariant = "#464b50";

  # --- Accent roles -------------------------------------------------------
  primary = "#7587a6";
  onPrimary = "#1e1e1e";
  primaryContainer = "#3d434d";
  onPrimaryContainer = "#ffffff";
  secondary = "#afc4db";
  onSecondary = "#1e1e1e";
  tertiary = "#9b859d";
  onTertiary = "#1e1e1e";
  error = "#cf6a4c";
  onError = "#1e1e1e";
  inverseSurface = "#a7a7a7";
  inverseOnSurface = "#1e1e1e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#323537";
    red = "#cf6a4c";
    green = "#8f9d6a";
    yellow = "#f9ee98";
    blue = "#7587a6";
    magenta = "#9b859d";
    cyan = "#afc4db";
    white = "#a7a7a7";
    brightBlack = "#5f5a60";
    brightRed = "#e47c5e";
    brightGreen = "#a1b07c";
    brightYellow = "#fffffd";
    brightBlue = "#8799b9";
    brightMagenta = "#ae97b0";
    brightCyan = "#c2d7ef";
    brightWhite = "#ffffff";
  };

  orange = "#cda869";
  brightOrange = "#e1bb7c";
  cursor = "#7587a6";

  tools = {
    bat = "ansi";
  };
}
