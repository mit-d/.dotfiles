# Tomorrow Night Eighties -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tomorrow-night-eighties.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tomorrow-night-eighties.nix. Edits here are lost on the
# next run.

{
  name = "tomorrow-night-eighties";
  displayName = "Tomorrow Night Eighties";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2d2d2d";
  surfaceDim = "#212121";
  surfaceBright = "#525252";
  surfaceContainerLowest = "#212121";
  surfaceContainerLow = "#2d2d2d";
  surfaceContainer = "#393939";
  surfaceContainerHigh = "#454545";
  surfaceContainerHighest = "#525252";
  surfaceVariant = "#393939";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#cccccc";
  onSurfaceMuted = "#c0c1c0";
  onSurfaceVariant = "#b4b7b4";
  onSurfaceFaint = "#999999";

  # --- Borders and dividers -----------------------------------------------
  outline = "#999999";
  outlineVariant = "#515151";

  # --- Accent roles -------------------------------------------------------
  primary = "#6699cc";
  onPrimary = "#2d2d2d";
  primaryContainer = "#435465";
  onPrimaryContainer = "#ffffff";
  secondary = "#66cccc";
  onSecondary = "#2d2d2d";
  tertiary = "#cc99cc";
  onTertiary = "#2d2d2d";
  error = "#f2777a";
  onError = "#2d2d2d";
  inverseSurface = "#cccccc";
  inverseOnSurface = "#2d2d2d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#393939";
    red = "#f2777a";
    green = "#99cc99";
    yellow = "#ffcc66";
    blue = "#6699cc";
    magenta = "#cc99cc";
    cyan = "#66cccc";
    white = "#cccccc";
    brightBlack = "#999999";
    brightRed = "#ff9091";
    brightGreen = "#ace0ac";
    brightYellow = "#ffe5b4";
    brightBlue = "#78ace0";
    brightMagenta = "#e0ace0";
    brightCyan = "#7ae0e0";
    brightWhite = "#ffffff";
  };

  orange = "#f99157";
  brightOrange = "#ffac81";
  cursor = "#6699cc";

  tools = {
    bat = "ansi";
  };
}
