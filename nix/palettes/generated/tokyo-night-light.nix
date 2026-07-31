# Tokyo Night Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-night-light.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-night-light.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-night-light";
  displayName = "Tokyo Night Light";
  author = "Michael Ball";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#d5d6db";
  surfaceDim = "#dfe0e5";
  surfaceBright = "#b7b8bd";
  surfaceContainerLowest = "#dfe0e5";
  surfaceContainerLow = "#d5d6db";
  surfaceContainer = "#cbccd1";
  surfaceContainerHigh = "#c1c2c7";
  surfaceContainerHighest = "#b7b8bd";
  surfaceVariant = "#cbccd1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1a1b26";
  onSurface = "#343b59";
  onSurfaceMuted = "#40465c";
  onSurfaceVariant = "#4c505e";
  onSurfaceFaint = "#8d8f9a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#838691";
  outlineVariant = "#b4b5bc";

  # --- Accent roles -------------------------------------------------------
  primary = "#34548a";
  onPrimary = "#d5d6db";
  primaryContainer = "#95a3bd";
  onPrimaryContainer = "#1a1b26";
  secondary = "#3e6968";
  onSecondary = "#dcdde1";
  tertiary = "#5a4a78";
  onTertiary = "#d5d6db";
  error = "#343b58";
  onError = "#d5d6db";
  inverseSurface = "#343b59";
  inverseOnSurface = "#d5d6db";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#cbccd1";
    red = "#343b58";
    green = "#485e30";
    yellow = "#166775";
    blue = "#34548a";
    magenta = "#5a4a78";
    cyan = "#3e6968";
    white = "#343b59";
    brightBlack = "#9699a3";
    brightRed = "#252c47";
    brightGreen = "#384d20";
    brightYellow = "#005562";
    brightBlue = "#244378";
    brightMagenta = "#4a3a66";
    brightCyan = "#2d5857";
    brightWhite = "#1a1b26";
  };

  orange = "#965027";
  brightOrange = "#833f13";
  cursor = "#34548a";

  tools = {
    bat = "ansi";
  };
}
