# selenized-black -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/selenized-black.yaml
# Author: Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/selenized-black.nix. Edits here are lost on the
# next run.

{
  name = "selenized-black";
  displayName = "selenized-black";
  author = "Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#181818";
  surfaceDim = "#0c0c0c";
  surfaceBright = "#414141";
  surfaceContainerLowest = "#0c0c0c";
  surfaceContainerLow = "#181818";
  surfaceContainer = "#252525";
  surfaceContainerHigh = "#333333";
  surfaceContainerHighest = "#414141";
  surfaceVariant = "#252525";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#dedede";
  onSurface = "#b9b9b9";
  onSurfaceMuted = "#979797";
  onSurfaceVariant = "#777777";
  onSurfaceFaint = "#777777";

  # --- Borders and dividers -----------------------------------------------
  outline = "#777777";
  outlineVariant = "#3b3b3b";

  # --- Accent roles -------------------------------------------------------
  primary = "#368aeb";
  onPrimary = "#181818";
  primaryContainer = "#274160";
  onPrimaryContainer = "#dedede";
  secondary = "#3fc5b7";
  onSecondary = "#181818";
  tertiary = "#a580e2";
  onTertiary = "#181818";
  error = "#ed4a46";
  onError = "#181818";
  inverseSurface = "#b9b9b9";
  inverseOnSurface = "#181818";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#252525";
    red = "#ed4a46";
    green = "#70b433";
    yellow = "#dbb32d";
    blue = "#368aeb";
    magenta = "#a580e2";
    cyan = "#3fc5b7";
    white = "#b9b9b9";
    brightBlack = "#777777";
    brightRed = "#ff635c";
    brightGreen = "#82c749";
    brightYellow = "#efc647";
    brightBlue = "#4b9dff";
    brightMagenta = "#b893f6";
    brightCyan = "#57d9ca";
    brightWhite = "#dedede";
  };

  orange = "#e67f43";
  brightOrange = "#fb9257";
  cursor = "#368aeb";

  tools = {
    bat = "ansi";
  };
}
