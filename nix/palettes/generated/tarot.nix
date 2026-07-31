# tarot -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tarot.yaml
# Author: ed (https://codeberg.org/ed)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tarot.nix. Edits here are lost on the
# next run.

{
  name = "tarot";
  displayName = "tarot";
  author = "ed (https://codeberg.org/ed)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0e091d";
  surfaceDim = "#040210";
  surfaceBright = "#46315a";
  surfaceContainerLowest = "#040210";
  surfaceContainerLow = "#0e091d";
  surfaceContainer = "#2a153c";
  surfaceContainerHigh = "#38234b";
  surfaceContainerHighest = "#46315a";
  surfaceVariant = "#2a153c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#dc8f7c";
  onSurface = "#b46072";
  onSurfaceMuted = "#a85873";
  onSurfaceVariant = "#9b5073";
  onSurfaceFaint = "#74316b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7d3a6d";
  outlineVariant = "#4b2054";

  # --- Accent roles -------------------------------------------------------
  primary = "#6e6080";
  onPrimary = "#e4e3e6";
  primaryContainer = "#2f2740";
  onPrimaryContainer = "#dc8f7c";
  secondary = "#8c9785";
  onSecondary = "#0e091d";
  tertiary = "#a45782";
  onTertiary = "#f5f5f6";
  error = "#c53253";
  onError = "#ececee";
  inverseSurface = "#b46072";
  inverseOnSurface = "#0e091d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2a153c";
    red = "#c53253";
    green = "#a68e5a";
    yellow = "#ff6565";
    blue = "#6e6080";
    magenta = "#a45782";
    cyan = "#8c9785";
    white = "#aa556f";
    brightBlack = "#74316b";
    brightRed = "#da4764";
    brightGreen = "#b9a06c";
    brightYellow = "#ff8b87";
    brightBlue = "#807192";
    brightMagenta = "#b86994";
    brightCyan = "#9eaa97";
    brightWhite = "#dc8f7c";
  };

  orange = "#ea4d60";
  brightOrange = "#ff6272";
  cursor = "#6e6080";

  tools = {
    bat = "ansi";
  };
}
