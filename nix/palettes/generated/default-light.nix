# Default Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/default-light.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/default-light.nix. Edits here are lost on the
# next run.

{
  name = "default-light";
  displayName = "Default Light";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f8f8f8";
  surfaceDim = "#ffffff";
  surfaceBright = "#c9c9c9";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f8f8f8";
  surfaceContainer = "#e8e8e8";
  surfaceContainerHigh = "#d8d8d8";
  surfaceContainerHighest = "#c9c9c9";
  surfaceVariant = "#e8e8e8";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#181818";
  onSurface = "#383838";
  onSurfaceMuted = "#484848";
  onSurfaceVariant = "#585858";
  onSurfaceFaint = "#aaa9a9";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9f9e9e";
  outlineVariant = "#d4d3d3";

  # --- Accent roles -------------------------------------------------------
  primary = "#7cafc2";
  onPrimary = "#181818";
  primaryContainer = "#c9dce3";
  onPrimaryContainer = "#181818";
  secondary = "#86c1b9";
  onSecondary = "#181818";
  tertiary = "#ba8baf";
  onTertiary = "#181818";
  error = "#ab4642";
  onError = "#f8f8f8";
  inverseSurface = "#383838";
  inverseOnSurface = "#f8f8f8";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e8e8e8";
    red = "#ab4642";
    green = "#a1b56c";
    yellow = "#f7ca88";
    blue = "#7cafc2";
    magenta = "#ba8baf";
    cyan = "#86c1b9";
    white = "#383838";
    brightBlack = "#b8b8b8";
    brightRed = "#973432";
    brightGreen = "#8fa25a";
    brightYellow = "#e3b775";
    brightBlue = "#6a9caf";
    brightMagenta = "#a7799c";
    brightCyan = "#73aea6";
    brightWhite = "#181818";
  };

  orange = "#dc9656";
  brightOrange = "#c88343";
  cursor = "#6c96a6";

  tools = {
    bat = "ansi";
  };
}
