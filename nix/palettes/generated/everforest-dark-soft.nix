# Everforest Dark Soft -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/everforest-dark-soft.yaml
# Author: Sainnhe Park (https://github.com/sainnhe)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/everforest-dark-soft.nix. Edits here are lost on the
# next run.

{
  name = "everforest-dark-soft";
  displayName = "Everforest Dark Soft";
  author = "Sainnhe Park (https://github.com/sainnhe)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#333c43";
  surfaceDim = "#2a333a";
  surfaceBright = "#4d595f";
  surfaceContainerLowest = "#2a333a";
  surfaceContainerLow = "#333c43";
  surfaceContainer = "#3a464c";
  surfaceContainerHigh = "#434f56";
  surfaceContainerHighest = "#4d595f";
  surfaceVariant = "#3a464c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f3ead3";
  onSurface = "#d3c6aa";
  onSurfaceMuted = "#b8b7a5";
  onSurfaceVariant = "#9da9a0";
  onSurfaceFaint = "#859289";

  # --- Borders and dividers -----------------------------------------------
  outline = "#859289";
  outlineVariant = "#4d5960";

  # --- Accent roles -------------------------------------------------------
  primary = "#7fbbb3";
  onPrimary = "#333c43";
  primaryContainer = "#4f696b";
  onPrimaryContainer = "#f3ead3";
  secondary = "#83c092";
  onSecondary = "#333c43";
  tertiary = "#d699b6";
  onTertiary = "#333c43";
  error = "#e67e80";
  onError = "#ffffff";
  inverseSurface = "#d3c6aa";
  inverseOnSurface = "#333c43";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3a464c";
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
    brightWhite = "#f3ead3";
  };

  orange = "#e69875";
  brightOrange = "#faab87";
  cursor = "#7fbbb3";

  tools = {
    bat = "ansi";
  };
}
