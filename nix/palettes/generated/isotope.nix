# Isotope -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/isotope.yaml
# Author: Jan T. Sott
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/isotope.nix. Edits here are lost on the
# next run.

{
  name = "isotope";
  displayName = "Isotope";
  author = "Jan T. Sott";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#5e5e5e";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#404040";
  surfaceContainerHigh = "#4f4f4f";
  surfaceContainerHighest = "#5e5e5e";
  surfaceVariant = "#404040";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#d0d0d0";
  onSurfaceMuted = "#c8c8c8";
  onSurfaceVariant = "#c0c0c0";
  onSurfaceFaint = "#808080";

  # --- Borders and dividers -----------------------------------------------
  outline = "#808080";
  outlineVariant = "#606060";

  # --- Accent roles -------------------------------------------------------
  primary = "#0066ff";
  onPrimary = "#ffffff";
  primaryContainer = "#001542";
  onPrimaryContainer = "#ffffff";
  secondary = "#00ffff";
  onSecondary = "#000000";
  tertiary = "#cc00ff";
  onTertiary = "#000000";
  error = "#ff0000";
  onError = "#000000";
  inverseSurface = "#d0d0d0";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#404040";
    red = "#ff0000";
    green = "#33ff00";
    yellow = "#ff0099";
    blue = "#0066ff";
    magenta = "#cc00ff";
    cyan = "#00ffff";
    white = "#d0d0d0";
    brightBlack = "#808080";
    brightRed = "#ff5c4a";
    brightGreen = "#b4ffa9";
    brightYellow = "#ff5faa";
    brightBlue = "#3880ff";
    brightMagenta = "#d557ff";
    brightCyan = "#cdfffe";
    brightWhite = "#ffffff";
  };

  orange = "#ff9900";
  brightOrange = "#ffb76f";
  cursor = "#0066ff";

  tools = {
    bat = "ansi";
  };
}
