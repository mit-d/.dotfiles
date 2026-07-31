# Solarized Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/solarized-light.yaml
# Author: Ethan Schoonover (modified by aramisgithub)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/solarized-light.nix. Edits here are lost on the
# next run.

{
  name = "solarized-light";
  displayName = "Solarized Light";
  author = "Ethan Schoonover (modified by aramisgithub)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fdf6e3";
  surfaceDim = "#ffffff";
  surfaceBright = "#d2ccb9";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fdf6e3";
  surfaceContainer = "#eee8d5";
  surfaceContainerHigh = "#e0dac7";
  surfaceContainerHighest = "#d2ccb9";
  surfaceVariant = "#eee8d5";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#002b36";
  onSurface = "#586e75";
  onSurfaceMuted = "#5e747c";
  onSurfaceVariant = "#657b83";
  onSurfaceFaint = "#839496";

  # --- Borders and dividers -----------------------------------------------
  outline = "#839496";
  outlineVariant = "#93a1a1";

  # --- Accent roles -------------------------------------------------------
  primary = "#268bd2";
  onPrimary = "#00222c";
  primaryContainer = "#b2cee0";
  onPrimaryContainer = "#002b36";
  secondary = "#2aa198";
  onSecondary = "#002b36";
  tertiary = "#6c71c4";
  onTertiary = "#0b0a09";
  error = "#dc322f";
  onError = "#fefcf4";
  inverseSurface = "#586e75";
  inverseOnSurface = "#fdf6e3";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#eee8d5";
    red = "#dc322f";
    green = "#859900";
    yellow = "#b58900";
    blue = "#268bd2";
    magenta = "#6c71c4";
    cyan = "#2aa198";
    white = "#586e75";
    brightBlack = "#839496";
    brightRed = "#c6131a";
    brightGreen = "#748600";
    brightYellow = "#9f7800";
    brightBlue = "#0078be";
    brightMagenta = "#5b5fb0";
    brightCyan = "#008e86";
    brightWhite = "#002b36";
  };

  orange = "#cb4b16";
  brightOrange = "#b33b00";
  cursor = "#268bd2";

  tools = {
    bat = "Solarized (light)";
  };
}
