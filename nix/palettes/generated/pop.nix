# Pop -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/pop.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/pop.nix. Edits here are lost on the
# next run.

{
  name = "pop";
  displayName = "Pop";
  author = "Chris Kempson (http://chriskempson.com)";
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
  primary = "#0e5a94";
  onPrimary = "#ffffff";
  primaryContainer = "#011122";
  onPrimaryContainer = "#ffffff";
  secondary = "#00aabb";
  onSecondary = "#000000";
  tertiary = "#b31e8d";
  onTertiary = "#ffffff";
  error = "#eb008a";
  onError = "#000000";
  inverseSurface = "#d0d0d0";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#202020";
    red = "#eb008a";
    green = "#37b349";
    yellow = "#f8ca12";
    blue = "#0e5a94";
    magenta = "#b31e8d";
    cyan = "#00aabb";
    white = "#d0d0d0";
    brightBlack = "#505050";
    brightRed = "#ff369c";
    brightGreen = "#4ec75c";
    brightYellow = "#ffe184";
    brightBlue = "#266ca7";
    brightMagenta = "#c837a0";
    brightCyan = "#31bdce";
    brightWhite = "#ffffff";
  };

  orange = "#f29333";
  brightOrange = "#ffaa5e";
  cursor = "#145c96";

  tools = {
    bat = "ansi";
  };
}
