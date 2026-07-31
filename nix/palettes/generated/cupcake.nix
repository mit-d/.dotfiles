# Cupcake -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/cupcake.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/cupcake.nix. Edits here are lost on the
# next run.

{
  name = "cupcake";
  displayName = "Cupcake";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fbf1f2";
  surfaceDim = "#fffafa";
  surfaceBright = "#e3e2e5";
  surfaceContainerLowest = "#fffafa";
  surfaceContainerLow = "#fbf1f2";
  surfaceContainer = "#f2f1f4";
  surfaceContainerHigh = "#ebeaed";
  surfaceContainerHighest = "#e3e2e5";
  surfaceVariant = "#f2f1f4";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#574f61";
  onSurface = "#756c81";
  onSurfaceMuted = "#7d7488";
  onSurfaceVariant = "#867e90";
  onSurfaceFaint = "#aaa3b2";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9f99a8";
  outlineVariant = "#d1ced7";

  # --- Accent roles -------------------------------------------------------
  primary = "#7297b9";
  onPrimary = "#ffffff";
  primaryContainer = "#c6cedd";
  onPrimaryContainer = "#585062";
  secondary = "#69a9a7";
  onSecondary = "#ffffff";
  tertiary = "#bb99b4";
  onTertiary = "#ffffff";
  error = "#d57e85";
  onError = "#ffffff";
  inverseSurface = "#756c81";
  inverseOnSurface = "#fbf1f2";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f2f1f4";
    red = "#d57e85";
    green = "#a3b367";
    yellow = "#dcb16c";
    blue = "#7297b9";
    magenta = "#bb99b4";
    cyan = "#69a9a7";
    white = "#8b8198";
    brightBlack = "#bfb9c6";
    brightRed = "#c16c73";
    brightGreen = "#91a055";
    brightYellow = "#c89e59";
    brightBlue = "#6085a6";
    brightMagenta = "#a887a1";
    brightCyan = "#579695";
    brightWhite = "#585062";
  };

  orange = "#ebb790";
  brightOrange = "#d7a47e";
  cursor = "#7090b1";

  tools = {
    bat = "ansi";
  };
}
