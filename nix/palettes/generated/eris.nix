# eris -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/eris.yaml
# Author: ed (https://codeberg.org/ed), Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/eris.nix. Edits here are lost on the
# next run.

{
  name = "eris";
  displayName = "eris";
  author = "ed (https://codeberg.org/ed), Tinted Theming (https://github.com/tinted-theming)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0a0920";
  surfaceDim = "#030113";
  surfaceBright = "#2c2f59";
  surfaceContainerLowest = "#030113";
  surfaceContainerLow = "#0a0920";
  surfaceContainer = "#13133a";
  surfaceContainerHigh = "#1f2149";
  surfaceContainerHighest = "#2c2f59";
  surfaceVariant = "#13133a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#9aaae5";
  onSurface = "#6976b6";
  onSurfaceMuted = "#616dad";
  onSurfaceVariant = "#5964a4";
  onSurfaceFaint = "#3e4581";

  # --- Borders and dividers -----------------------------------------------
  outline = "#464d89";
  outlineVariant = "#24265b";

  # --- Accent roles -------------------------------------------------------
  primary = "#258fc4";
  onPrimary = "#0a0920";
  primaryContainer = "#1a3759";
  onPrimaryContainer = "#9aaae5";
  secondary = "#a2faf0";
  onSecondary = "#0a0920";
  tertiary = "#c368f7";
  onTertiary = "#0a0920";
  error = "#f768a3";
  onError = "#0a0920";
  inverseSurface = "#6976b6";
  inverseOnSurface = "#0a0920";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#13133a";
    red = "#f768a3";
    green = "#a2faa8";
    yellow = "#f7d668";
    blue = "#258fc4";
    magenta = "#c368f7";
    cyan = "#a2faf0";
    white = "#606bac";
    brightBlack = "#333773";
    brightRed = "#ff88b5";
    brightGreen = "#dfffe0";
    brightYellow = "#ffecad";
    brightBlue = "#3da2d8";
    brightMagenta = "#d185ff";
    brightCyan = "#eefffd";
    brightWhite = "#9aaae5";
  };

  orange = "#f78968";
  brightOrange = "#ffa489";
  cursor = "#258fc4";

  tools = {
    bat = "ansi";
  };
}
