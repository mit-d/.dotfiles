# Pico -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/pico.yaml
# Author: PICO-8 (http://www.lexaloffle.com/pico-8.php)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/pico.nix. Edits here are lost on the
# next run.

{
  name = "pico";
  displayName = "Pico";
  author = "PICO-8 (http://www.lexaloffle.com/pico-8.php)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#384873";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#1d2b53";
  surfaceContainerHigh = "#2a3963";
  surfaceContainerHighest = "#384873";
  surfaceVariant = "#1d2b53";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fff1e8";
  onSurface = "#7c736a";
  onSurfaceMuted = "#8f6150";
  onSurfaceVariant = "#ab5236";
  onSurfaceFaint = "#007c4a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#008751";
  outlineVariant = "#7e2553";

  # --- Accent roles -------------------------------------------------------
  primary = "#83769c";
  onPrimary = "#000000";
  primaryContainer = "#1d1925";
  onPrimaryContainer = "#fff1e8";
  secondary = "#29adff";
  onSecondary = "#000000";
  tertiary = "#ff77a8";
  onTertiary = "#000000";
  error = "#ff004d";
  onError = "#000000";
  inverseSurface = "#7c736a";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1d2b53";
    red = "#ff004d";
    green = "#00e756";
    yellow = "#fff024";
    blue = "#83769c";
    magenta = "#ff77a8";
    cyan = "#29adff";
    white = "#5f574f";
    brightBlack = "#008751";
    brightRed = "#ff5c6e";
    brightGreen = "#3afc6b";
    brightYellow = "#fffff8";
    brightBlue = "#9588af";
    brightMagenta = "#ff9cbc";
    brightCyan = "#6ac0ff";
    brightWhite = "#fff1e8";
  };

  orange = "#ffa300";
  brightOrange = "#ffc075";
  cursor = "#83769c";

  tools = {
    bat = "ansi";
  };
}
