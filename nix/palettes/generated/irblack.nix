# IR Black -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/irblack.yaml
# Author: Timothee Poisot (http://timotheepoisot.fr)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/irblack.nix. Edits here are lost on the
# next run.

{
  name = "irblack";
  displayName = "IR Black";
  author = "Timothee Poisot (http://timotheepoisot.fr)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#40403e";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#242422";
  surfaceContainerHigh = "#32322f";
  surfaceContainerHighest = "#40403e";
  surfaceVariant = "#242422";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fdfbee";
  onSurface = "#b5b3aa";
  onSurfaceMuted = "#a3a199";
  onSurfaceVariant = "#918f88";
  onSurfaceFaint = "#6c6c66";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6c6c66";
  outlineVariant = "#484844";

  # --- Accent roles -------------------------------------------------------
  primary = "#96cbfe";
  onPrimary = "#000000";
  primaryContainer = "#233342";
  onPrimaryContainer = "#fdfbee";
  secondary = "#c6c5fe";
  onSecondary = "#000000";
  tertiary = "#ff73fd";
  onTertiary = "#000000";
  error = "#ff6c60";
  onError = "#000000";
  inverseSurface = "#b5b3aa";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#242422";
    red = "#ff6c60";
    green = "#a8ff60";
    yellow = "#ffffb6";
    blue = "#96cbfe";
    magenta = "#ff73fd";
    cyan = "#c6c5fe";
    white = "#b5b3aa";
    brightBlack = "#6c6c66";
    brightRed = "#ff9185";
    brightGreen = "#e8ffda";
    brightYellow = "#ebeba3";
    brightBlue = "#baddff";
    brightMagenta = "#ff9ffc";
    brightCyan = "#dbdbff";
    brightWhite = "#fdfbee";
  };

  orange = "#e9c062";
  brightOrange = "#fdd476";
  cursor = "#96cbfe";

  tools = {
    bat = "ansi";
  };
}
