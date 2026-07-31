# Icy Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/icy.yaml
# Author: icyphox (https://icyphox.ga)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/icy.nix. Edits here are lost on the
# next run.

{
  name = "icy";
  displayName = "Icy Dark";
  author = "icyphox (https://icyphox.ga)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#021012";
  surfaceDim = "#000b0d";
  surfaceBright = "#0d2225";
  surfaceContainerLowest = "#000b0d";
  surfaceContainerLow = "#021012";
  surfaceContainer = "#031619";
  surfaceContainerHigh = "#071c1f";
  surfaceContainerHighest = "#0d2225";
  surfaceVariant = "#031619";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#45a8ba";
  onSurface = "#0e8697";
  onSurfaceMuted = "#0d7d8d";
  onSurfaceVariant = "#0c7382";
  onSurfaceFaint = "#09525d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#0a5b67";
  outlineVariant = "#063238";

  # --- Accent roles -------------------------------------------------------
  primary = "#00bcd4";
  onPrimary = "#021012";
  primaryContainer = "#074a53";
  onPrimaryContainer = "#71bac8";
  secondary = "#26c6da";
  onSecondary = "#021012";
  tertiary = "#00acc1";
  onTertiary = "#021012";
  error = "#16c1d9";
  onError = "#021012";
  inverseSurface = "#0e8697";
  inverseOnSurface = "#021012";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#031619";
    red = "#16c1d9";
    green = "#4dd0e1";
    yellow = "#80deea";
    blue = "#00bcd4";
    magenta = "#00acc1";
    cyan = "#26c6da";
    white = "#095b67";
    brightBlack = "#052e34";
    brightRed = "#3cd5ed";
    brightGreen = "#64e4f5";
    brightYellow = "#94f2fe";
    brightBlue = "#34d0e8";
    brightMagenta = "#31bfd4";
    brightCyan = "#45daee";
    brightWhite = "#109cb0";
  };

  orange = "#b3ebf2";
  brightOrange = "#d8fbff";
  cursor = "#00bcd4";

  tools = {
    bat = "ansi";
  };
}
