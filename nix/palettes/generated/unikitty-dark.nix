# Unikitty Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/unikitty-dark.yaml
# Author: Josh W Lewis (@joshwlewis)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/unikitty-dark.nix. Edits here are lost on the
# next run.

{
  name = "unikitty-dark";
  displayName = "Unikitty Dark";
  author = "Josh W Lewis (@joshwlewis)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2e2a31";
  surfaceDim = "#211d23";
  surfaceBright = "#69646c";
  surfaceContainerLowest = "#211d23";
  surfaceContainerLow = "#2e2a31";
  surfaceContainer = "#4a464d";
  surfaceContainerHigh = "#59555c";
  surfaceContainerHighest = "#69646c";
  surfaceVariant = "#4a464d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5f4f7";
  onSurface = "#bcbabe";
  onSurfaceMuted = "#adabb0";
  onSurfaceVariant = "#9f9da2";
  onSurfaceFaint = "#838085";

  # --- Borders and dividers -----------------------------------------------
  outline = "#838085";
  outlineVariant = "#666369";

  # --- Accent roles -------------------------------------------------------
  primary = "#796af5";
  onPrimary = "#161516";
  primaryContainer = "#484376";
  onPrimaryContainer = "#f5f4f7";
  secondary = "#149bda";
  onSecondary = "#2e2a31";
  tertiary = "#bb60ea";
  onTertiary = "#252127";
  error = "#d8137f";
  onError = "#f6f6f8";
  inverseSurface = "#bcbabe";
  inverseOnSurface = "#2e2a31";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#4a464d";
    red = "#d8137f";
    green = "#17ad98";
    yellow = "#dc8a0e";
    blue = "#796af5";
    magenta = "#bb60ea";
    cyan = "#149bda";
    white = "#bcbabe";
    brightBlack = "#838085";
    brightRed = "#ee3491";
    brightGreen = "#39c0ab";
    brightYellow = "#f09d31";
    brightBlue = "#8a81ff";
    brightMagenta = "#cf73ff";
    brightCyan = "#35aeee";
    brightWhite = "#f5f4f7";
  };

  orange = "#d65407";
  brightOrange = "#eb6728";
  cursor = "#796af5";

  tools = {
    bat = "ansi";
  };
}
