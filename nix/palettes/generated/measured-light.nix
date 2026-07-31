# Measured Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/measured-light.yaml
# Author: Measured (https://measured.co)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/measured-light.nix. Edits here are lost on the
# next run.

{
  name = "measured-light";
  displayName = "Measured Light";
  author = "Measured (https://measured.co)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fdf9f5";
  surfaceDim = "#ffffff";
  surfaceBright = "#eae6e2";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fdf9f5";
  surfaceContainer = "#f9f5f1";
  surfaceContainerHigh = "#f2eeea";
  surfaceContainerHighest = "#eae6e2";
  surfaceVariant = "#f9f5f1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#000000";
  onSurface = "#292929";
  onSurfaceMuted = "#343434";
  onSurfaceVariant = "#404040";
  onSurfaceFaint = "#5a5a5a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5a5a5a";
  outlineVariant = "#e5d2c3";

  # --- Accent roles -------------------------------------------------------
  primary = "#0158ad";
  onPrimary = "#fdf9f5";
  primaryContainer = "#a3bcdd";
  onPrimaryContainer = "#000000";
  secondary = "#01716f";
  onSecondary = "#fdf9f5";
  tertiary = "#6645c2";
  onTertiary = "#fdf9f5";
  error = "#ac1f35";
  onError = "#fdf9f5";
  inverseSurface = "#292929";
  inverseOnSurface = "#fdf9f5";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f9f5f1";
    red = "#ac1f35";
    green = "#0c680c";
    yellow = "#645a00";
    blue = "#0158ad";
    magenta = "#6645c2";
    cyan = "#01716f";
    white = "#292929";
    brightBlack = "#5a5a5a";
    brightRed = "#960026";
    brightGreen = "#005501";
    brightYellow = "#524900";
    brightBlue = "#004890";
    brightMagenta = "#5631ae";
    brightCyan = "#005e5c";
    brightWhite = "#000000";
  };

  orange = "#ad5601";
  brightOrange = "#944800";
  cursor = "#0158ad";

  tools = {
    bat = "ansi";
  };
}
