# Ayu Mirage -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/ayu-mirage.yaml
# Author: Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/ayu-mirage.nix. Edits here are lost on the
# next run.

{
  name = "ayu-mirage";
  displayName = "Ayu Mirage";
  author = "Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1f2430";
  surfaceDim = "#1a1f2a";
  surfaceBright = "#2f3442";
  surfaceContainerLowest = "#1a1f2a";
  surfaceContainerLow = "#1f2430";
  surfaceContainer = "#242936";
  surfaceContainerHigh = "#292e3c";
  surfaceContainerHighest = "#2f3442";
  surfaceVariant = "#242936";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f3f4f5";
  onSurface = "#cccac2";
  onSurfaceMuted = "#9da1a7";
  onSurfaceVariant = "#707a8c";
  onSurfaceFaint = "#535962";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5c616a";
  outlineVariant = "#363c48";

  # --- Accent roles -------------------------------------------------------
  primary = "#73d0ff";
  onPrimary = "#1f2430";
  primaryContainer = "#3f6078";
  onPrimaryContainer = "#f3f4f5";
  secondary = "#95e6cb";
  onSecondary = "#1f2430";
  tertiary = "#d4bfff";
  onTertiary = "#1f2430";
  error = "#f28779";
  onError = "#1f2430";
  inverseSurface = "#cccac2";
  inverseOnSurface = "#1f2430";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#242936";
    red = "#f28779";
    green = "#d5ff80";
    yellow = "#ffd173";
    blue = "#73d0ff";
    magenta = "#d4bfff";
    cyan = "#95e6cb";
    white = "#cccac2";
    brightBlack = "#4a5059";
    brightRed = "#ff9f92";
    brightGreen = "#ffffff";
    brightYellow = "#ffe9bf";
    brightBlue = "#a7e0ff";
    brightMagenta = "#e4d8ff";
    brightCyan = "#a9fadf";
    brightWhite = "#f3f4f5";
  };

  orange = "#ffad66";
  brightOrange = "#ffc99d";
  cursor = "#73d0ff";

  tools = {
    bat = "ansi";
  };
}
