# Ocean -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/ocean.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/ocean.nix. Edits here are lost on the
# next run.

{
  name = "ocean";
  displayName = "Ocean";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2b303b";
  surfaceDim = "#20252f";
  surfaceBright = "#4c565f";
  surfaceContainerLowest = "#20252f";
  surfaceContainerLow = "#2b303b";
  surfaceContainer = "#343d46";
  surfaceContainerHigh = "#404953";
  surfaceContainerHighest = "#4c565f";
  surfaceVariant = "#343d46";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#eff1f5";
  onSurface = "#c0c5ce";
  onSurfaceMuted = "#b3b9c4";
  onSurfaceVariant = "#a7adba";
  onSurfaceFaint = "#65737e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#65737e";
  outlineVariant = "#4f5b66";

  # --- Accent roles -------------------------------------------------------
  primary = "#8fa1b3";
  onPrimary = "#2b303b";
  primaryContainer = "#4f5866";
  onPrimaryContainer = "#eff1f5";
  secondary = "#96b5b4";
  onSecondary = "#2b303b";
  tertiary = "#b48ead";
  onTertiary = "#2b303b";
  error = "#bf616a";
  onError = "#ffffff";
  inverseSurface = "#c0c5ce";
  inverseOnSurface = "#2b303b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#343d46";
    red = "#bf616a";
    green = "#a3be8c";
    yellow = "#ebcb8b";
    blue = "#8fa1b3";
    magenta = "#b48ead";
    cyan = "#96b5b4";
    white = "#c0c5ce";
    brightBlack = "#65737e";
    brightRed = "#d3737c";
    brightGreen = "#b6d19f";
    brightYellow = "#ffdf9e";
    brightBlue = "#a1b4c6";
    brightMagenta = "#c7a0c0";
    brightCyan = "#a9c8c7";
    brightWhite = "#eff1f5";
  };

  orange = "#d08770";
  brightOrange = "#e49a82";
  cursor = "#8fa1b3";

  tools = {
    bat = "ansi";
  };
}
