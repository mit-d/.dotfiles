# Chinoiserie Morandi -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/chinoiserie-morandi.yaml
# Author: Di Wang (https://cs.cmu.edu/~diw3)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/chinoiserie-morandi.nix. Edits here are lost on the
# next run.

{
  name = "chinoiserie-morandi";
  displayName = "Chinoiserie Morandi";
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
  primary = "#839ec9";
  onPrimary = "#1d1d1d";
  primaryContainer = "#414a58";
  onPrimaryContainer = "#fffef9";
  secondary = "#5e8c9b";
  onSecondary = "#1d1d1d";
  tertiary = "#98a1d8";
  onTertiary = "#1d1d1d";
  error = "#c06061";
  onError = "#131313";
  inverseSurface = "#c4cbcf";
  inverseOnSurface = "#1d1d1d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282828";
    red = "#c06061";
    green = "#8ca07b";
    yellow = "#e5bc84";
    blue = "#839ec9";
    magenta = "#98a1d8";
    cyan = "#5e8c9b";
    white = "#c4cbcf";
    brightBlack = "#918072";
    brightRed = "#d47272";
    brightGreen = "#9eb38d";
    brightYellow = "#f9cf97";
    brightBlue = "#95b1dd";
    brightMagenta = "#aab4ec";
    brightCyan = "#709eae";
    brightWhite = "#fffef9";
  };

  orange = "#ff937f";
  brightOrange = "#ffb2a3";
  cursor = "#839ec9";

  tools = {
    bat = "ansi";
  };
}
