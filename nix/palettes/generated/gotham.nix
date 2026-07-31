# Gotham -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gotham.yaml
# Author: Andrea Leopardi (arranged by Brett Jones)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gotham.nix. Edits here are lost on the
# next run.

{
  name = "gotham";
  displayName = "Gotham";
  author = "Andrea Leopardi (arranged by Brett Jones)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0c1014";
  surfaceDim = "#070b0f";
  surfaceBright = "#1c2028";
  surfaceContainerLowest = "#070b0f";
  surfaceContainerLow = "#0c1014";
  surfaceContainer = "#11151c";
  surfaceContainerHigh = "#161b22";
  surfaceContainerHighest = "#1c2028";
  surfaceVariant = "#11151c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d3ebe9";
  onSurface = "#599cab";
  onSurfaceMuted = "#437b89";
  onSurfaceVariant = "#46707b";
  onSurfaceFaint = "#2b5160";

  # --- Borders and dividers -----------------------------------------------
  outline = "#345968";
  outlineVariant = "#1b303f";

  # --- Accent roles -------------------------------------------------------
  primary = "#195466";
  onPrimary = "#d3ebe9";
  primaryContainer = "#142831";
  onPrimaryContainer = "#d3ebe9";
  secondary = "#2aa889";
  onSecondary = "#0c1014";
  tertiary = "#888ca6";
  onTertiary = "#0c1014";
  error = "#c23127";
  onError = "#d4ecea";
  inverseSurface = "#599cab";
  inverseOnSurface = "#0c1014";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#11151c";
    red = "#c23127";
    green = "#33859e";
    yellow = "#edb443";
    blue = "#195466";
    magenta = "#888ca6";
    cyan = "#2aa889";
    white = "#599cab";
    brightBlack = "#0a3749";
    brightRed = "#d7463a";
    brightGreen = "#4797b1";
    brightYellow = "#ffc862";
    brightBlue = "#2c6577";
    brightMagenta = "#9a9eb9";
    brightCyan = "#44bb9b";
    brightWhite = "#d3ebe9";
  };

  orange = "#d26937";
  brightOrange = "#e77c4a";
  cursor = "#336676";

  tools = {
    bat = "ansi";
  };
}
