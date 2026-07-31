# Heetch Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/heetch.yaml
# Author: Geoffrey Teale (tealeg@gmail.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/heetch.nix. Edits here are lost on the
# next run.

{
  name = "heetch";
  displayName = "Heetch Dark";
  author = "Geoffrey Teale (tealeg@gmail.com)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#190134";
  surfaceDim = "#0b001d";
  surfaceBright = "#564271";
  surfaceContainerLowest = "#0b001d";
  surfaceContainerLow = "#190134";
  surfaceContainer = "#392551";
  surfaceContainerHigh = "#473361";
  surfaceContainerHighest = "#564271";
  surfaceVariant = "#392551";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#feffff";
  onSurface = "#bdb6c5";
  onSurfaceMuted = "#aca4b6";
  onSurfaceVariant = "#9c92a8";
  onSurfaceFaint = "#7b6d8b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7b6d8b";
  outlineVariant = "#5a496e";

  # --- Accent roles -------------------------------------------------------
  primary = "#bd0152";
  onPrimary = "#feffff";
  primaryContainer = "#510f42";
  onPrimaryContainer = "#feffff";
  secondary = "#f80059";
  onSecondary = "#190134";
  tertiary = "#82034c";
  onTertiary = "#feffff";
  error = "#27d9d5";
  onError = "#190134";
  inverseSurface = "#bdb6c5";
  inverseOnSurface = "#190134";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#392551";
    red = "#27d9d5";
    green = "#c33678";
    yellow = "#8f6c97";
    blue = "#bd0152";
    magenta = "#82034c";
    cyan = "#f80059";
    white = "#bdb6c5";
    brightBlack = "#7b6d8b";
    brightRed = "#48ede9";
    brightGreen = "#d84b8a";
    brightYellow = "#a17eaa";
    brightBlue = "#d32963";
    brightMagenta = "#96205d";
    brightCyan = "#ff5172";
    brightWhite = "#feffff";
  };

  orange = "#5ba2b6";
  brightOrange = "#6eb5c9";
  cursor = "#bd0152";

  tools = {
    bat = "ansi";
  };
}
