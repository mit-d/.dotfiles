# Unikitty Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/unikitty-light.yaml
# Author: Josh W Lewis (@joshwlewis)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/unikitty-light.nix. Edits here are lost on the
# next run.

{
  name = "unikitty-light";
  displayName = "Unikitty Light";
  author = "Josh W Lewis (@joshwlewis)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#bdbdbe";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#e1e1e2";
  surfaceContainerHigh = "#cfcfd0";
  surfaceContainerHighest = "#bdbdbe";
  surfaceVariant = "#e1e1e2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#322d34";
  onSurface = "#6c696e";
  onSurfaceMuted = "#7a787c";
  onSurfaceVariant = "#89878b";
  onSurfaceFaint = "#a7a5a8";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a5a3a6";
  outlineVariant = "#c4c3c5";

  # --- Accent roles -------------------------------------------------------
  primary = "#775dff";
  onPrimary = "#ffffff";
  primaryContainer = "#c5c5ff";
  onPrimaryContainer = "#322d34";
  secondary = "#149bda";
  onSecondary = "#ffffff";
  tertiary = "#aa17e6";
  onTertiary = "#ffffff";
  error = "#d8137f";
  onError = "#ffffff";
  inverseSurface = "#6c696e";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e1e1e2";
    red = "#d8137f";
    green = "#17ad98";
    yellow = "#dc8a0e";
    blue = "#775dff";
    magenta = "#aa17e6";
    cyan = "#149bda";
    white = "#6c696e";
    brightBlack = "#a7a5a8";
    brightRed = "#bd006d";
    brightGreen = "#009986";
    brightYellow = "#c47900";
    brightBlue = "#6748ea";
    brightMagenta = "#9400ca";
    brightCyan = "#0088c2";
    brightWhite = "#322d34";
  };

  orange = "#d65407";
  brightOrange = "#bb4700";
  cursor = "#775dff";

  tools = {
    bat = "ansi";
  };
}
