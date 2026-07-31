# Still Alive -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/still-alive.yaml
# Author: Derrick McKee (derrick.mckee@gmail.com), Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/still-alive.nix. Edits here are lost on the
# next run.

{
  name = "still-alive";
  displayName = "Still Alive";
  author = "Derrick McKee (derrick.mckee@gmail.com), Tinted Theming (https://github.com/tinted-theming)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f0f0f0";
  surfaceDim = "#ffffff";
  surfaceBright = "#b3b3b3";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f0f0f0";
  surfaceContainer = "#d6d6d6";
  surfaceContainerHigh = "#c4c4c4";
  surfaceContainerHighest = "#b3b3b3";
  surfaceVariant = "#d6d6d6";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#140c0d";
  onSurface = "#4c383b";
  onSurfaceMuted = "#564749";
  onSurfaceVariant = "#605758";
  onSurfaceFaint = "#a3a3a3";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9a9999";
  outlineVariant = "#bdbdbd";

  # --- Accent roles -------------------------------------------------------
  primary = "#365eff";
  onPrimary = "#f3f3f3";
  primaryContainer = "#a5befb";
  onPrimaryContainer = "#140c0d";
  secondary = "#36d3ff";
  onSecondary = "#140c0d";
  tertiary = "#9036ff";
  onTertiary = "#f2f2f2";
  error = "#d80000";
  onError = "#f0f0f0";
  inverseSurface = "#4c383b";
  inverseOnSurface = "#f0f0f0";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#d6d6d6";
    red = "#d80000";
    green = "#30a860";
    yellow = "#fff018";
    blue = "#365eff";
    magenta = "#9036ff";
    cyan = "#36d3ff";
    white = "#4c383b";
    brightBlack = "#a3a3a3";
    brightRed = "#b90000";
    brightGreen = "#0f954e";
    brightYellow = "#eadc00";
    brightBlue = "#2849ea";
    brightMagenta = "#7f14ea";
    brightCyan = "#03bfeb";
    brightWhite = "#140c0d";
  };

  orange = "#f0d848";
  brightOrange = "#dcc42d";
  cursor = "#365eff";

  tools = {
    bat = "ansi";
  };
}
