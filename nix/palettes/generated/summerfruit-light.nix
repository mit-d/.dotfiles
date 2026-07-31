# Summerfruit Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/summerfruit-light.yaml
# Author: Christopher Corley (http://christop.club/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/summerfruit-light.nix. Edits here are lost on the
# next run.

{
  name = "summerfruit-light";
  displayName = "Summerfruit Light";
  author = "Christopher Corley (http://christop.club/)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#bcbcbc";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#e0e0e0";
  surfaceContainerHigh = "#cecece";
  surfaceContainerHighest = "#bcbcbc";
  surfaceVariant = "#e0e0e0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#101010";
  onSurface = "#101010";
  onSurfaceMuted = "#101010";
  onSurfaceVariant = "#101010";
  onSurfaceFaint = "#afaeae";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a4a3a3";
  outlineVariant = "#d0d0d0";

  # --- Accent roles -------------------------------------------------------
  primary = "#3777e6";
  onPrimary = "#100f0f";
  primaryContainer = "#b2cdf9";
  onPrimaryContainer = "#101010";
  secondary = "#1faaaa";
  onSecondary = "#101010";
  tertiary = "#ad00a1";
  onTertiary = "#ffffff";
  error = "#ff0086";
  onError = "#101010";
  inverseSurface = "#101010";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e0e0e0";
    red = "#ff0086";
    green = "#00c918";
    yellow = "#aba800";
    blue = "#3777e6";
    magenta = "#ad00a1";
    cyan = "#1faaaa";
    white = "#101010";
    brightBlack = "#b0b0b0";
    brightRed = "#e00075";
    brightGreen = "#00b314";
    brightYellow = "#989500";
    brightBlue = "#2564d1";
    brightMagenta = "#920088";
    brightCyan = "#009697";
    brightWhite = "#050505";
  };

  orange = "#fd8900";
  brightOrange = "#e27a00";
  cursor = "#3777e6";

  tools = {
    bat = "ansi";
  };
}
