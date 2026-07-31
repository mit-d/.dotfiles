# pandora -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/pandora.yaml
# Author: Cassandra Fox
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/pandora.nix. Edits here are lost on the
# next run.

{
  name = "pandora";
  displayName = "pandora";
  author = "Cassandra Fox";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#131213";
  surfaceDim = "#080708";
  surfaceBright = "#4c333f";
  surfaceContainerLowest = "#080708";
  surfaceContainerLow = "#131213";
  surfaceContainer = "#2f1823";
  surfaceContainerHigh = "#3d2531";
  surfaceContainerHighest = "#4c333f";
  surfaceVariant = "#2f1823";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#b596a5";
  onSurface = "#f15c99";
  onSurfaceMuted = "#c54770";
  onSurfaceVariant = "#a65062";
  onSurfaceFaint = "#816274";

  # --- Borders and dividers -----------------------------------------------
  outline = "#ffbee3";
  outlineVariant = "#482435";

  # --- Accent roles -------------------------------------------------------
  primary = "#008080";
  onPrimary = "#f9f8f8";
  primaryContainer = "#1c3839";
  onPrimaryContainer = "#b596a5";
  secondary = "#714ca6";
  onSecondary = "#d9d9d9";
  tertiary = "#a24030";
  onTertiary = "#dad9d9";
  error = "#b00b69";
  onError = "#d3d3d3";
  inverseSurface = "#f15c99";
  inverseOnSurface = "#131213";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2f1823";
    red = "#b00b69";
    green = "#9ddf69";
    yellow = "#ffcc00";
    blue = "#008080";
    magenta = "#a24030";
    cyan = "#714ca6";
    white = "#f15c99";
    brightBlack = "#ffbee3";
    brightRed = "#c52b7a";
    brightGreen = "#b0f37d";
    brightYellow = "#ffe49a";
    brightBlue = "#279292";
    brightMagenta = "#b65241";
    brightCyan = "#825eb9";
    brightWhite = "#b596a5";
  };

  orange = "#ff9153";
  brightOrange = "#ffb086";
  cursor = "#008080";

  tools = {
    bat = "ansi";
  };
}
