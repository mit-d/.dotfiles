# Rose Pine Dawn -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/rose-pine-dawn.yaml
# Author: Emilia Dunfelt <edun@dunfelt.se>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/rose-pine-dawn.nix. Edits here are lost on the
# next run.

{
  name = "rose-pine-dawn";
  displayName = "Rose Pine Dawn";
  author = "Emilia Dunfelt <edun@dunfelt.se>";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#faf4ed";
  surfaceDim = "#fffcf8";
  surfaceBright = "#f0ebe4";
  surfaceContainerLowest = "#fffcf8";
  surfaceContainerLow = "#faf4ed";
  surfaceContainer = "#fffaf3";
  surfaceContainerHigh = "#f8f3ec";
  surfaceContainerHighest = "#f0ebe4";
  surfaceVariant = "#fffaf3";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#534f74";
  onSurface = "#575279";
  onSurfaceMuted = "#686386";
  onSurfaceVariant = "#797593";
  onSurfaceFaint = "#9893a5";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9893a5";
  outlineVariant = "#d7cfcd";

  # --- Accent roles -------------------------------------------------------
  primary = "#907aa9";
  onPrimary = "#1c1c1a";
  primaryContainer = "#d0c4d4";
  onPrimaryContainer = "#534f74";
  secondary = "#56949f";
  onSecondary = "#262423";
  tertiary = "#ea9d34";
  onTertiary = "#423e5d";
  error = "#b4637a";
  onError = "#111110";
  inverseSurface = "#575279";
  inverseOnSurface = "#faf4ed";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#fffaf3";
    red = "#b4637a";
    green = "#286983";
    yellow = "#d7827e";
    blue = "#907aa9";
    magenta = "#ea9d34";
    cyan = "#56949f";
    white = "#575279";
    brightBlack = "#9893a5";
    brightRed = "#a05169";
    brightGreen = "#125871";
    brightYellow = "#c3706c";
    brightBlue = "#7e6896";
    brightMagenta = "#d68a16";
    brightCyan = "#44828d";
    brightWhite = "#534f74";
  };

  orange = "#ea9d34";
  brightOrange = "#d68a16";
  cursor = "#907aa9";

  tools = {
    bat = "ansi";
  };
}
