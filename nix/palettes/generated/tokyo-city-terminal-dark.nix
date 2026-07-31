# Tokyo City Terminal Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-city-terminal-dark.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-city-terminal-dark.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-city-terminal-dark";
  displayName = "Tokyo City Terminal Dark";
  author = "Michael Ball";
  variant = "dark";
  version = "3.1.0";

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
  outlineVariant = "#2d373f";

  # --- Accent roles -------------------------------------------------------
  primary = "#539afc";
  onPrimary = "#171d23";
  primaryContainer = "#2e496e";
  onPrimaryContainer = "#fbfbfd";
  secondary = "#70e1e8";
  onSecondary = "#171d23";
  tertiary = "#b62d65";
  onTertiary = "#fbfbfd";
  error = "#d95468";
  onError = "#ffffff";
  inverseSurface = "#d8e2ec";
  inverseOnSurface = "#171d23";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1d252c";
    red = "#d95468";
    green = "#8bd49c";
    yellow = "#ebbf83";
    blue = "#539afc";
    magenta = "#b62d65";
    cyan = "#70e1e8";
    white = "#d8e2ec";
    brightBlack = "#526270";
    brightRed = "#ee677a";
    brightGreen = "#9ee8af";
    brightYellow = "#ffd296";
    brightBlue = "#75aeff";
    brightMagenta = "#cb4276";
    brightCyan = "#85f5fc";
    brightWhite = "#fbfbfd";
  };

  orange = "#ff9e64";
  brightOrange = "#ffbb95";
  cursor = "#539afc";

  tools = {
    bat = "ansi";
  };
}
