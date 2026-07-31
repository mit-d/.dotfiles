# Everforest -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/everforest.yaml
# Author: Sainnhe Park (https://github.com/sainnhe)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/everforest.nix. Edits here are lost on the
# next run.

{
  name = "everforest";
  displayName = "Everforest";
  author = "Sainnhe Park (https://github.com/sainnhe)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2d353b";
  surfaceDim = "#242c32";
  surfaceBright = "#475257";
  surfaceContainerLowest = "#242c32";
  surfaceContainerLow = "#2d353b";
  surfaceContainer = "#343f44";
  surfaceContainerHigh = "#3d494e";
  surfaceContainerHighest = "#475257";
  surfaceVariant = "#343f44";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fdf6e3";
  onSurface = "#d3c6aa";
  onSurfaceMuted = "#b8b7a5";
  onSurfaceVariant = "#9da9a0";
  onSurfaceFaint = "#859289";

  # --- Borders and dividers -----------------------------------------------
  outline = "#859289";
  outlineVariant = "#475258";

  # --- Accent roles -------------------------------------------------------
  primary = "#7fbbb3";
  onPrimary = "#2d353b";
  primaryContainer = "#4b6566";
  onPrimaryContainer = "#fdf6e3";
  secondary = "#83c092";
  onSecondary = "#2d353b";
  tertiary = "#d699b6";
  onTertiary = "#2d353b";
  error = "#e67e80";
  onError = "#2d353b";
  inverseSurface = "#d3c6aa";
  inverseOnSurface = "#2d353b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#343f44";
    red = "#e67e80";
    green = "#a7c080";
    yellow = "#dbbc7f";
    blue = "#7fbbb3";
    magenta = "#d699b6";
    cyan = "#83c092";
    white = "#d3c6aa";
    brightBlack = "#859289";
    brightRed = "#fb9192";
    brightGreen = "#bad393";
    brightYellow = "#efcf92";
    brightBlue = "#92cec6";
    brightMagenta = "#eaacc9";
    brightCyan = "#96d3a5";
    brightWhite = "#fdf6e3";
  };

  orange = "#e69875";
  brightOrange = "#faab87";
  cursor = "#7fbbb3";

  tools = {
    bat = "ansi";
  };
}
