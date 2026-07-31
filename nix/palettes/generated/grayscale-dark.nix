# Grayscale Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/grayscale-dark.yaml
# Author: Alexandre Gavioli (https://github.com/Alexx2/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/grayscale-dark.nix. Edits here are lost on the
# next run.

{
  name = "grayscale-dark";
  displayName = "Grayscale Dark";
  author = "Alexandre Gavioli (https://github.com/Alexx2/)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#101010";
  surfaceDim = "#050505";
  surfaceBright = "#414141";
  surfaceContainerLowest = "#050505";
  surfaceContainerLow = "#101010";
  surfaceContainer = "#252525";
  surfaceContainerHigh = "#333333";
  surfaceContainerHighest = "#414141";
  surfaceVariant = "#252525";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f7f7f7";
  onSurface = "#b9b9b9";
  onSurfaceMuted = "#b2b2b2";
  onSurfaceVariant = "#ababab";
  onSurfaceFaint = "#525252";

  # --- Borders and dividers -----------------------------------------------
  outline = "#545453";
  outlineVariant = "#464646";

  # --- Accent roles -------------------------------------------------------
  primary = "#686868";
  onPrimary = "#f7f7f7";
  primaryContainer = "#2f2f2f";
  onPrimaryContainer = "#f7f7f7";
  secondary = "#868686";
  onSecondary = "#101010";
  tertiary = "#747474";
  onTertiary = "#fbfbfa";
  error = "#7c7c7c";
  onError = "#101010";
  inverseSurface = "#b9b9b9";
  inverseOnSurface = "#101010";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#252525";
    red = "#7c7c7c";
    green = "#8e8e8e";
    yellow = "#a0a0a0";
    blue = "#686868";
    magenta = "#747474";
    cyan = "#868686";
    white = "#b9b9b9";
    brightBlack = "#525252";
    brightRed = "#8e8e8e";
    brightGreen = "#a0a0a0";
    brightYellow = "#b3b3b3";
    brightBlue = "#797979";
    brightMagenta = "#868686";
    brightCyan = "#989898";
    brightWhite = "#f7f7f7";
  };

  orange = "#999999";
  brightOrange = "#acacac";
  cursor = "#686868";

  tools = {
    bat = "ansi";
  };
}
