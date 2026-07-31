# standardized-light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/standardized-light.yaml
# Author: ali (https://github.com/ali-githb/base16-standardized-scheme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/standardized-light.nix. Edits here are lost on the
# next run.

{
  name = "standardized-light";
  displayName = "standardized-light";
  author = "ali (https://github.com/ali-githb/base16-standardized-scheme)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#cdcdcd";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#eeeeee";
  surfaceContainerHigh = "#dddddd";
  surfaceContainerHighest = "#cdcdcd";
  surfaceVariant = "#eeeeee";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#222222";
  onSurface = "#444444";
  onSurfaceMuted = "#5c5c5c";
  onSurfaceVariant = "#767676";
  onSurfaceFaint = "#767676";

  # --- Borders and dividers -----------------------------------------------
  outline = "#767676";
  outlineVariant = "#cccccc";

  # --- Accent roles -------------------------------------------------------
  primary = "#3173c5";
  onPrimary = "#ffffff";
  primaryContainer = "#b1caeb";
  onPrimaryContainer = "#222222";
  secondary = "#00998f";
  onSecondary = "#222222";
  tertiary = "#9e57c2";
  onTertiary = "#ffffff";
  error = "#d03e3e";
  onError = "#ffffff";
  inverseSurface = "#444444";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#eeeeee";
    red = "#d03e3e";
    green = "#31861f";
    yellow = "#ad8200";
    blue = "#3173c5";
    magenta = "#9e57c2";
    cyan = "#00998f";
    white = "#444444";
    brightBlack = "#767676";
    brightRed = "#bb272c";
    brightGreen = "#1b7400";
    brightYellow = "#977100";
    brightBlue = "#1d61b1";
    brightMagenta = "#8b45ae";
    brightCyan = "#00857c";
    brightWhite = "#222222";
  };

  orange = "#d7691d";
  brightOrange = "#c15800";
  cursor = "#3173c5";

  tools = {
    bat = "ansi";
  };
}
