# Framer -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/framer.yaml
# Author: Framer (Maintained by Jesse Hoyos)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/framer.nix. Edits here are lost on the
# next run.

{
  name = "framer";
  displayName = "Framer";
  author = "Framer (Maintained by Jesse Hoyos)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#181818";
  surfaceDim = "#131313";
  surfaceBright = "#1f1f1f";
  surfaceContainerLowest = "#131313";
  surfaceContainerLow = "#181818";
  surfaceContainer = "#151515";
  surfaceContainerHigh = "#1a1a1a";
  surfaceContainerHighest = "#1f1f1f";
  surfaceVariant = "#151515";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#eeeeee";
  onSurface = "#d0d0d0";
  onSurfaceMuted = "#c4c4c4";
  onSurfaceVariant = "#b9b9b9";
  onSurfaceFaint = "#747474";

  # --- Borders and dividers -----------------------------------------------
  outline = "#747474";
  outlineVariant = "#464646";

  # --- Accent roles -------------------------------------------------------
  primary = "#20bcfc";
  onPrimary = "#181818";
  primaryContainer = "#295165";
  onPrimaryContainer = "#eeeeee";
  secondary = "#acddfd";
  onSecondary = "#181818";
  tertiary = "#ba8cfc";
  onTertiary = "#181818";
  error = "#fd886b";
  onError = "#181818";
  inverseSurface = "#d0d0d0";
  inverseOnSurface = "#181818";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#151515";
    red = "#fd886b";
    green = "#32ccdc";
    yellow = "#fecb6e";
    blue = "#20bcfc";
    magenta = "#ba8cfc";
    cyan = "#acddfd";
    white = "#d0d0d0";
    brightBlack = "#747474";
    brightRed = "#ffa791";
    brightGreen = "#4ee0f0";
    brightYellow = "#ffe4b5";
    brightBlue = "#6dcdff";
    brightMagenta = "#c9a6ff";
    brightCyan = "#d3eeff";
    brightWhite = "#eeeeee";
  };

  orange = "#fc4769";
  brightOrange = "#ff7384";
  cursor = "#20bcfc";

  tools = {
    bat = "ansi";
  };
}
