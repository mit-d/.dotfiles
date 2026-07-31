# Kanagawa Dragon -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/kanagawa-dragon.yaml
# Author: Stefan Weigl-Bosker (https://github.com/sweiglbosker), Tommaso Laurenzi (https://github.com/rebelot/kanagawa.nvim)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/kanagawa-dragon.nix. Edits here are lost on the
# next run.

{
  name = "kanagawa-dragon";
  displayName = "Kanagawa Dragon";
  author = "Stefan Weigl-Bosker (https://github.com/sweiglbosker), Tommaso Laurenzi (https://github.com/rebelot/kanagawa.nvim)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#181616";
  surfaceDim = "#0c0a0a";
  surfaceBright = "#444343";
  surfaceContainerLowest = "#0c0a0a";
  surfaceContainerLow = "#181616";
  surfaceContainer = "#282727";
  surfaceContainerHigh = "#363535";
  surfaceContainerHighest = "#444343";
  surfaceVariant = "#282727";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#c5c9c5";
  onSurface = "#c5c9c5";
  onSurfaceMuted = "#9ba29b";
  onSurfaceVariant = "#737c73";
  onSurfaceFaint = "#625e5a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#625e5a";
  outlineVariant = "#393836";

  # --- Accent roles -------------------------------------------------------
  primary = "#8ba4b0";
  onPrimary = "#181616";
  primaryContainer = "#40474b";
  onPrimaryContainer = "#c5c9c5";
  secondary = "#8ea4a2";
  onSecondary = "#181616";
  tertiary = "#a292a3";
  onTertiary = "#181616";
  error = "#c4746e";
  onError = "#181616";
  inverseSurface = "#c5c9c5";
  inverseOnSurface = "#181616";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282727";
    red = "#c4746e";
    green = "#8a9a7b";
    yellow = "#c4b28a";
    blue = "#8ba4b0";
    magenta = "#a292a3";
    cyan = "#8ea4a2";
    white = "#c5c9c5";
    brightBlack = "#625e5a";
    brightRed = "#d88680";
    brightGreen = "#9cad8d";
    brightYellow = "#d7c59d";
    brightBlue = "#9db7c3";
    brightMagenta = "#b5a4b6";
    brightCyan = "#a0b7b5";
    brightWhite = "#c5c9c5";
  };

  orange = "#b6927b";
  brightOrange = "#c9a48d";
  cursor = "#8ba4b0";

  tools = {
    bat = "ansi";
  };
}
