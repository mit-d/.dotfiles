# Catppuccin Mocha -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/catppuccin-mocha.yaml
# Author: https://github.com/catppuccin/catppuccin
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/catppuccin-mocha.nix. Edits here are lost on the
# next run.

{
  name = "catppuccin-mocha";
  displayName = "Catppuccin Mocha";
  author = "https://github.com/catppuccin/catppuccin";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1e1e2e";
  surfaceDim = "#181827";
  surfaceBright = "#252533";
  surfaceContainerLowest = "#181827";
  surfaceContainerLow = "#1e1e2e";
  surfaceContainer = "#181825";
  surfaceContainerHigh = "#1e1e2c";
  surfaceContainerHighest = "#252533";
  surfaceVariant = "#181825";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5e0dc";
  onSurface = "#cdd6f4";
  onSurfaceMuted = "#9096b0";
  onSurfaceVariant = "#737384";
  onSurfaceFaint = "#535465";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5c5c6c";
  outlineVariant = "#363748";

  # --- Accent roles -------------------------------------------------------
  primary = "#89b4fa";
  onPrimary = "#1e1e2e";
  primaryContainer = "#445275";
  onPrimaryContainer = "#f5e0dc";
  secondary = "#94e2d5";
  onSecondary = "#1e1e2e";
  tertiary = "#cba6f7";
  onTertiary = "#1e1e2e";
  error = "#f38ba8";
  onError = "#1e1e2e";
  inverseSurface = "#cdd6f4";
  inverseOnSurface = "#1e1e2e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#181825";
    red = "#f38ba8";
    green = "#a6e3a1";
    yellow = "#f9e2af";
    blue = "#89b4fa";
    magenta = "#cba6f7";
    cyan = "#94e2d5";
    white = "#cdd6f4";
    brightBlack = "#45475a";
    brightRed = "#ffa4bc";
    brightGreen = "#b9f7b4";
    brightYellow = "#fff8e7";
    brightBlue = "#a5c8ff";
    brightMagenta = "#dbbeff";
    brightCyan = "#a7f6e9";
    brightWhite = "#f5e0dc";
  };

  orange = "#fab387";
  brightOrange = "#ffcdae";
  cursor = "#89b4fa";

  tools = {
    bat = "Catppuccin Mocha";
  };
}
