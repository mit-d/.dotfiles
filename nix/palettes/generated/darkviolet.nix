# Dark Violet -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/darkviolet.yaml
# Author: ruler501 (https://github.com/ruler501/base16-darkviolet)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/darkviolet.nix. Edits here are lost on the
# next run.

{
  name = "darkviolet";
  displayName = "Dark Violet";
  author = "ruler501 (https://github.com/ruler501/base16-darkviolet)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#3e365f";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#231a40";
  surfaceContainerHigh = "#30284f";
  surfaceContainerHighest = "#3e365f";
  surfaceVariant = "#231a40";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ac7aff";
  onSurface = "#a884dc";
  onSurfaceMuted = "#6ba082";
  onSurfaceVariant = "#00ad00";
  onSurfaceFaint = "#593380";

  # --- Borders and dividers -----------------------------------------------
  outline = "#62398f";
  outlineVariant = "#432d59";

  # --- Accent roles -------------------------------------------------------
  primary = "#4136d9";
  onPrimary = "#c7c7c7";
  primaryContainer = "#0a0737";
  onPrimaryContainer = "#a366ff";
  secondary = "#40dfff";
  onSecondary = "#000000";
  tertiary = "#7e5ce6";
  onTertiary = "#000000";
  error = "#a82ee6";
  onError = "#f3f3f3";
  inverseSurface = "#a884dc";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#231a40";
    red = "#a82ee6";
    green = "#4595e6";
    yellow = "#f29df2";
    blue = "#4136d9";
    magenta = "#7e5ce6";
    cyan = "#40dfff";
    white = "#b08ae6";
    brightBlack = "#593380";
    brightRed = "#bb47fb";
    brightGreen = "#58a8fb";
    brightYellow = "#ffb7fe";
    brightBlue = "#4e4cee";
    brightMagenta = "#8f6ffb";
    brightCyan = "#9becff";
    brightWhite = "#a366ff";
  };

  orange = "#bb66cc";
  brightOrange = "#cf79e0";
  cursor = "#4b3cdd";

  tools = {
    bat = "ansi";
  };
}
