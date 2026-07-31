# Kissa Macchiato -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/kissa-macchiato.yaml
# Author: rwendell (https://github.com/rwendell/kissa)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/kissa-macchiato.nix. Edits here are lost on the
# next run.

{
  name = "kissa-macchiato";
  displayName = "Kissa Macchiato";
  author = "rwendell (https://github.com/rwendell/kissa)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1f1c16";
  surfaceDim = "#12100a";
  surfaceBright = "#524f4a";
  surfaceContainerLowest = "#12100a";
  surfaceContainerLow = "#1f1c16";
  surfaceContainer = "#35322d";
  surfaceContainerHigh = "#43403b";
  surfaceContainerHighest = "#524f4a";
  surfaceVariant = "#35322d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fef4e4";
  onSurface = "#faf0e6";
  onSurfaceMuted = "#e7dac7";
  onSurfaceVariant = "#d4c4a8";
  onSurfaceFaint = "#b8a48c";

  # --- Borders and dividers -----------------------------------------------
  outline = "#b8a48c";
  outlineVariant = "#47443f";

  # --- Accent roles -------------------------------------------------------
  primary = "#7fa8d4";
  onPrimary = "#1f1c16";
  primaryContainer = "#424d57";
  onPrimaryContainer = "#fef4e4";
  secondary = "#6ab8b0";
  onSecondary = "#1f1c16";
  tertiary = "#b094cc";
  onTertiary = "#1f1c16";
  error = "#e87777";
  onError = "#1f1c16";
  inverseSurface = "#faf0e6";
  inverseOnSurface = "#1f1c16";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#35322d";
    red = "#e87777";
    green = "#8cb870";
    yellow = "#eac67a";
    blue = "#7fa8d4";
    magenta = "#b094cc";
    cyan = "#6ab8b0";
    white = "#faf0e6";
    brightBlack = "#b8a48c";
    brightRed = "#fd8a89";
    brightGreen = "#9ecb82";
    brightYellow = "#feda8d";
    brightBlue = "#91bbe8";
    brightMagenta = "#c3a7e0";
    brightCyan = "#7dcbc3";
    brightWhite = "#fef4e4";
  };

  orange = "#da9050";
  brightOrange = "#eea363";
  cursor = "#7fa8d4";

  tools = {
    bat = "ansi";
  };
}
