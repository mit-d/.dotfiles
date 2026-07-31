# Qualia -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/qualia.yaml
# Author: isaacwhanson
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/qualia.nix. Edits here are lost on the
# next run.

{
  name = "qualia";
  displayName = "Qualia";
  author = "isaacwhanson";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#101010";
  surfaceDim = "#050505";
  surfaceBright = "#636363";
  surfaceContainerLowest = "#050505";
  surfaceContainerLow = "#101010";
  surfaceContainer = "#454545";
  surfaceContainerHigh = "#545454";
  surfaceContainerHighest = "#636363";
  surfaceVariant = "#454545";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#c0c0c0";
  onSurface = "#c0c0c0";
  onSurfaceMuted = "#9f9f9f";
  onSurfaceVariant = "#808080";
  onSurfaceFaint = "#4c4c4b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#545453";
  outlineVariant = "#454545";

  # --- Accent roles -------------------------------------------------------
  primary = "#50cacd";
  onPrimary = "#101010";
  primaryContainer = "#2c4f50";
  onPrimaryContainer = "#c0c0c0";
  secondary = "#c8c874";
  onSecondary = "#101010";
  tertiary = "#e0af85";
  onTertiary = "#101010";
  error = "#efa6a2";
  onError = "#101010";
  inverseSurface = "#c0c0c0";
  inverseOnSurface = "#101010";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#454545";
    red = "#efa6a2";
    green = "#80c990";
    yellow = "#e6a3dc";
    blue = "#50cacd";
    magenta = "#e0af85";
    cyan = "#c8c874";
    white = "#c0c0c0";
    brightBlack = "#555555";
    brightRed = "#ffbbb7";
    brightGreen = "#93dda3";
    brightYellow = "#fab6f0";
    brightBlue = "#66dee1";
    brightMagenta = "#f4c298";
    brightCyan = "#dbdc87";
    brightWhite = "#d3d3d3";
  };

  orange = "#a3b8ef";
  brightOrange = "#b8ccff";
  cursor = "#50cacd";

  tools = {
    bat = "ansi";
  };
}
