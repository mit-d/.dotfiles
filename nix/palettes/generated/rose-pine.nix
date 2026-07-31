# Rose Pine -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/rose-pine.yaml
# Author: Emilia Dunfelt <edun@dunfelt.se>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/rose-pine.nix. Edits here are lost on the
# next run.

{
  name = "rose-pine";
  displayName = "Rose Pine";
  author = "Emilia Dunfelt <edun@dunfelt.se>";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#191724";
  surfaceDim = "#13111d";
  surfaceBright = "#2c2b3c";
  surfaceContainerLowest = "#13111d";
  surfaceContainerLow = "#191724";
  surfaceContainer = "#1f1d2e";
  surfaceContainerHigh = "#262435";
  surfaceContainerHighest = "#2c2b3c";
  surfaceVariant = "#1f1d2e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e0def4";
  onSurface = "#e0def4";
  onSurfaceMuted = "#b7b4ce";
  onSurfaceVariant = "#908caa";
  onSurfaceFaint = "#6e6a86";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6e6a86";
  outlineVariant = "#333048";

  # --- Accent roles -------------------------------------------------------
  primary = "#c4a7e7";
  onPrimary = "#191724";
  primaryContainer = "#544967";
  onPrimaryContainer = "#e0def4";
  secondary = "#9ccfd8";
  onSecondary = "#191724";
  tertiary = "#f6c177";
  onTertiary = "#191724";
  error = "#eb6f92";
  onError = "#191724";
  inverseSurface = "#e0def4";
  inverseOnSurface = "#191724";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1f1d2e";
    red = "#eb6f92";
    green = "#31748f";
    yellow = "#ebbcba";
    blue = "#c4a7e7";
    magenta = "#f6c177";
    cyan = "#9ccfd8";
    white = "#e0def4";
    brightBlack = "#6e6a86";
    brightRed = "#ff83a5";
    brightGreen = "#4486a2";
    brightYellow = "#ffcfcd";
    brightBlue = "#d7bafb";
    brightMagenta = "#ffd8a4";
    brightCyan = "#afe3ec";
    brightWhite = "#e0def4";
  };

  orange = "#f6c177";
  brightOrange = "#ffd8a4";
  cursor = "#c4a7e7";

  tools = {
    bat = "ansi";
  };
}
