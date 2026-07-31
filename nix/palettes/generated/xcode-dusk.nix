# XCode Dusk -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/xcode-dusk.yaml
# Author: Elsa Gonsiorowski (https://github.com/gonsie)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/xcode-dusk.nix. Edits here are lost on the
# next run.

{
  name = "xcode-dusk";
  displayName = "XCode Dusk";
  author = "Elsa Gonsiorowski (https://github.com/gonsie)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#282b35";
  surfaceDim = "#1b1e27";
  surfaceBright = "#5b5e66";
  surfaceContainerLowest = "#1b1e27";
  surfaceContainerLow = "#282b35";
  surfaceContainer = "#3d4048";
  surfaceContainerHigh = "#4c4f57";
  surfaceContainerHighest = "#5b5e66";
  surfaceVariant = "#3d4048";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#bebfc2";
  onSurface = "#939599";
  onSurfaceMuted = "#888a8f";
  onSurfaceVariant = "#7e8086";
  onSurfaceFaint = "#686a71";

  # --- Borders and dividers -----------------------------------------------
  outline = "#686a71";
  outlineVariant = "#53555d";

  # --- Accent roles -------------------------------------------------------
  primary = "#790ead";
  onPrimary = "#bebfc2";
  primaryContainer = "#462c61";
  onPrimaryContainer = "#bebfc2";
  secondary = "#00a0be";
  onSecondary = "#282b35";
  tertiary = "#b21889";
  onTertiary = "#dbdbdd";
  error = "#b21889";
  onError = "#dbdbdd";
  inverseSurface = "#939599";
  inverseOnSurface = "#282b35";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3d4048";
    red = "#b21889";
    green = "#df0002";
    yellow = "#438288";
    blue = "#790ead";
    magenta = "#b21889";
    cyan = "#00a0be";
    white = "#939599";
    brightBlack = "#686a71";
    brightRed = "#c7339b";
    brightGreen = "#f52e23";
    brightYellow = "#55949a";
    brightBlue = "#8b2cc1";
    brightMagenta = "#c7339b";
    brightCyan = "#2fb3d1";
    brightWhite = "#bebfc2";
  };

  orange = "#786dc5";
  brightOrange = "#897fd9";
  cursor = "#915db8";

  tools = {
    bat = "ansi";
  };
}
