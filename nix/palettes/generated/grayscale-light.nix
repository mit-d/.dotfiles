# Grayscale Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/grayscale-light.yaml
# Author: Alexandre Gavioli (https://github.com/Alexx2/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/grayscale-light.nix. Edits here are lost on the
# next run.

{
  name = "grayscale-light";
  displayName = "Grayscale Light";
  author = "Alexandre Gavioli (https://github.com/Alexx2/)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f7f7f7";
  surfaceDim = "#ffffff";
  surfaceBright = "#bfbfbf";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f7f7f7";
  surfaceContainer = "#e3e3e3";
  surfaceContainerHigh = "#d1d1d1";
  surfaceContainerHighest = "#bfbfbf";
  surfaceVariant = "#e3e3e3";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#101010";
  onSurface = "#464646";
  onSurfaceMuted = "#4c4c4c";
  onSurfaceVariant = "#525252";
  onSurfaceFaint = "#a9a9a9";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9e9e9e";
  outlineVariant = "#b9b9b9";

  # --- Accent roles -------------------------------------------------------
  primary = "#686868";
  onPrimary = "#f7f7f7";
  primaryContainer = "#bebebe";
  onPrimaryContainer = "#101010";
  secondary = "#868686";
  onSecondary = "#101010";
  tertiary = "#747474";
  onTertiary = "#fbfbfb";
  error = "#7c7c7c";
  onError = "#101010";
  inverseSurface = "#464646";
  inverseOnSurface = "#f7f7f7";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e3e3e3";
    red = "#7c7c7c";
    green = "#8e8e8e";
    yellow = "#a0a0a0";
    blue = "#686868";
    magenta = "#747474";
    cyan = "#868686";
    white = "#464646";
    brightBlack = "#ababab";
    brightRed = "#6b6b6b";
    brightGreen = "#7c7c7c";
    brightYellow = "#8e8e8e";
    brightBlue = "#575757";
    brightMagenta = "#636363";
    brightCyan = "#747474";
    brightWhite = "#101010";
  };

  orange = "#999999";
  brightOrange = "#878787";
  cursor = "#686868";

  tools = {
    bat = "ansi";
  };
}
