# Ayu Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/ayu-dark.yaml
# Author: Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/ayu-dark.nix. Edits here are lost on the
# next run.

{
  name = "ayu-dark";
  displayName = "Ayu Dark";
  author = "Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0b0e14";
  surfaceDim = "#04060b";
  surfaceBright = "#262b36";
  surfaceContainerLowest = "#04060b";
  surfaceContainerLow = "#0b0e14";
  surfaceContainer = "#131721";
  surfaceContainerHigh = "#1d212b";
  surfaceContainerHighest = "#262b36";
  surfaceVariant = "#131721";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f2f0e7";
  onSurface = "#e6e1cf";
  onSurfaceMuted = "#d2cfc2";
  onSurfaceVariant = "#bfbdb6";
  onSurfaceFaint = "#3f4c5a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#485461";
  outlineVariant = "#2b2d33";

  # --- Accent roles -------------------------------------------------------
  primary = "#59c2ff";
  onPrimary = "#0b0e14";
  primaryContainer = "#294b63";
  onPrimaryContainer = "#f2f0e7";
  secondary = "#95e6cb";
  onSecondary = "#0b0e14";
  tertiary = "#d2a6ff";
  onTertiary = "#0b0e14";
  error = "#f07178";
  onError = "#0b0e14";
  inverseSurface = "#e6e1cf";
  inverseOnSurface = "#0b0e14";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#131721";
    red = "#f07178";
    green = "#aad94c";
    yellow = "#ffb454";
    blue = "#59c2ff";
    magenta = "#d2a6ff";
    cyan = "#95e6cb";
    white = "#e6e1cf";
    brightBlack = "#3e4b59";
    brightRed = "#ff898e";
    brightGreen = "#bded62";
    brightYellow = "#ffcf98";
    brightBlue = "#8ed3ff";
    brightMagenta = "#dfc1ff";
    brightCyan = "#a9fadf";
    brightWhite = "#f2f0e7";
  };

  orange = "#ff8f40";
  brightOrange = "#ffae7b";
  cursor = "#59c2ff";

  tools = {
    bat = "ansi";
  };
}
