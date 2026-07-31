# Classic Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/classic-dark.yaml
# Author: Jason Heeris (http://heeris.id.au)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/classic-dark.nix. Edits here are lost on the
# next run.

{
  name = "classic-dark";
  displayName = "Classic Dark";
  author = "Jason Heeris (http://heeris.id.au)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#151515";
  surfaceDim = "#0b0b0b";
  surfaceBright = "#383838";
  surfaceContainerLowest = "#0b0b0b";
  surfaceContainerLow = "#151515";
  surfaceContainer = "#202020";
  surfaceContainerHigh = "#2c2c2c";
  surfaceContainerHighest = "#383838";
  surfaceVariant = "#202020";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5f5f5";
  onSurface = "#d0d0d0";
  onSurfaceMuted = "#c0c0c0";
  onSurfaceVariant = "#b0b0b0";
  onSurfaceFaint = "#505050";

  # --- Borders and dividers -----------------------------------------------
  outline = "#575756";
  outlineVariant = "#313130";

  # --- Accent roles -------------------------------------------------------
  primary = "#6a9fb5";
  onPrimary = "#151515";
  primaryContainer = "#34454c";
  onPrimaryContainer = "#f5f5f5";
  secondary = "#75b5aa";
  onSecondary = "#151515";
  tertiary = "#aa759f";
  onTertiary = "#151515";
  error = "#ac4142";
  onError = "#f5f5f5";
  inverseSurface = "#d0d0d0";
  inverseOnSurface = "#151515";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#202020";
    red = "#ac4142";
    green = "#90a959";
    yellow = "#f4bf75";
    blue = "#6a9fb5";
    magenta = "#aa759f";
    cyan = "#75b5aa";
    white = "#d0d0d0";
    brightBlack = "#505050";
    brightRed = "#c05353";
    brightGreen = "#a2bc6b";
    brightYellow = "#ffd59d";
    brightBlue = "#7cb2c8";
    brightMagenta = "#bd87b2";
    brightCyan = "#88c8bd";
    brightWhite = "#f5f5f5";
  };

  orange = "#d28445";
  brightOrange = "#e69758";
  cursor = "#6a9fb5";

  tools = {
    bat = "ansi";
  };
}
