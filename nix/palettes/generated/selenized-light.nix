# selenized-light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/selenized-light.yaml
# Author: Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/selenized-light.nix. Edits here are lost on the
# next run.

{
  name = "selenized-light";
  displayName = "selenized-light";
  author = "Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fbf3db";
  surfaceDim = "#ffffff";
  surfaceBright = "#cdc4ae";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fbf3db";
  surfaceContainer = "#ece3cc";
  surfaceContainerHigh = "#dcd4bd";
  surfaceContainerHighest = "#cdc4ae";
  surfaceVariant = "#ece3cc";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#3a4d53";
  onSurface = "#53676d";
  onSurfaceMuted = "#6b7a7c";
  onSurfaceVariant = "#788382";
  onSurfaceFaint = "#909995";

  # --- Borders and dividers -----------------------------------------------
  outline = "#909995";
  outlineVariant = "#d5cdb6";

  # --- Accent roles -------------------------------------------------------
  primary = "#006dce";
  onPrimary = "#fbf3db";
  primaryContainer = "#a7c2db";
  onPrimaryContainer = "#3a4d53";
  secondary = "#00978a";
  onSecondary = "#21201b";
  tertiary = "#825dc0";
  onTertiary = "#fcf5e0";
  error = "#cc1729";
  onError = "#fbf3db";
  inverseSurface = "#53676d";
  inverseOnSurface = "#fbf3db";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ece3cc";
    red = "#cc1729";
    green = "#428b00";
    yellow = "#a78300";
    blue = "#006dce";
    magenta = "#825dc0";
    cyan = "#00978a";
    white = "#53676d";
    brightBlack = "#909995";
    brightRed = "#b1001d";
    brightGreen = "#387700";
    brightYellow = "#927200";
    brightBlue = "#005cb0";
    brightMagenta = "#714bac";
    brightCyan = "#008377";
    brightWhite = "#3a4d53";
  };

  orange = "#bc5819";
  brightOrange = "#a64700";
  cursor = "#006dce";

  tools = {
    bat = "ansi";
  };
}
