# Material Lighter -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/material-lighter.yaml
# Author: Nate Peterson
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/material-lighter.nix. Edits here are lost on the
# next run.

{
  name = "material-lighter";
  displayName = "Material Lighter";
  author = "Nate Peterson";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fafafa";
  surfaceDim = "#ffffff";
  surfaceBright = "#c7cacb";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fafafa";
  surfaceContainer = "#e7eaec";
  surfaceContainerHigh = "#d7dadc";
  surfaceContainerHighest = "#c7cacb";
  surfaceVariant = "#e7eaec";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#000000";
  onSurface = "#4c7c78";
  onSurfaceMuted = "#618189";
  onSurfaceVariant = "#79879e";
  onSurfaceFaint = "#a4adaf";

  # --- Borders and dividers -----------------------------------------------
  outline = "#99a2a4";
  outlineVariant = "#bfdbd8";

  # --- Accent roles -------------------------------------------------------
  primary = "#6182b8";
  onPrimary = "#000000";
  primaryContainer = "#becce2";
  onPrimaryContainer = "#000000";
  secondary = "#39adb5";
  onSecondary = "#000000";
  tertiary = "#7c4dff";
  onTertiary = "#fafafa";
  error = "#ff5370";
  onError = "#000000";
  inverseSurface = "#4c7c78";
  inverseOnSurface = "#fafafa";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e7eaec";
    red = "#ff5370";
    green = "#91b859";
    yellow = "#ffb62c";
    blue = "#6182b8";
    magenta = "#7c4dff";
    cyan = "#39adb5";
    white = "#80cbc4";
    brightBlack = "#ccd7da";
    brightRed = "#e93d5f";
    brightGreen = "#7fa546";
    brightYellow = "#eaa300";
    brightBlue = "#5070a5";
    brightMagenta = "#6c36ea";
    brightCyan = "#1c9aa2";
    brightWhite = "#000000";
  };

  orange = "#f76d47";
  brightOrange = "#e25a33";
  cursor = "#6182b8";

  tools = {
    bat = "ansi";
  };
}
