# Valua -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/valua.yaml
# Author: Nonetrix (https://github.com/nonetrix)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/valua.nix. Edits here are lost on the
# next run.

{
  name = "valua";
  displayName = "Valua";
  author = "Nonetrix (https://github.com/nonetrix)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#131f1f";
  surfaceDim = "#071212";
  surfaceBright = "#3d4e4f";
  surfaceContainerLowest = "#071212";
  surfaceContainerLow = "#131f1f";
  surfaceContainer = "#213132";
  surfaceContainerHigh = "#2f3f40";
  surfaceContainerHighest = "#3d4e4f";
  surfaceVariant = "#213132";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#aacbcb";
  onSurface = "#98c1a3";
  onSurfaceMuted = "#82ac8d";
  onSurfaceVariant = "#6d9877";
  onSurfaceFaint = "#3e5c53";

  # --- Borders and dividers -----------------------------------------------
  outline = "#436259";
  outlineVariant = "#273d3c";

  # --- Accent roles -------------------------------------------------------
  primary = "#4ed2d2";
  onPrimary = "#131f1f";
  primaryContainer = "#2b5d5d";
  onPrimaryContainer = "#b1d0cf";
  secondary = "#76dbd2";
  onSecondary = "#131f1f";
  tertiary = "#a874e0";
  onTertiary = "#131f1f";
  error = "#d7586e";
  onError = "#121d1d";
  inverseSurface = "#98c1a3";
  inverseOnSurface = "#131f1f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#213132";
    red = "#d7586e";
    green = "#59d678";
    yellow = "#dfe754";
    blue = "#4ed2d2";
    magenta = "#a874e0";
    cyan = "#76dbd2";
    white = "#98c1a3";
    brightBlack = "#3e5c53";
    brightRed = "#ec6b80";
    brightGreen = "#6eea8b";
    brightYellow = "#f3fb6a";
    brightBlue = "#65e6e6";
    brightMagenta = "#bb87f4";
    brightCyan = "#8aefe6";
    brightWhite = "#aacbcb";
  };

  orange = "#e6b466";
  brightOrange = "#fac779";
  cursor = "#4ed2d2";

  tools = {
    bat = "ansi";
  };
}
