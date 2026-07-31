# caroline -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/caroline.yaml
# Author: ed (https://codeberg.org/ed)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/caroline.nix. Edits here are lost on the
# next run.

{
  name = "caroline";
  displayName = "caroline";
  author = "ed (https://codeberg.org/ed)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1c1213";
  surfaceDim = "#0f0708";
  surfaceBright = "#584041";
  surfaceContainerLowest = "#0f0708";
  surfaceContainerLow = "#1c1213";
  surfaceContainer = "#3a2425";
  surfaceContainerHigh = "#493233";
  surfaceContainerHighest = "#584041";
  surfaceVariant = "#3a2425";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e3a68c";
  onSurface = "#a87569";
  onSurfaceMuted = "#9a6a60";
  onSurfaceVariant = "#8f615a";
  onSurfaceFaint = "#6d4745";

  # --- Borders and dividers -----------------------------------------------
  outline = "#744c49";
  outlineVariant = "#563837";

  # --- Accent roles -------------------------------------------------------
  primary = "#684c59";
  onPrimary = "#ecbeaa";
  primaryContainer = "#37272c";
  onPrimaryContainer = "#e3a68c";
  secondary = "#6b6566";
  onSecondary = "#e6e4e4";
  tertiary = "#a63650";
  onTertiary = "#f2d1c4";
  error = "#c24f57";
  onError = "#fdfcfc";
  inverseSurface = "#a87569";
  inverseOnSurface = "#1c1213";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3a2425";
    red = "#c24f57";
    green = "#806c61";
    yellow = "#f28171";
    blue = "#684c59";
    magenta = "#a63650";
    cyan = "#6b6566";
    white = "#a87569";
    brightBlack = "#6d4745";
    brightRed = "#d76268";
    brightGreen = "#927e72";
    brightYellow = "#ff998a";
    brightBlue = "#7a5d6a";
    brightMagenta = "#ba4961";
    brightCyan = "#7c7677";
    brightWhite = "#e3a68c";
  };

  orange = "#a63650";
  brightOrange = "#ba4961";
  cursor = "#7a5a61";

  tools = {
    bat = "ansi";
  };
}
