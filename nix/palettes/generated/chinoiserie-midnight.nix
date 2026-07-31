# Chinoiserie Midnight -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/chinoiserie-midnight.yaml
# Author: Di Wang (https://cs.cmu.edu/~diw3)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/chinoiserie-midnight.nix. Edits here are lost on the
# next run.

{
  name = "chinoiserie-midnight";
  displayName = "Chinoiserie Midnight";
  author = "Di Wang (https://cs.cmu.edu/~diw3)";
  variant = "dark";
  version = "3.1.0";

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
  primary = "#81a2a2";
  onPrimary = "#1d1d1d";
  primaryContainer = "#414b4b";
  onPrimaryContainer = "#fffef9";
  secondary = "#88b68d";
  onSecondary = "#1d1d1d";
  tertiary = "#cf8997";
  onTertiary = "#1d1d1d";
  error = "#ed5a56";
  onError = "#1d1d1d";
  inverseSurface = "#c4cbcf";
  inverseOnSurface = "#1d1d1d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282828";
    red = "#ed5a56";
    green = "#aeb831";
    yellow = "#fbb957";
    blue = "#81a2a2";
    magenta = "#cf8997";
    cyan = "#88b68d";
    white = "#c4cbcf";
    brightBlack = "#918072";
    brightRed = "#ff716b";
    brightGreen = "#c1cb49";
    brightYellow = "#ffd295";
    brightBlue = "#93b5b5";
    brightMagenta = "#e39baa";
    brightCyan = "#9bc99f";
    brightWhite = "#fffef9";
  };

  orange = "#fc8c23";
  brightOrange = "#ffaa69";
  cursor = "#81a2a2";

  tools = {
    bat = "ansi";
  };
}
