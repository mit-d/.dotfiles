# Marrakesh -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/marrakesh.yaml
# Author: Alexandre Gavioli (http://github.com/Alexx2/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/marrakesh.nix. Edits here are lost on the
# next run.

{
  name = "marrakesh";
  displayName = "Marrakesh";
  author = "Alexandre Gavioli (http://github.com/Alexx2/)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#201602";
  surfaceDim = "#120a00";
  surfaceBright = "#4c4b20";
  surfaceContainerLowest = "#120a00";
  surfaceContainerLow = "#201602";
  surfaceContainer = "#302e00";
  surfaceContainerHigh = "#3e3c10";
  surfaceContainerHighest = "#4c4b20";
  surfaceVariant = "#302e00";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#faf0a5";
  onSurface = "#948e48";
  onSurfaceMuted = "#8d8742";
  onSurfaceVariant = "#86813b";
  onSurfaceFaint = "#6c6823";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6c6823";
  outlineVariant = "#5f5b17";

  # --- Accent roles -------------------------------------------------------
  primary = "#477ca1";
  onPrimary = "#ffffff";
  primaryContainer = "#313b3b";
  onPrimaryContainer = "#faf0a5";
  secondary = "#75a738";
  onSecondary = "#201602";
  tertiary = "#8868b3";
  onTertiary = "#ffffff";
  error = "#c35359";
  onError = "#ffffff";
  inverseSurface = "#948e48";
  inverseOnSurface = "#201602";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#302e00";
    red = "#c35359";
    green = "#18974e";
    yellow = "#a88339";
    blue = "#477ca1";
    magenta = "#8868b3";
    cyan = "#75a738";
    white = "#948e48";
    brightBlack = "#6c6823";
    brightRed = "#d8666a";
    brightGreen = "#35aa60";
    brightYellow = "#bb954c";
    brightBlue = "#598eb4";
    brightMagenta = "#9a7ac6";
    brightCyan = "#87ba4d";
    brightWhite = "#faf0a5";
  };

  orange = "#b36144";
  brightOrange = "#c77355";
  cursor = "#477ca1";

  tools = {
    bat = "ansi";
  };
}
