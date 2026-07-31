# Da One Gray -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/da-one-gray.yaml
# Author: NNB (https://github.com/NNBnh)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/da-one-gray.nix. Edits here are lost on the
# next run.

{
  name = "da-one-gray";
  displayName = "Da One Gray";
  author = "NNB (https://github.com/NNBnh)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#181818";
  surfaceDim = "#0c0c0c";
  surfaceBright = "#444444";
  surfaceContainerLowest = "#0c0c0c";
  surfaceContainerLow = "#181818";
  surfaceContainer = "#282828";
  surfaceContainerHigh = "#363636";
  surfaceContainerHighest = "#444444";
  surfaceVariant = "#282828";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#ffffff";
  onSurfaceMuted = "#e3e3e3";
  onSurfaceVariant = "#c8c8c8";
  onSurfaceFaint = "#888888";

  # --- Borders and dividers -----------------------------------------------
  outline = "#888888";
  outlineVariant = "#585858";

  # --- Accent roles -------------------------------------------------------
  primary = "#6bb8ff";
  onPrimary = "#181818";
  primaryContainer = "#374f66";
  onPrimaryContainer = "#ffffff";
  secondary = "#8af5ff";
  onSecondary = "#181818";
  tertiary = "#e799ff";
  onTertiary = "#181818";
  error = "#fa7883";
  onError = "#181818";
  inverseSurface = "#ffffff";
  inverseOnSurface = "#181818";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282828";
    red = "#fa7883";
    green = "#98c379";
    yellow = "#ff9470";
    blue = "#6bb8ff";
    magenta = "#e799ff";
    cyan = "#8af5ff";
    white = "#ffffff";
    brightBlack = "#888888";
    brightRed = "#ff979d";
    brightGreen = "#abd78c";
    brightYellow = "#ffb399";
    brightBlue = "#94cbff";
    brightMagenta = "#eeb9ff";
    brightCyan = "#dcfcff";
    brightWhite = "#ebebeb";
  };

  orange = "#ffc387";
  brightOrange = "#ffddbd";
  cursor = "#6bb8ff";

  tools = {
    bat = "ansi";
  };
}
