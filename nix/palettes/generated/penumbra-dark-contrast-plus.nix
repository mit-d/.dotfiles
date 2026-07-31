# Penumbra Dark Contrast Plus -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/penumbra-dark-contrast-plus.yaml
# Author: Zachary Weiss (https://github.com/zacharyweiss)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/penumbra-dark-contrast-plus.nix. Edits here are lost on the
# next run.

{
  name = "penumbra-dark-contrast-plus";
  displayName = "Penumbra Dark Contrast Plus";
  author = "Zachary Weiss (https://github.com/zacharyweiss)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#181b1f";
  surfaceDim = "#0d1013";
  surfaceBright = "#3d4145";
  surfaceContainerLowest = "#0d1013";
  surfaceContainerLow = "#181b1f";
  surfaceContainer = "#24272b";
  surfaceContainerHigh = "#303438";
  surfaceContainerHighest = "#3d4145";
  surfaceVariant = "#24272b";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fffdfb";
  onSurface = "#cecece";
  onSurfaceMuted = "#b6b6b6";
  onSurfaceVariant = "#9e9e9e";
  onSurfaceFaint = "#636363";

  # --- Borders and dividers -----------------------------------------------
  outline = "#636363";
  outlineVariant = "#3e4044";

  # --- Accent roles -------------------------------------------------------
  primary = "#61a3e6";
  onPrimary = "#181b1f";
  primaryContainer = "#334a63";
  onPrimaryContainer = "#fffdfb";
  secondary = "#00b3c2";
  onSecondary = "#181b1f";
  tertiary = "#a48fe1";
  onTertiary = "#181b1f";
  error = "#df7f78";
  onError = "#181b1f";
  inverseSurface = "#cecece";
  inverseOnSurface = "#181b1f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#24272b";
    red = "#df7f78";
    green = "#50b584";
    yellow = "#9ca748";
    blue = "#61a3e6";
    magenta = "#a48fe1";
    cyan = "#00b3c2";
    white = "#cecece";
    brightBlack = "#636363";
    brightRed = "#f4928a";
    brightGreen = "#64c896";
    brightYellow = "#aeba5b";
    brightBlue = "#74b6fa";
    brightMagenta = "#b7a2f5";
    brightCyan = "#32c6d5";
    brightWhite = "#fffdfb";
  };

  orange = "#ce9042";
  brightOrange = "#e2a356";
  cursor = "#61a3e6";

  tools = {
    bat = "ansi";
  };
}
