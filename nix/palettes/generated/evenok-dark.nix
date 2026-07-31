# Evenok Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/evenok-dark.yaml
# Author: Mekeor Melire
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/evenok-dark.nix. Edits here are lost on the
# next run.

{
  name = "evenok-dark";
  displayName = "Evenok Dark";
  author = "Mekeor Melire";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#3b3b3b";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#202020";
  surfaceContainerHigh = "#2d2d2d";
  surfaceContainerHighest = "#3b3b3b";
  surfaceVariant = "#202020";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#d0d0d0";
  onSurfaceMuted = "#c0c0c0";
  onSurfaceVariant = "#b0b0b0";
  onSurfaceFaint = "#505050";

  # --- Borders and dividers -----------------------------------------------
  outline = "#505050";
  outlineVariant = "#303030";

  # --- Accent roles -------------------------------------------------------
  primary = "#00aff2";
  onPrimary = "#000000";
  primaryContainer = "#002a3e";
  onPrimaryContainer = "#ffffff";
  secondary = "#00bab3";
  onSecondary = "#000000";
  tertiary = "#9095ff";
  onTertiary = "#000000";
  error = "#f5708a";
  onError = "#000000";
  inverseSurface = "#d0d0d0";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#202020";
    red = "#f5708a";
    green = "#54bc5c";
    yellow = "#b8a300";
    blue = "#00aff2";
    magenta = "#9095ff";
    cyan = "#00bab3";
    white = "#d0d0d0";
    brightBlack = "#505050";
    brightRed = "#ff8da0";
    brightGreen = "#68d06f";
    brightYellow = "#cbb62d";
    brightBlue = "#4ac2ff";
    brightMagenta = "#a6acff";
    brightCyan = "#33cdc6";
    brightWhite = "#ffffff";
  };

  orange = "#ee8122";
  brightOrange = "#ff9747";
  cursor = "#00aff2";

  tools = {
    bat = "ansi";
  };
}
