# Kanagawa -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/kanagawa.yaml
# Author: Tommaso Laurenzi (https://github.com/rebelot)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/kanagawa.nix. Edits here are lost on the
# next run.

{
  name = "kanagawa";
  displayName = "Kanagawa";
  author = "Tommaso Laurenzi (https://github.com/rebelot)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1f1f28";
  surfaceDim = "#16161e";
  surfaceBright = "#292930";
  surfaceContainerLowest = "#16161e";
  surfaceContainerLow = "#1f1f28";
  surfaceContainer = "#16161d";
  surfaceContainerHigh = "#1f1f27";
  surfaceContainerHighest = "#292930";
  surfaceVariant = "#16161d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#c8c093";
  onSurface = "#c4c0a8";
  onSurfaceMuted = "#a5a391";
  onSurfaceVariant = "#76746b";
  onSurfaceFaint = "#54546d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5c5c70";
  outlineVariant = "#2a394d";

  # --- Accent roles -------------------------------------------------------
  primary = "#7e9cd8";
  onPrimary = "#1f1f28";
  primaryContainer = "#414b65";
  onPrimaryContainer = "#c8c093";
  secondary = "#6a9589";
  onSecondary = "#1f1f28";
  tertiary = "#957fb8";
  onTertiary = "#1f1f28";
  error = "#c34043";
  onError = "#f1f1f2";
  inverseSurface = "#c4c0a8";
  inverseOnSurface = "#1f1f28";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#16161d";
    red = "#c34043";
    green = "#76946a";
    yellow = "#c0a36e";
    blue = "#7e9cd8";
    magenta = "#957fb8";
    cyan = "#6a9589";
    white = "#dcd7ba";
    brightBlack = "#54546d";
    brightRed = "#d85454";
    brightGreen = "#88a77c";
    brightYellow = "#d3b680";
    brightBlue = "#90afec";
    brightMagenta = "#a791cb";
    brightCyan = "#7ca89b";
    brightWhite = "#c8c093";
  };

  orange = "#ffa066";
  brightOrange = "#ffbd97";
  cursor = "#7e9cd8";

  tools = {
    bat = "ansi";
  };
}
