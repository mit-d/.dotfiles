# 0x96f -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/0x96f.yaml
# Author: Filip Janevski (https://0x96f.dev/theme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/0x96f.nix. Edits here are lost on the
# next run.

{
  name = "0x96f";
  displayName = "0x96f";
  author = "Filip Janevski (https://0x96f.dev/theme)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#262427";
  surfaceDim = "#19171a";
  surfaceBright = "#59565a";
  surfaceContainerLowest = "#19171a";
  surfaceContainerLow = "#262427";
  surfaceContainer = "#3b393c";
  surfaceContainerHigh = "#4a474b";
  surfaceContainerHighest = "#59565a";
  surfaceVariant = "#3b393c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fcfcfc";
  onSurface = "#fcfcfc";
  onSurfaceMuted = "#bab9ba";
  onSurfaceVariant = "#7c7b7d";
  onSurfaceFaint = "#676567";

  # --- Borders and dividers -----------------------------------------------
  outline = "#676567";
  outlineVariant = "#514f52";

  # --- Accent roles -------------------------------------------------------
  primary = "#49cae4";
  onPrimary = "#262427";
  primaryContainer = "#3b5e68";
  onPrimaryContainer = "#fcfcfc";
  secondary = "#aee8f4";
  onSecondary = "#262427";
  tertiary = "#a093e2";
  onTertiary = "#262427";
  error = "#ff7272";
  onError = "#262427";
  inverseSurface = "#fcfcfc";
  inverseOnSurface = "#262427";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3b393c";
    red = "#ff7272";
    green = "#bcdf59";
    yellow = "#ffca58";
    blue = "#49cae4";
    magenta = "#a093e2";
    cyan = "#aee8f4";
    white = "#fcfcfc";
    brightBlack = "#676567";
    brightRed = "#ff9693";
    brightGreen = "#cff36e";
    brightYellow = "#ffe3ac";
    brightBlue = "#60def8";
    brightMagenta = "#b3a6f6";
    brightCyan = "#d5f8ff";
    brightWhite = "#fcfcfc";
  };

  orange = "#fc9d6f";
  brightOrange = "#ffb998";
  cursor = "#49cae4";

  tools = {
    bat = "ansi";
  };
}
