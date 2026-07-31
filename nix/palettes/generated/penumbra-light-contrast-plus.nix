# Penumbra Light Contrast Plus -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/penumbra-light-contrast-plus.yaml
# Author: Zachary Weiss (https://github.com/zacharyweiss)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/penumbra-light-contrast-plus.nix. Edits here are lost on the
# next run.

{
  name = "penumbra-light-contrast-plus";
  displayName = "Penumbra Light Contrast Plus";
  author = "Zachary Weiss (https://github.com/zacharyweiss)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fffdfb";
  surfaceDim = "#ffffff";
  surfaceBright = "#f0e8de";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fffdfb";
  surfaceContainer = "#fff7ed";
  surfaceContainerHigh = "#f8f0e6";
  surfaceContainerHighest = "#f0e8de";
  surfaceVariant = "#fff7ed";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#181b1f";
  onSurface = "#636363";
  onSurfaceMuted = "#7e7e7e";
  onSurfaceVariant = "#878889";
  onSurfaceFaint = "#adaeae";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a2a3a4";
  outlineVariant = "#e2d7c7";

  # --- Accent roles -------------------------------------------------------
  primary = "#61a3e6";
  onPrimary = "#181b1f";
  primaryContainer = "#c4dbf5";
  onPrimaryContainer = "#181b1f";
  secondary = "#00b3c2";
  onSecondary = "#181b1f";
  tertiary = "#a48fe1";
  onTertiary = "#181b1f";
  error = "#df7f78";
  onError = "#181b1f";
  inverseSurface = "#636363";
  inverseOnSurface = "#fffdfb";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#fff7ed";
    red = "#df7f78";
    green = "#50b584";
    yellow = "#9ca748";
    blue = "#61a3e6";
    magenta = "#a48fe1";
    cyan = "#00b3c2";
    white = "#636363";
    brightBlack = "#cecece";
    brightRed = "#cb6d66";
    brightGreen = "#3ba272";
    brightYellow = "#8a9434";
    brightBlue = "#4f90d2";
    brightMagenta = "#927dcd";
    brightCyan = "#009fac";
    brightWhite = "#181b1f";
  };

  orange = "#ce9042";
  brightOrange = "#ba7e2d";
  cursor = "#5b98d5";

  tools = {
    bat = "ansi";
  };
}
