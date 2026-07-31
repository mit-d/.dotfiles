# Tokyo City Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-city-dark.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-city-dark.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-city-dark";
  displayName = "Tokyo City Dark";
  author = "Michael Ball";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#171d23";
  surfaceDim = "#10161b";
  surfaceBright = "#2d353d";
  surfaceContainerLowest = "#10161b";
  surfaceContainerLow = "#171d23";
  surfaceContainer = "#1d252c";
  surfaceContainerHigh = "#252d34";
  surfaceContainerHighest = "#2d353d";
  surfaceVariant = "#1d252c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fbfbfd";
  onSurface = "#d8e2ec";
  onSurfaceMuted = "#c7d3df";
  onSurfaceVariant = "#b7c5d3";
  onSurfaceFaint = "#526270";

  # --- Borders and dividers -----------------------------------------------
  outline = "#526270";
  outlineVariant = "#2e373f";

  # --- Accent roles -------------------------------------------------------
  primary = "#7aa2f7";
  onPrimary = "#171d23";
  primaryContainer = "#3a4c6c";
  onPrimaryContainer = "#fbfbfd";
  secondary = "#89ddff";
  onSecondary = "#171d23";
  tertiary = "#bb9af7";
  onTertiary = "#171d23";
  error = "#f7768e";
  onError = "#171d23";
  inverseSurface = "#d8e2ec";
  inverseOnSurface = "#171d23";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1d252c";
    red = "#f7768e";
    green = "#9ece6a";
    yellow = "#b7c5d3";
    blue = "#7aa2f7";
    magenta = "#bb9af7";
    cyan = "#89ddff";
    white = "#d8e2ec";
    brightBlack = "#526270";
    brightRed = "#ff94a5";
    brightGreen = "#b1e27d";
    brightYellow = "#cad8e7";
    brightBlue = "#93b6ff";
    brightMagenta = "#ccb1ff";
    brightCyan = "#beecff";
    brightWhite = "#fbfbfd";
  };

  orange = "#ff9e64";
  brightOrange = "#ffbb95";
  cursor = "#7aa2f7";

  tools = {
    bat = "ansi";
  };
}
