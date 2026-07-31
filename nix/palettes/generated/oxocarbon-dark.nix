# Oxocarbon Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/oxocarbon-dark.yaml
# Author: shaunsingh/IBM, Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/oxocarbon-dark.nix. Edits here are lost on the
# next run.

{
  name = "oxocarbon-dark";
  displayName = "Oxocarbon Dark";
  author = "shaunsingh/IBM, Tinted Theming (https://github.com/tinted-theming)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#161616";
  surfaceDim = "#0a0a0a";
  surfaceBright = "#424242";
  surfaceContainerLowest = "#0a0a0a";
  surfaceContainerLow = "#161616";
  surfaceContainer = "#262626";
  surfaceContainerHigh = "#343434";
  surfaceContainerHighest = "#424242";
  surfaceVariant = "#262626";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#f2f4f8";
  onSurfaceMuted = "#e7eaef";
  onSurfaceVariant = "#dde1e6";
  onSurfaceFaint = "#525252";

  # --- Borders and dividers -----------------------------------------------
  outline = "#575756";
  outlineVariant = "#393939";

  # --- Accent roles -------------------------------------------------------
  primary = "#33b1ff";
  onPrimary = "#161616";
  primaryContainer = "#294c65";
  onPrimaryContainer = "#ffffff";
  secondary = "#3ddbd9";
  onSecondary = "#161616";
  tertiary = "#be95ff";
  onTertiary = "#161616";
  error = "#ee5396";
  onError = "#161616";
  inverseSurface = "#f2f4f8";
  inverseOnSurface = "#161616";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#262626";
    red = "#ee5396";
    green = "#42be65";
    yellow = "#ff6f00";
    blue = "#33b1ff";
    magenta = "#be95ff";
    cyan = "#3ddbd9";
    white = "#f2f4f8";
    brightBlack = "#525252";
    brightRed = "#ff6da8";
    brightGreen = "#58d277";
    brightYellow = "#ff935c";
    brightBlue = "#70c3ff";
    brightMagenta = "#cdb0ff";
    brightCyan = "#58efed";
    brightWhite = "#ffffff";
  };

  orange = "#ff7eb6";
  brightOrange = "#ffa2c7";
  cursor = "#33b1ff";

  tools = {
    bat = "ansi";
  };
}
