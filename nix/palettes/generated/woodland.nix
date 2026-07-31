# Woodland -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/woodland.yaml
# Author: Jay Cornwall (https://jcornwall.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/woodland.nix. Edits here are lost on the
# next run.

{
  name = "woodland";
  displayName = "Woodland";
  author = "Jay Cornwall (https://jcornwall.com)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#231e18";
  surfaceDim = "#16120c";
  surfaceBright = "#4c4740";
  surfaceContainerLowest = "#16120c";
  surfaceContainerLow = "#231e18";
  surfaceContainer = "#302b25";
  surfaceContainerHigh = "#3e3932";
  surfaceContainerHighest = "#4c4740";
  surfaceVariant = "#302b25";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e4d4c8";
  onSurface = "#cabcb1";
  onSurfaceMuted = "#bfb0a0";
  onSurfaceVariant = "#b4a490";
  onSurfaceFaint = "#9d8b70";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9d8b70";
  outlineVariant = "#48413a";

  # --- Accent roles -------------------------------------------------------
  primary = "#88a4d3";
  onPrimary = "#231e18";
  primaryContainer = "#474d59";
  onPrimaryContainer = "#e4d4c8";
  secondary = "#6eb958";
  onSecondary = "#231e18";
  tertiary = "#bb90e2";
  onTertiary = "#231e18";
  error = "#d35c5c";
  onError = "#1e1914";
  inverseSurface = "#cabcb1";
  inverseOnSurface = "#231e18";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#302b25";
    red = "#d35c5c";
    green = "#b7ba53";
    yellow = "#e0ac16";
    blue = "#88a4d3";
    magenta = "#bb90e2";
    cyan = "#6eb958";
    white = "#cabcb1";
    brightBlack = "#9d8b70";
    brightRed = "#e86f6d";
    brightGreen = "#cacd67";
    brightYellow = "#f4bf38";
    brightBlue = "#9ab7e7";
    brightMagenta = "#cea3f6";
    brightCyan = "#81cc6b";
    brightWhite = "#e4d4c8";
  };

  orange = "#ca7f32";
  brightOrange = "#de9247";
  cursor = "#88a4d3";

  tools = {
    bat = "ansi";
  };
}
