# PaperColor Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/papercolor-light.yaml
# Author: Jon Leopard (http://github.com/jonleopard), Tinted Theming (https://github.com/tinted-theming), based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/papercolor-light.nix. Edits here are lost on the
# next run.

{
  name = "papercolor-light";
  displayName = "PaperColor Light";
  author = "Jon Leopard (http://github.com/jonleopard), Tinted Theming (https://github.com/tinted-theming), based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#eeeeee";
  surfaceDim = "#ffffff";
  surfaceBright = "#a1a1a1";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#eeeeee";
  surfaceContainer = "#c4c4c4";
  surfaceContainerHigh = "#b3b3b3";
  surfaceContainerHighest = "#a1a1a1";
  surfaceVariant = "#c4c4c4";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#444444";
  onSurface = "#5e5e5e";
  onSurfaceMuted = "#646464";
  onSurfaceVariant = "#6b6b6b";
  onSurfaceFaint = "#858585";

  # --- Borders and dividers -----------------------------------------------
  outline = "#858585";
  outlineVariant = "#9e9e9e";

  # --- Accent roles -------------------------------------------------------
  primary = "#005f87";
  onPrimary = "#eeeeee";
  primaryContainer = "#9cb6c7";
  onPrimaryContainer = "#444444";
  secondary = "#0087af";
  onSecondary = "#ffffff";
  tertiary = "#8700af";
  onTertiary = "#eeeeee";
  error = "#d70000";
  onError = "#eeeeee";
  inverseSurface = "#5e5e5e";
  inverseOnSurface = "#eeeeee";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#c4c4c4";
    red = "#d70000";
    green = "#008700";
    yellow = "#d75f00";
    blue = "#005f87";
    magenta = "#8700af";
    cyan = "#0087af";
    white = "#5e5e5e";
    brightBlack = "#858585";
    brightRed = "#b80000";
    brightGreen = "#007300";
    brightYellow = "#bc5200";
    brightBlue = "#004d6f";
    brightMagenta = "#6f0091";
    brightCyan = "#007497";
    brightWhite = "#444444";
  };

  orange = "#d75f00";
  brightOrange = "#bc5200";
  cursor = "#005f87";

  tools = {
    bat = "ansi";
  };
}
