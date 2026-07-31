# Rebecca -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/rebecca.yaml
# Author: Victor Borja (http://github.com/vic) based on Rebecca Theme (http://github.com/vic/rebecca-theme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/rebecca.nix. Edits here are lost on the
# next run.

{
  name = "rebecca";
  displayName = "Rebecca";
  author = "Victor Borja (http://github.com/vic) based on Rebecca Theme (http://github.com/vic/rebecca-theme)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#292a44";
  surfaceDim = "#1c1d35";
  surfaceBright = "#8654bd";
  surfaceContainerLowest = "#1c1d35";
  surfaceContainerLow = "#292a44";
  surfaceContainer = "#663399";
  surfaceContainerHigh = "#7644ab";
  surfaceContainerHighest = "#8654bd";
  surfaceVariant = "#663399";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ccccff";
  onSurface = "#d0cfdc";
  onSurfaceMuted = "#c8c7df";
  onSurfaceVariant = "#a0a0c5";
  onSurfaceFaint = "#666699";

  # --- Borders and dividers -----------------------------------------------
  outline = "#666699";
  outlineVariant = "#3d3f68";

  # --- Accent roles -------------------------------------------------------
  primary = "#2de0a7";
  onPrimary = "#292a44";
  primaryContainer = "#386b6a";
  onPrimaryContainer = "#dbdbff";
  secondary = "#8eaee0";
  onSecondary = "#292a44";
  tertiary = "#7aa5ff";
  onTertiary = "#292a44";
  error = "#a0a0c5";
  onError = "#292a44";
  inverseSurface = "#d0cfdc";
  inverseOnSurface = "#292a44";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#663399";
    red = "#a0a0c5";
    green = "#6dfedf";
    yellow = "#ae81ff";
    blue = "#2de0a7";
    magenta = "#7aa5ff";
    cyan = "#8eaee0";
    white = "#f1eff8";
    brightBlack = "#666699";
    brightRed = "#b3b3d9";
    brightGreen = "#d8fff4";
    brightYellow = "#bd9cff";
    brightBlue = "#4df4ba";
    brightMagenta = "#98baff";
    brightCyan = "#a0c1f4";
    brightWhite = "#ccccff";
  };

  orange = "#efe4a1";
  brightOrange = "#fff8c9";
  cursor = "#2de0a7";

  tools = {
    bat = "ansi";
  };
}
