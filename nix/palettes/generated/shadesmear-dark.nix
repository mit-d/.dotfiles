# ShadeSmear Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/shadesmear-dark.yaml
# Author: Kyle Giammarco (http://kyle.giammar.co)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/shadesmear-dark.nix. Edits here are lost on the
# next run.

{
  name = "shadesmear-dark";
  displayName = "ShadeSmear Dark";
  author = "Kyle Giammarco (http://kyle.giammar.co)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#232323";
  surfaceDim = "#1c1c1c";
  surfaceBright = "#2a2a2a";
  surfaceContainerLowest = "#1c1c1c";
  surfaceContainerLow = "#232323";
  surfaceContainer = "#1c1c1c";
  surfaceContainerHigh = "#232323";
  surfaceContainerHighest = "#2a2a2a";
  surfaceVariant = "#1c1c1c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e4e4e4";
  onSurface = "#dbdbdb";
  onSurfaceMuted = "#dbdbdb";
  onSurfaceVariant = "#dbdbdb";
  onSurfaceFaint = "#c0c0c0";

  # --- Borders and dividers -----------------------------------------------
  outline = "#c0c0c0";
  outlineVariant = "#4e4e4e";

  # --- Accent roles -------------------------------------------------------
  primary = "#376388";
  onPrimary = "#e4e4e4";
  primaryContainer = "#2c3a47";
  onPrimaryContainer = "#e4e4e4";
  secondary = "#c57d42";
  onSecondary = "#232323";
  tertiary = "#d7ab54";
  onTertiary = "#232323";
  error = "#cc5450";
  onError = "#ffffff";
  inverseSurface = "#dbdbdb";
  inverseOnSurface = "#232323";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1c1c1c";
    red = "#cc5450";
    green = "#71983b";
    yellow = "#307878";
    blue = "#376388";
    magenta = "#d7ab54";
    cyan = "#c57d42";
    white = "#dbdbdb";
    brightBlack = "#c0c0c0";
    brightRed = "#e16761";
    brightGreen = "#83ab4e";
    brightYellow = "#438a8a";
    brightBlue = "#48749a";
    brightMagenta = "#ebbe68";
    brightCyan = "#d98f55";
    brightWhite = "#e4e4e4";
  };

  orange = "#a64270";
  brightOrange = "#ba5482";
  cursor = "#497092";

  tools = {
    bat = "ansi";
  };
}
