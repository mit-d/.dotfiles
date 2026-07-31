# Swamp Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/swamp-dark.yaml
# Author: Masroof Maindak (https://github.com/masroof-maindak)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/swamp-dark.nix. Edits here are lost on the
# next run.

{
  name = "swamp-dark";
  displayName = "Swamp Dark";
  author = "Masroof Maindak (https://github.com/masroof-maindak)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#242015";
  surfaceDim = "#171309";
  surfaceBright = "#584e40";
  surfaceContainerLowest = "#171309";
  surfaceContainerLow = "#242015";
  surfaceContainer = "#3a3124";
  surfaceContainerHigh = "#493f32";
  surfaceContainerHighest = "#584e40";
  surfaceVariant = "#3a3124";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f1e9d0";
  onSurface = "#d2c3a4";
  onSurfaceMuted = "#c5b498";
  onSurfaceVariant = "#b8a58c";
  onSurfaceFaint = "#635345";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6c5b4d";
  outlineVariant = "#4d3f32";

  # --- Accent roles -------------------------------------------------------
  primary = "#c1666b";
  onPrimary = "#1c190f";
  primaryContainer = "#5c3a33";
  onPrimaryContainer = "#f1e9d0";
  secondary = "#db930d";
  onSecondary = "#242015";
  tertiary = "#91506c";
  onTertiary = "#f1e9d0";
  error = "#db930d";
  onError = "#242015";
  inverseSurface = "#d2c3a4";
  inverseOnSurface = "#242015";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3a3124";
    red = "#db930d";
    green = "#7a7653";
    yellow = "#a82d56";
    blue = "#c1666b";
    magenta = "#91506c";
    cyan = "#db930d";
    white = "#d2c3a4";
    brightBlack = "#5f4e41";
    brightRed = "#efa631";
    brightGreen = "#8c8864";
    brightYellow = "#bd4167";
    brightBlue = "#d5787d";
    brightMagenta = "#a4617d";
    brightCyan = "#efa631";
    brightWhite = "#f1e9d0";
  };

  orange = "#ebe0bb";
  brightOrange = "#fff4ce";
  cursor = "#c1666b";

  tools = {
    bat = "ansi";
  };
}
