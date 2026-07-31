# Chinoiserie Night -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/chinoiserie-night.yaml
# Author: Di Wang (https://cs.cmu.edu/~diw3)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/chinoiserie-night.nix. Edits here are lost on the
# next run.

{
  name = "chinoiserie-night";
  displayName = "Chinoiserie Night";
  author = "Di Wang (https://cs.cmu.edu/~diw3)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1d1d1d";
  surfaceDim = "#131313";
  surfaceBright = "#3f3f3f";
  surfaceContainerLowest = "#131313";
  surfaceContainerLow = "#1d1d1d";
  surfaceContainer = "#282828";
  surfaceContainerHigh = "#333333";
  surfaceContainerHighest = "#3f3f3f";
  surfaceVariant = "#282828";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fffef9";
  onSurface = "#c4cbcf";
  onSurfaceMuted = "#c1bcbe";
  onSurfaceVariant = "#bdaead";
  onSurfaceFaint = "#918072";

  # --- Borders and dividers -----------------------------------------------
  outline = "#918072";
  outlineVariant = "#373737";

  # --- Accent roles -------------------------------------------------------
  primary = "#8fb2c9";
  onPrimary = "#1d1d1d";
  primaryContainer = "#455158";
  onPrimaryContainer = "#fffef9";
  secondary = "#b0d5df";
  onSecondary = "#1d1d1d";
  tertiary = "#be9db9";
  onTertiary = "#1d1d1d";
  error = "#f07c82";
  onError = "#1d1d1d";
  inverseSurface = "#c4cbcf";
  inverseOnSurface = "#1d1d1d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282828";
    red = "#f07c82";
    green = "#b2cf87";
    yellow = "#f4ce69";
    blue = "#8fb2c9";
    magenta = "#be9db9";
    cyan = "#b0d5df";
    white = "#c4cbcf";
    brightBlack = "#918072";
    brightRed = "#ff9397";
    brightGreen = "#c5e39a";
    brightYellow = "#ffe49e";
    brightBlue = "#a2c5dd";
    brightMagenta = "#d1b0cc";
    brightCyan = "#c3e9f3";
    brightWhite = "#fffef9";
  };

  orange = "#f4a83a";
  brightOrange = "#ffbf6d";
  cursor = "#8fb2c9";

  tools = {
    bat = "ansi";
  };
}
