# Charcoal Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/charcoal-dark.yaml
# Author: Mubin Muhammad (https://github.com/mubin6th)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/charcoal-dark.nix. Edits here are lost on the
# next run.

{
  name = "charcoal-dark";
  displayName = "Charcoal Dark";
  author = "Mubin Muhammad (https://github.com/mubin6th)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0f0b05";
  surfaceDim = "#050301";
  surfaceBright = "#3f3628";
  surfaceContainerLowest = "#050301";
  surfaceContainerLow = "#0f0b05";
  surfaceContainer = "#231b0e";
  surfaceContainerHigh = "#31281b";
  surfaceContainerHighest = "#3f3628";
  surfaceVariant = "#231b0e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#dec8a7";
  onSurface = "#c3a983";
  onSurfaceMuted = "#b59a72";
  onSurfaceVariant = "#a88c62";
  onSurfaceFaint = "#59472d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#614f35";
  outlineVariant = "#352b1b";

  # --- Accent roles -------------------------------------------------------
  primary = "#c3a983";
  onPrimary = "#0f0b05";
  primaryContainer = "#4c402f";
  onPrimaryContainer = "#dec8a7";
  secondary = "#dec8a7";
  onSecondary = "#0f0b05";
  tertiary = "#a88c62";
  onTertiary = "#0f0b05";
  error = "#a88c62";
  onError = "#0f0b05";
  inverseSurface = "#c3a983";
  inverseOnSurface = "#0f0b05";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#231b0e";
    red = "#a88c62";
    green = "#dec8a7";
    yellow = "#dec8a7";
    blue = "#c3a983";
    magenta = "#a88c62";
    cyan = "#dec8a7";
    white = "#c3a983";
    brightBlack = "#57462c";
    brightRed = "#bb9e74";
    brightGreen = "#f2dbba";
    brightYellow = "#f2dbba";
    brightBlue = "#d6bc95";
    brightMagenta = "#bb9e74";
    brightCyan = "#f2dbba";
    brightWhite = "#dec8a7";
  };

  orange = "#dec8a7";
  brightOrange = "#f2dbba";
  cursor = "#c3a983";

  tools = {
    bat = "ansi";
  };
}
