# ShadeSmear Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/shadesmear-light.yaml
# Author: Kyle Giammarco (http://kyle.giammar.co)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/shadesmear-light.nix. Edits here are lost on the
# next run.

{
  name = "shadesmear-light";
  displayName = "ShadeSmear Light";
  author = "Kyle Giammarco (http://kyle.giammar.co)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#dbdbdb";
  surfaceDim = "#e4e4e4";
  surfaceBright = "#d2d2d2";
  surfaceContainerLowest = "#e4e4e4";
  surfaceContainerLow = "#dbdbdb";
  surfaceContainer = "#e4e4e4";
  surfaceContainerHigh = "#dbdbdb";
  surfaceContainerHighest = "#d2d2d2";
  surfaceVariant = "#e4e4e4";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1c1c1c";
  onSurface = "#232323";
  onSurfaceMuted = "#232323";
  onSurfaceVariant = "#232323";
  onSurfaceFaint = "#4e4e4e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#4e4e4e";
  outlineVariant = "#bababa";

  # --- Accent roles -------------------------------------------------------
  primary = "#376388";
  onPrimary = "#dbdbdb";
  primaryContainer = "#9bacbc";
  onPrimaryContainer = "#1c1c1c";
  secondary = "#c57d42";
  onSecondary = "#1c1c1c";
  tertiary = "#d7ab54";
  onTertiary = "#1c1c1c";
  error = "#cc5450";
  onError = "#ffffff";
  inverseSurface = "#232323";
  inverseOnSurface = "#dbdbdb";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e4e4e4";
    red = "#cc5450";
    green = "#71983b";
    yellow = "#307878";
    blue = "#376388";
    magenta = "#d7ab54";
    cyan = "#c57d42";
    white = "#232323";
    brightBlack = "#4e4e4e";
    brightRed = "#b7413f";
    brightGreen = "#608627";
    brightYellow = "#1b6667";
    brightBlue = "#265276";
    brightMagenta = "#c39840";
    brightCyan = "#b16b2f";
    brightWhite = "#1c1c1c";
  };

  orange = "#a64270";
  brightOrange = "#92305f";
  cursor = "#376388";

  tools = {
    bat = "ansi";
  };
}
