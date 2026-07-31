# Black Metal (Mayhem) -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/black-metal-mayhem.yaml
# Author: metalelf0 (https://github.com/metalelf0)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/black-metal-mayhem.nix. Edits here are lost on the
# next run.

{
  name = "black-metal-mayhem";
  displayName = "Black Metal (Mayhem)";
  author = "metalelf0 (https://github.com/metalelf0)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#2c2c2c";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#121212";
  surfaceContainerHigh = "#1f1f1f";
  surfaceContainerHighest = "#2c2c2c";
  surfaceVariant = "#121212";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#c1c1c1";
  onSurface = "#c1c1c1";
  onSurfaceMuted = "#adadad";
  onSurfaceVariant = "#999999";
  onSurfaceFaint = "#454545";

  # --- Borders and dividers -----------------------------------------------
  outline = "#4d4d4d";
  outlineVariant = "#272727";

  # --- Accent roles -------------------------------------------------------
  primary = "#888888";
  onPrimary = "#000000";
  primaryContainer = "#1f1f1f";
  onPrimaryContainer = "#c1c1c1";
  secondary = "#aaaaaa";
  onSecondary = "#000000";
  tertiary = "#999999";
  onTertiary = "#000000";
  error = "#5f8787";
  onError = "#000000";
  inverseSurface = "#c1c1c1";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#121212";
    red = "#5f8787";
    green = "#f3ecd4";
    yellow = "#eecc6c";
    blue = "#888888";
    magenta = "#999999";
    cyan = "#aaaaaa";
    white = "#c1c1c1";
    brightBlack = "#333333";
    brightRed = "#719999";
    brightGreen = "#ffffff";
    brightYellow = "#ffe08b";
    brightBlue = "#9a9a9a";
    brightMagenta = "#acacac";
    brightCyan = "#bdbdbd";
    brightWhite = "#c1c1c1";
  };

  orange = "#aaaaaa";
  brightOrange = "#bdbdbd";
  cursor = "#888888";

  tools = {
    bat = "ansi";
  };
}
