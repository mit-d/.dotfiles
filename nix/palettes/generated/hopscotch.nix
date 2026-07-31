# Hopscotch -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/hopscotch.yaml
# Author: Jan T. Sott
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/hopscotch.nix. Edits here are lost on the
# next run.

{
  name = "hopscotch";
  displayName = "Hopscotch";
  author = "Jan T. Sott";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#322931";
  surfaceDim = "#241c23";
  surfaceBright = "#615960";
  surfaceContainerLowest = "#241c23";
  surfaceContainerLow = "#322931";
  surfaceContainer = "#433b42";
  surfaceContainerHigh = "#524a51";
  surfaceContainerHighest = "#615960";
  surfaceVariant = "#433b42";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#b9b5b8";
  onSurfaceMuted = "#a8a4a8";
  onSurfaceVariant = "#989498";
  onSurfaceFaint = "#797379";

  # --- Borders and dividers -----------------------------------------------
  outline = "#797379";
  outlineVariant = "#5c545b";

  # --- Accent roles -------------------------------------------------------
  primary = "#1290bf";
  onPrimary = "#251d24";
  primaryContainer = "#374e63";
  onPrimaryContainer = "#ffffff";
  secondary = "#149b93";
  onSecondary = "#2a222a";
  tertiary = "#c85e7c";
  onTertiary = "#181818";
  error = "#dd464c";
  onError = "#121212";
  inverseSurface = "#b9b5b8";
  inverseOnSurface = "#322931";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#433b42";
    red = "#dd464c";
    green = "#8fc13e";
    yellow = "#fdcc59";
    blue = "#1290bf";
    magenta = "#c85e7c";
    cyan = "#149b93";
    white = "#b9b5b8";
    brightBlack = "#797379";
    brightRed = "#f35a5e";
    brightGreen = "#a1d554";
    brightYellow = "#ffe4aa";
    brightBlue = "#32a3d3";
    brightMagenta = "#dd708e";
    brightCyan = "#34aea5";
    brightWhite = "#ffffff";
  };

  orange = "#fd8b19";
  brightOrange = "#ffa968";
  cursor = "#1290bf";

  tools = {
    bat = "ansi";
  };
}
