# Everforest Dark Hard -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/everforest-dark-hard.yaml
# Author: Sainnhe Park (https://github.com/sainnhe)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/everforest-dark-hard.nix. Edits here are lost on the
# next run.

{
  name = "everforest-dark-hard";
  displayName = "Everforest Dark Hard";
  author = "Sainnhe Park (https://github.com/sainnhe)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#272e33";
  surfaceDim = "#1e252a";
  surfaceBright = "#414b4f";
  surfaceContainerLowest = "#1e252a";
  surfaceContainerLow = "#272e33";
  surfaceContainer = "#2e383c";
  surfaceContainerHigh = "#374246";
  surfaceContainerHighest = "#414b4f";
  surfaceVariant = "#2e383c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fffbef";
  onSurface = "#d3c6aa";
  onSurfaceMuted = "#b8b7a5";
  onSurfaceVariant = "#9da9a0";
  onSurfaceFaint = "#859289";

  # --- Borders and dividers -----------------------------------------------
  outline = "#859289";
  outlineVariant = "#414b50";

  # --- Accent roles -------------------------------------------------------
  primary = "#7fbbb3";
  onPrimary = "#272e33";
  primaryContainer = "#476060";
  onPrimaryContainer = "#fffbef";
  secondary = "#83c092";
  onSecondary = "#272e33";
  tertiary = "#d699b6";
  onTertiary = "#272e33";
  error = "#e67e80";
  onError = "#272e33";
  inverseSurface = "#d3c6aa";
  inverseOnSurface = "#272e33";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2e383c";
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
    brightWhite = "#fffbef";
  };

  orange = "#e69875";
  brightOrange = "#faab87";
  cursor = "#7fbbb3";

  tools = {
    bat = "ansi";
  };
}
