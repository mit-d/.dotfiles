# Nord -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/nord.yaml
# Author: arcticicestudio
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/nord.nix. Edits here are lost on the
# next run.

{
  name = "nord";
  displayName = "Nord";
  author = "arcticicestudio";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2e3440";
  surfaceDim = "#212632";
  surfaceBright = "#586071";
  surfaceContainerLowest = "#212632";
  surfaceContainerLow = "#2e3440";
  surfaceContainer = "#3b4252";
  surfaceContainerHigh = "#495161";
  surfaceContainerHighest = "#586071";
  surfaceVariant = "#3b4252";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#eceff4";
  onSurface = "#e5e9f0";
  onSurfaceMuted = "#dee3ed";
  onSurfaceVariant = "#d8dee9";
  onSurfaceFaint = "#5e687a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#667082";
  outlineVariant = "#434c5e";

  # --- Accent roles -------------------------------------------------------
  primary = "#81a1c1";
  onPrimary = "#2e3440";
  primaryContainer = "#4c5b6e";
  onPrimaryContainer = "#eceff4";
  secondary = "#88c0d0";
  onSecondary = "#2e3440";
  tertiary = "#b48ead";
  onTertiary = "#2d323e";
  error = "#bf616a";
  onError = "#141415";
  inverseSurface = "#e5e9f0";
  inverseOnSurface = "#2e3440";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3b4252";
    red = "#bf616a";
    green = "#a3be8c";
    yellow = "#ebcb8b";
    blue = "#81a1c1";
    magenta = "#b48ead";
    cyan = "#88c0d0";
    white = "#e5e9f0";
    brightBlack = "#4c566a";
    brightRed = "#d3737c";
    brightGreen = "#b6d19f";
    brightYellow = "#ffdf9e";
    brightBlue = "#93b4d4";
    brightMagenta = "#c7a0c0";
    brightCyan = "#9bd3e4";
    brightWhite = "#eceff4";
  };

  orange = "#d08770";
  brightOrange = "#e49a82";
  cursor = "#81a1c1";

  tools = {
    bat = "Nord";
  };
}
