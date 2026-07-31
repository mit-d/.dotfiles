# Macintosh -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/macintosh.yaml
# Author: Rebecca Bettencourt (http://www.kreativekorp.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/macintosh.nix. Edits here are lost on the
# next run.

{
  name = "macintosh";
  displayName = "Macintosh";
  author = "Rebecca Bettencourt (http://www.kreativekorp.com)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#5e5e5e";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#404040";
  surfaceContainerHigh = "#4f4f4f";
  surfaceContainerHighest = "#5e5e5e";
  surfaceVariant = "#404040";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#c0c0c0";
  onSurfaceMuted = "#9f9f9f";
  onSurfaceVariant = "#808080";
  onSurfaceFaint = "#808080";

  # --- Borders and dividers -----------------------------------------------
  outline = "#808080";
  outlineVariant = "#404040";

  # --- Accent roles -------------------------------------------------------
  primary = "#0000d3";
  onPrimary = "#ffffff";
  primaryContainer = "#000035";
  onPrimaryContainer = "#ffffff";
  secondary = "#02abea";
  onSecondary = "#000000";
  tertiary = "#4700a5";
  onTertiary = "#ffffff";
  error = "#dd0907";
  onError = "#ffffff";
  inverseSurface = "#c0c0c0";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#404040";
    red = "#dd0907";
    green = "#1fb714";
    yellow = "#fbf305";
    blue = "#0000d3";
    magenta = "#4700a5";
    cyan = "#02abea";
    white = "#c0c0c0";
    brightBlack = "#808080";
    brightRed = "#f33125";
    brightGreen = "#3dcb33";
    brightYellow = "#ffffff";
    brightBlue = "#0031e5";
    brightMagenta = "#5524b9";
    brightCyan = "#32befe";
    brightWhite = "#ffffff";
  };

  orange = "#ff6403";
  brightOrange = "#ff8a59";
  cursor = "#1448dd";

  tools = {
    bat = "ansi";
  };
}
