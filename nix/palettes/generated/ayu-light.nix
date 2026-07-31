# Ayu Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/ayu-light.yaml
# Author: Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/ayu-light.nix. Edits here are lost on the
# next run.

{
  name = "ayu-light";
  displayName = "Ayu Light";
  author = "Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f8f9fa";
  surfaceDim = "#ffffff";
  surfaceBright = "#d9dbdd";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f8f9fa";
  surfaceContainer = "#edeff1";
  surfaceContainerHigh = "#e3e5e7";
  surfaceContainerHighest = "#d9dbdd";
  surfaceVariant = "#edeff1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#404447";
  onSurface = "#5c6166";
  onSurfaceMuted = "#73797f";
  onSurfaceVariant = "#7f858d";
  onSurfaceFaint = "#a0a6ac";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9aa0a6";
  outlineVariant = "#d2d4d8";

  # --- Accent roles -------------------------------------------------------
  primary = "#399ee6";
  onPrimary = "#2d3133";
  primaryContainer = "#b5d7f4";
  onPrimaryContainer = "#404447";
  secondary = "#4cbf99";
  onSecondary = "#3e4144";
  tertiary = "#a37acc";
  onTertiary = "#252526";
  error = "#f07171";
  onError = "#2e3234";
  inverseSurface = "#5c6166";
  inverseOnSurface = "#f8f9fa";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#edeff1";
    red = "#f07171";
    green = "#6cbf49";
    yellow = "#f2ae49";
    blue = "#399ee6";
    magenta = "#a37acc";
    cyan = "#4cbf99";
    white = "#5c6166";
    brightBlack = "#a0a6ac";
    brightRed = "#db5e5f";
    brightGreen = "#59ac34";
    brightYellow = "#de9b32";
    brightBlue = "#208bd2";
    brightMagenta = "#9168b8";
    brightCyan = "#35ac87";
    brightWhite = "#404447";
  };

  orange = "#fa8d3e";
  brightOrange = "#e57a26";
  cursor = "#3c97da";

  tools = {
    bat = "ansi";
  };
}
