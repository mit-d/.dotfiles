# Tokyo City Terminal Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-city-terminal-light.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-city-terminal-light.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-city-terminal-light";
  displayName = "Tokyo City Terminal Light";
  author = "Michael Ball";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fbfbfd";
  surfaceDim = "#ffffff";
  surfaceBright = "#e7e7e9";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fbfbfd";
  surfaceContainer = "#f6f6f8";
  surfaceContainerHigh = "#efeff1";
  surfaceContainerHighest = "#e7e7e9";
  surfaceVariant = "#f6f6f8";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#171d23";
  onSurface = "#28323a";
  onSurfaceMuted = "#3c4954";
  onSurfaceVariant = "#526270";
  onSurfaceFaint = "#a1adba";

  # --- Borders and dividers -----------------------------------------------
  outline = "#96a2af";
  outlineVariant = "#ced7e1";

  # --- Accent roles -------------------------------------------------------
  primary = "#34548a";
  onPrimary = "#fbfbfd";
  primaryContainer = "#abb9d2";
  onPrimaryContainer = "#171d23";
  secondary = "#0f4b6e";
  onSecondary = "#fbfbfd";
  tertiary = "#5a4a78";
  onTertiary = "#fbfbfd";
  error = "#8c4351";
  onError = "#fbfbfd";
  inverseSurface = "#28323a";
  inverseOnSurface = "#fbfbfd";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f6f6f8";
    red = "#8c4351";
    green = "#33635c";
    yellow = "#8f5e15";
    blue = "#34548a";
    magenta = "#5a4a78";
    cyan = "#0f4b6e";
    white = "#28323a";
    brightBlack = "#b7c5d3";
    brightRed = "#793241";
    brightGreen = "#22524c";
    brightYellow = "#7b4e00";
    brightBlue = "#244378";
    brightMagenta = "#4a3a66";
    brightCyan = "#003b5a";
    brightWhite = "#171d23";
  };

  orange = "#965027";
  brightOrange = "#833f13";
  cursor = "#34548a";

  tools = {
    bat = "ansi";
  };
}
