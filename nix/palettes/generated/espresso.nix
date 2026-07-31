# Espresso -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/espresso.yaml
# Author: Unknown. Maintained by Alex Mirrington (https://github.com/alexmirrington)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/espresso.nix. Edits here are lost on the
# next run.

{
  name = "espresso";
  displayName = "Espresso";
  author = "Unknown. Maintained by Alex Mirrington (https://github.com/alexmirrington)";
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
  primary = "#6c99bb";
  onPrimary = "#2d2d2d";
  primaryContainer = "#45545f";
  onPrimaryContainer = "#ffffff";
  secondary = "#bed6ff";
  onSecondary = "#2d2d2d";
  tertiary = "#d197d9";
  onTertiary = "#2d2d2d";
  error = "#d25252";
  onError = "#ffffff";
  inverseSurface = "#cccccc";
  inverseOnSurface = "#2d2d2d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#393939";
    red = "#d25252";
    green = "#a5c261";
    yellow = "#ffc66d";
    blue = "#6c99bb";
    magenta = "#d197d9";
    cyan = "#bed6ff";
    white = "#cccccc";
    brightBlack = "#777777";
    brightRed = "#e76563";
    brightGreen = "#b8d674";
    brightYellow = "#ffdfb2";
    brightBlue = "#7eacce";
    brightMagenta = "#e5aaed";
    brightCyan = "#dce9ff";
    brightWhite = "#ffffff";
  };

  orange = "#f9a959";
  brightOrange = "#ffc28a";
  cursor = "#6c99bb";

  tools = {
    bat = "ansi";
  };
}
