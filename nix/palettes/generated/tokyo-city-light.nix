# Tokyo City Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-city-light.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-city-light.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-city-light";
  displayName = "Tokyo City Light";
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
  onSurface = "#343b59";
  onSurfaceMuted = "#40465c";
  onSurfaceVariant = "#4c505e";
  onSurfaceFaint = "#9699a3";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9699a3";
  outlineVariant = "#d4d6de";

  # --- Accent roles -------------------------------------------------------
  primary = "#34548a";
  onPrimary = "#fbfbfd";
  primaryContainer = "#abb9d2";
  onPrimaryContainer = "#171d23";
  secondary = "#4c505e";
  onSecondary = "#fbfbfd";
  tertiary = "#5a4a78";
  onTertiary = "#fbfbfd";
  error = "#8c4351";
  onError = "#fbfbfd";
  inverseSurface = "#343b59";
  inverseOnSurface = "#fbfbfd";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f6f6f8";
    red = "#8c4351";
    green = "#485e30";
    yellow = "#4c505e";
    blue = "#34548a";
    magenta = "#5a4a78";
    cyan = "#4c505e";
    white = "#343b59";
    brightBlack = "#9699a3";
    brightRed = "#793241";
    brightGreen = "#384d20";
    brightYellow = "#3c404d";
    brightBlue = "#244378";
    brightMagenta = "#4a3a66";
    brightCyan = "#3c404d";
    brightWhite = "#171d23";
  };

  orange = "#965027";
  brightOrange = "#833f13";
  cursor = "#34548a";

  tools = {
    bat = "ansi";
  };
}
