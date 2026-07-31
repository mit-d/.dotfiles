# Rose Pine Moon -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/rose-pine-moon.yaml
# Author: Emilia Dunfelt <edun@dunfelt.se>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/rose-pine-moon.nix. Edits here are lost on the
# next run.

{
  name = "rose-pine-moon";
  displayName = "Rose Pine Moon";
  author = "Emilia Dunfelt <edun@dunfelt.se>";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#232136";
  surfaceDim = "#1d1b2f";
  surfaceBright = "#38354e";
  surfaceContainerLowest = "#1d1b2f";
  surfaceContainerLow = "#232136";
  surfaceContainer = "#2a273f";
  surfaceContainerHigh = "#312e46";
  surfaceContainerHighest = "#38354e";
  surfaceVariant = "#2a273f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e0def4";
  onSurface = "#e0def4";
  onSurfaceMuted = "#b7b4ce";
  onSurfaceVariant = "#908caa";
  onSurfaceFaint = "#6e6a86";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6e6a86";
  outlineVariant = "#3b3854";

  # --- Accent roles -------------------------------------------------------
  primary = "#c4a7e7";
  onPrimary = "#232136";
  primaryContainer = "#5b5074";
  onPrimaryContainer = "#e0def4";
  secondary = "#9ccfd8";
  onSecondary = "#232136";
  tertiary = "#f6c177";
  onTertiary = "#232136";
  error = "#eb6f92";
  onError = "#232136";
  inverseSurface = "#e0def4";
  inverseOnSurface = "#232136";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2a273f";
    red = "#eb6f92";
    green = "#3e8fb0";
    yellow = "#ea9a97";
    blue = "#c4a7e7";
    magenta = "#f6c177";
    cyan = "#9ccfd8";
    white = "#e0def4";
    brightBlack = "#6e6a86";
    brightRed = "#ff83a5";
    brightGreen = "#52a2c3";
    brightYellow = "#ffadaa";
    brightBlue = "#d7bafb";
    brightMagenta = "#ffd8a4";
    brightCyan = "#afe3ec";
    brightWhite = "#f4f3ff";
  };

  orange = "#f6c177";
  brightOrange = "#ffd8a4";
  cursor = "#c4a7e7";

  tools = {
    bat = "ansi";
  };
}
