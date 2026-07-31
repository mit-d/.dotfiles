# Mocha -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/mocha.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/mocha.nix. Edits here are lost on the
# next run.

{
  name = "mocha";
  displayName = "Mocha";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#3b3228";
  surfaceDim = "#2d241b";
  surfaceBright = "#726454";
  surfaceContainerLowest = "#2d241b";
  surfaceContainerLow = "#3b3228";
  surfaceContainer = "#534636";
  surfaceContainerHigh = "#625545";
  surfaceContainerHighest = "#726454";
  surfaceVariant = "#534636";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5eeeb";
  onSurface = "#d0c8c6";
  onSurfaceMuted = "#c4bbb9";
  onSurfaceVariant = "#b8afad";
  onSurfaceFaint = "#7e705a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7e705a";
  outlineVariant = "#645240";

  # --- Accent roles -------------------------------------------------------
  primary = "#8ab3b5";
  onPrimary = "#3b3228";
  primaryContainer = "#59605a";
  onPrimaryContainer = "#f5eeeb";
  secondary = "#7bbda4";
  onSecondary = "#3b3228";
  tertiary = "#a89bb9";
  onTertiary = "#3b3228";
  error = "#cb6077";
  onError = "#1c1a1a";
  inverseSurface = "#d0c8c6";
  inverseOnSurface = "#3b3228";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#534636";
    red = "#cb6077";
    green = "#beb55b";
    yellow = "#f4bc87";
    blue = "#8ab3b5";
    magenta = "#a89bb9";
    cyan = "#7bbda4";
    white = "#d0c8c6";
    brightBlack = "#7e705a";
    brightRed = "#e07289";
    brightGreen = "#d1c86e";
    brightYellow = "#ffd3aa";
    brightBlue = "#9dc6c8";
    brightMagenta = "#bbaecc";
    brightCyan = "#8ed0b7";
    brightWhite = "#f5eeeb";
  };

  orange = "#d28b71";
  brightOrange = "#e69e83";
  cursor = "#8ab3b5";

  tools = {
    bat = "ansi";
  };
}
