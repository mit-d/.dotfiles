# Decaf -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/decaf.yaml
# Author: Alex Mirrington (https://github.com/alexmirrington)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/decaf.nix. Edits here are lost on the
# next run.

{
  name = "decaf";
  displayName = "Decaf";
  author = "Alex Mirrington (https://github.com/alexmirrington)";
  variant = "dark";
  version = "3.1.0";

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
  onSurfaceFaint = "#777777";

  # --- Borders and dividers -----------------------------------------------
  outline = "#777777";
  outlineVariant = "#515151";

  # --- Accent roles -------------------------------------------------------
  primary = "#90bee1";
  onPrimary = "#2d2d2d";
  primaryContainer = "#51606c";
  onPrimaryContainer = "#ffffff";
  secondary = "#bed6ff";
  onSecondary = "#2d2d2d";
  tertiary = "#efb3f7";
  onTertiary = "#2d2d2d";
  error = "#ff7f7b";
  onError = "#2d2d2d";
  inverseSurface = "#cccccc";
  inverseOnSurface = "#2d2d2d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#393939";
    red = "#ff7f7b";
    green = "#beda78";
    yellow = "#ffd67c";
    blue = "#90bee1";
    magenta = "#efb3f7";
    cyan = "#bed6ff";
    white = "#cccccc";
    brightBlack = "#777777";
    brightRed = "#ffa19c";
    brightGreen = "#d1ee8b";
    brightYellow = "#ffeec9";
    brightBlue = "#a3d1f5";
    brightMagenta = "#f9ceff";
    brightCyan = "#dce9ff";
    brightWhite = "#ffffff";
  };

  orange = "#ffbf70";
  brightOrange = "#ffd9ae";
  cursor = "#90bee1";

  tools = {
    bat = "ansi";
  };
}
