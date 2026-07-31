# Digital Rain -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/digital-rain.yaml
# Author: Nathan Byrd (https://github.com/cognitivegears)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/digital-rain.nix. Edits here are lost on the
# next run.

{
  name = "digital-rain";
  displayName = "Digital Rain";
  author = "Nathan Byrd (https://github.com/cognitivegears)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#6ba18c";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#4a806c";
  surfaceContainerHigh = "#5a917c";
  surfaceContainerHighest = "#6ba18c";
  surfaceVariant = "#4a806c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d8e2dc";
  onSurface = "#00ff00";
  onSurfaceMuted = "#75cc70";
  onSurfaceVariant = "#919893";
  onSurfaceFaint = "#7c8d7c";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7c8d7c";
  outlineVariant = "#4a8d7e";

  # --- Accent roles -------------------------------------------------------
  primary = "#5482af";
  onPrimary = "#000000";
  primaryContainer = "#0f1d2a";
  onPrimaryContainer = "#d8e2dc";
  secondary = "#468c78";
  onSecondary = "#000000";
  tertiary = "#9472b4";
  onTertiary = "#000000";
  error = "#c85a46";
  onError = "#000000";
  inverseSurface = "#00ff00";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#4a806c";
    red = "#c85a46";
    green = "#64c83c";
    yellow = "#a67a50";
    blue = "#5482af";
    magenta = "#9472b4";
    cyan = "#468c78";
    white = "#00ff00";
    brightBlack = "#7c8d7c";
    brightRed = "#dd6d58";
    brightGreen = "#77dc52";
    brightYellow = "#b98c62";
    brightBlue = "#6694c2";
    brightMagenta = "#a684c7";
    brightCyan = "#599e8a";
    brightWhite = "#d8e2dc";
  };

  orange = "#c86428";
  brightOrange = "#dd773d";
  cursor = "#5482af";

  tools = {
    bat = "ansi";
  };
}
