# Flat -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/flat.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/flat.nix. Edits here are lost on the
# next run.

{
  name = "flat";
  displayName = "Flat";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2c3e50";
  surfaceDim = "#223345";
  surfaceBright = "#4a5f75";
  surfaceContainerLowest = "#223345";
  surfaceContainerLow = "#2c3e50";
  surfaceContainer = "#34495e";
  surfaceContainerHigh = "#3f546a";
  surfaceContainerHighest = "#4a5f75";
  surfaceVariant = "#34495e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5f5f5";
  onSurface = "#e0e0e0";
  onSurfaceMuted = "#ced1d3";
  onSurfaceVariant = "#bdc3c7";
  onSurfaceFaint = "#95a5a6";

  # --- Borders and dividers -----------------------------------------------
  outline = "#95a5a6";
  outlineVariant = "#7f8c8d";

  # --- Accent roles -------------------------------------------------------
  primary = "#3498db";
  onPrimary = "#1f2c3a";
  primaryContainer = "#335f82";
  onPrimaryContainer = "#f5f5f5";
  secondary = "#1abc9c";
  onSecondary = "#2c3e50";
  tertiary = "#9b59b6";
  onTertiary = "#fbfbfa";
  error = "#e74c3c";
  onError = "#1b1b1b";
  inverseSurface = "#e0e0e0";
  inverseOnSurface = "#2c3e50";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#34495e";
    red = "#e74c3c";
    green = "#2ecc71";
    yellow = "#f1c40f";
    blue = "#3498db";
    magenta = "#9b59b6";
    cyan = "#1abc9c";
    white = "#e0e0e0";
    brightBlack = "#95a5a6";
    brightRed = "#fd604f";
    brightGreen = "#4ae084";
    brightYellow = "#ffd961";
    brightBlue = "#4aabef";
    brightMagenta = "#ae6bca";
    brightCyan = "#3dd0af";
    brightWhite = "#f5f5f5";
  };

  orange = "#e67e22";
  brightOrange = "#fb913b";
  cursor = "#3498db";

  tools = {
    bat = "ansi";
  };
}
