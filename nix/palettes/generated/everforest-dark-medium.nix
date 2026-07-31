# Everforest Dark Medium -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/everforest-dark-medium.yaml
# Author: Sainnhe Park (https://github.com/sainnhe)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/everforest-dark-medium.nix. Edits here are lost on the
# next run.

{
  name = "everforest-dark-medium";
  displayName = "Everforest Dark Medium";
  author = "Sainnhe Park (https://github.com/sainnhe)";
  variant = "dark";
  version = "3.1.0";

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
  onSurfaceStrong = "#d3c6aa";
  onSurface = "#969e91";
  onSurfaceMuted = "#8d9487";
  onSurfaceVariant = "#828a7d";
  onSurfaceFaint = "#626868";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6c716e";
  outlineVariant = "#414b50";

  # --- Accent roles -------------------------------------------------------
  primary = "#7fbbb3";
  onPrimary = "#2d353b";
  primaryContainer = "#4b6566";
  onPrimaryContainer = "#e2d9c7";
  secondary = "#83c092";
  onSecondary = "#2d353b";
  tertiary = "#d699b6";
  onTertiary = "#2d353b";
  error = "#e67e80";
  onError = "#2d353b";
  inverseSurface = "#969e91";
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
    white = "#859289";
    brightBlack = "#475258";
    brightRed = "#fb9192";
    brightGreen = "#bad393";
    brightYellow = "#efcf92";
    brightBlue = "#92cec6";
    brightMagenta = "#eaacc9";
    brightCyan = "#96d3a5";
    brightWhite = "#d3c6aa";
  };

  orange = "#e69875";
  brightOrange = "#faab87";
  cursor = "#7fbbb3";

  tools = {
    bat = "ansi";
  };
}
