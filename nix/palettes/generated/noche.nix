# Noche -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/noche.yaml
# Author: Teshre
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/noche.nix. Edits here are lost on the
# next run.

{
  name = "noche";
  displayName = "Noche";
  author = "Teshre";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0c0e16";
  surfaceDim = "#03040a";
  surfaceBright = "#323749";
  surfaceContainerLowest = "#03040a";
  surfaceContainerLow = "#0c0e16";
  surfaceContainer = "#181c2c";
  surfaceContainerHigh = "#25293a";
  surfaceContainerHighest = "#323749";
  surfaceVariant = "#181c2c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e6ecfa";
  onSurface = "#cbd4ec";
  onSurfaceMuted = "#afb7cf";
  onSurfaceVariant = "#939bb2";
  onSurfaceFaint = "#5a6178";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5a6178";
  outlineVariant = "#252d42";

  # --- Accent roles -------------------------------------------------------
  primary = "#7aa0e8";
  onPrimary = "#0c0e16";
  primaryContainer = "#32405d";
  onPrimaryContainer = "#e6ecfa";
  secondary = "#6dd8d0";
  onSecondary = "#0c0e16";
  tertiary = "#b79ae0";
  onTertiary = "#0c0e16";
  error = "#e2727e";
  onError = "#0c0e16";
  inverseSurface = "#cbd4ec";
  inverseOnSurface = "#0c0e16";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#181c2c";
    red = "#e2727e";
    green = "#7cc596";
    yellow = "#d8c062";
    blue = "#7aa0e8";
    magenta = "#b79ae0";
    cyan = "#6dd8d0";
    white = "#cbd4ec";
    brightBlack = "#5a6178";
    brightRed = "#f78590";
    brightGreen = "#8fd9a9";
    brightYellow = "#ecd476";
    brightBlue = "#8cb3fc";
    brightMagenta = "#caadf4";
    brightCyan = "#81ece4";
    brightWhite = "#e6ecfa";
  };

  orange = "#82a6e0";
  brightOrange = "#94b9f4";
  cursor = "#7aa0e8";

  tools = {
    bat = "ansi";
  };
}
