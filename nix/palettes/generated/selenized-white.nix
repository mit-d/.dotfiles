# selenized-white -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/selenized-white.yaml
# Author: Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/selenized-white.nix. Edits here are lost on the
# next run.

{
  name = "selenized-white";
  displayName = "selenized-white";
  author = "Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#c7c7c7";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#ebebeb";
  surfaceContainerHigh = "#d9d9d9";
  surfaceContainerHighest = "#c7c7c7";
  surfaceVariant = "#ebebeb";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#282828";
  onSurface = "#474747";
  onSurfaceMuted = "#666666";
  onSurfaceVariant = "#878787";
  onSurfaceFaint = "#878787";

  # --- Borders and dividers -----------------------------------------------
  outline = "#878787";
  outlineVariant = "#cdcdcd";

  # --- Accent roles -------------------------------------------------------
  primary = "#0054cf";
  onPrimary = "#ffffff";
  primaryContainer = "#a3c1f2";
  onPrimaryContainer = "#282828";
  secondary = "#009a8a";
  onSecondary = "#ffffff";
  tertiary = "#6b40c3";
  onTertiary = "#ffffff";
  error = "#bf0000";
  onError = "#ffffff";
  inverseSurface = "#474747";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ebebeb";
    red = "#bf0000";
    green = "#008400";
    yellow = "#af8500";
    blue = "#0054cf";
    magenta = "#6b40c3";
    cyan = "#009a8a";
    white = "#474747";
    brightBlack = "#878787";
    brightRed = "#a10000";
    brightGreen = "#007000";
    brightYellow = "#997400";
    brightBlue = "#0045ae";
    brightMagenta = "#5b2baf";
    brightCyan = "#008678";
    brightWhite = "#282828";
  };

  orange = "#ba3700";
  brightOrange = "#9e2d00";
  cursor = "#0054cf";

  tools = {
    bat = "ansi";
  };
}
