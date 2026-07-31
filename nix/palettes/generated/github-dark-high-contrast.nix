# Github Dark High Contrast -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/github-dark-high-contrast.yaml
# Author: Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/github-dark-high-contrast.nix. Edits here are lost on the
# next run.

{
  name = "github-dark-high-contrast";
  displayName = "Github Dark High Contrast";
  author = "Tinted Theming (https://github.com/tinted-theming)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0a0c10";
  surfaceDim = "#020305";
  surfaceBright = "#434750";
  surfaceContainerLowest = "#020305";
  surfaceContainerLow = "#0a0c10";
  surfaceContainer = "#272b33";
  surfaceContainerHigh = "#353941";
  surfaceContainerHighest = "#434750";
  surfaceVariant = "#272b33";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#f0f3f6";
  onSurfaceMuted = "#d6dbe1";
  onSurfaceVariant = "#bdc4cc";
  onSurfaceFaint = "#9ea7b3";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9ea7b3";
  outlineVariant = "#7a828e";

  # --- Accent roles -------------------------------------------------------
  primary = "#dbb7ff";
  onPrimary = "#0a0c10";
  primaryContainer = "#504660";
  onPrimaryContainer = "#ffffff";
  secondary = "#72f088";
  onSecondary = "#0a0c10";
  tertiary = "#ff9492";
  onTertiary = "#0a0c10";
  error = "#ffb757";
  onError = "#0a0c10";
  inverseSurface = "#f0f3f6";
  inverseOnSurface = "#0a0c10";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#272b33";
    red = "#ffb757";
    green = "#addcff";
    yellow = "#e09b13";
    blue = "#dbb7ff";
    magenta = "#ff9492";
    cyan = "#72f088";
    white = "#f0f3f6";
    brightBlack = "#9ea7b3";
    brightRed = "#ffd29b";
    brightGreen = "#d5edff";
    brightYellow = "#f4ae35";
    brightBlue = "#e8d2ff";
    brightMagenta = "#ffb4b1";
    brightCyan = "#9dffaa";
    brightWhite = "#ffffff";
  };

  orange = "#91cbff";
  brightOrange = "#b8ddff";
  cursor = "#dbb7ff";

  tools = {
    bat = "ansi";
  };
}
