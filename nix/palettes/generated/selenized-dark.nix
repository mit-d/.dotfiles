# selenized-dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/selenized-dark.yaml
# Author: Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/selenized-dark.nix. Edits here are lost on the
# next run.

{
  name = "selenized-dark";
  displayName = "selenized-dark";
  author = "Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#103c48";
  surfaceDim = "#01303c";
  surfaceBright = "#346370";
  surfaceContainerLowest = "#01303c";
  surfaceContainerLow = "#103c48";
  surfaceContainer = "#184956";
  surfaceContainerHigh = "#265663";
  surfaceContainerHighest = "#346370";
  surfaceVariant = "#184956";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#cad8d9";
  onSurface = "#adbcbc";
  onSurfaceMuted = "#8fa2a5";
  onSurfaceVariant = "#798f95";
  onSurfaceFaint = "#72898f";

  # --- Borders and dividers -----------------------------------------------
  outline = "#72898f";
  outlineVariant = "#2d5b69";

  # --- Accent roles -------------------------------------------------------
  primary = "#4695f7";
  onPrimary = "#ffffff";
  primaryContainer = "#235d86";
  onPrimaryContainer = "#cad8d9";
  secondary = "#41c7b9";
  onSecondary = "#103c48";
  tertiary = "#af88eb";
  onTertiary = "#ffffff";
  error = "#fa5750";
  onError = "#ffffff";
  inverseSurface = "#adbcbc";
  inverseOnSurface = "#103c48";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#184956";
    red = "#fa5750";
    green = "#75b938";
    yellow = "#dbb32d";
    blue = "#4695f7";
    magenta = "#af88eb";
    cyan = "#41c7b9";
    white = "#adbcbc";
    brightBlack = "#72898f";
    brightRed = "#ff7c71";
    brightGreen = "#87cd4e";
    brightYellow = "#efc647";
    brightBlue = "#66a9ff";
    brightMagenta = "#c29bff";
    brightCyan = "#59dbcc";
    brightWhite = "#cad8d9";
  };

  orange = "#ed8649";
  brightOrange = "#ff9b62";
  cursor = "#4695f7";

  tools = {
    bat = "ansi";
  };
}
