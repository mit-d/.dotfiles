# 3024 -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/3024.yaml
# Author: Jan T. Sott (http://github.com/idleberg)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/3024.nix. Edits here are lost on the
# next run.

{
  name = "3024";
  displayName = "3024";
  author = "Jan T. Sott (http://github.com/idleberg)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#090300";
  surfaceDim = "#010000";
  surfaceBright = "#58514f";
  surfaceContainerLowest = "#010000";
  surfaceContainerLow = "#090300";
  surfaceContainer = "#3a3432";
  surfaceContainerHigh = "#494240";
  surfaceContainerHighest = "#58514f";
  surfaceVariant = "#3a3432";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f7f7f7";
  onSurface = "#a5a2a2";
  onSurfaceMuted = "#928f8f";
  onSurfaceVariant = "#807d7c";
  onSurfaceFaint = "#5c5855";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5c5855";
  outlineVariant = "#4a4543";

  # --- Accent roles -------------------------------------------------------
  primary = "#01a0e4";
  onPrimary = "#090300";
  primaryContainer = "#1d3745";
  onPrimaryContainer = "#f7f7f7";
  secondary = "#b5e4f4";
  onSecondary = "#090300";
  tertiary = "#a16a94";
  onTertiary = "#090300";
  error = "#db2d20";
  onError = "#f8f8f8";
  inverseSurface = "#a5a2a2";
  inverseOnSurface = "#090300";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3a3432";
    red = "#db2d20";
    green = "#01a252";
    yellow = "#fded02";
    blue = "#01a0e4";
    magenta = "#a16a94";
    cyan = "#b5e4f4";
    white = "#a5a2a2";
    brightBlack = "#5c5855";
    brightRed = "#f14535";
    brightGreen = "#2eb564";
    brightYellow = "#fffee1";
    brightBlue = "#2fb3f8";
    brightMagenta = "#b47ca7";
    brightCyan = "#d7f5ff";
    brightWhite = "#f7f7f7";
  };

  orange = "#e8bbd0";
  brightOrange = "#fccee4";
  cursor = "#01a0e4";

  tools = {
    bat = "ansi";
  };
}
