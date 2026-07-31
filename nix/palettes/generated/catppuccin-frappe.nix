# Catppuccin Frappe -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/catppuccin-frappe.yaml
# Author: https://github.com/catppuccin/catppuccin
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/catppuccin-frappe.nix. Edits here are lost on the
# next run.

{
  name = "catppuccin-frappe";
  displayName = "Catppuccin Frappe";
  author = "https://github.com/catppuccin/catppuccin";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#303446";
  surfaceDim = "#282c3e";
  surfaceBright = "#393c4d";
  surfaceContainerLowest = "#282c3e";
  surfaceContainerLow = "#303446";
  surfaceContainer = "#292c3c";
  surfaceContainerHigh = "#313444";
  surfaceContainerHighest = "#393c4d";
  surfaceVariant = "#292c3c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f2d5cf";
  onSurface = "#c6d0f5";
  onSurfaceMuted = "#929ab9";
  onSurfaceVariant = "#8a8797";
  onSurfaceFaint = "#64677a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6f6f81";
  outlineVariant = "#464a5d";

  # --- Accent roles -------------------------------------------------------
  primary = "#8caaee";
  onPrimary = "#303446";
  primaryContainer = "#515e82";
  onPrimaryContainer = "#f2d5cf";
  secondary = "#81c8be";
  onSecondary = "#303446";
  tertiary = "#ca9ee6";
  onTertiary = "#303446";
  error = "#e78284";
  onError = "#303446";
  inverseSurface = "#c6d0f5";
  inverseOnSurface = "#303446";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#292c3c";
    red = "#e78284";
    green = "#a6d189";
    yellow = "#e5c890";
    blue = "#8caaee";
    magenta = "#ca9ee6";
    cyan = "#81c8be";
    white = "#c6d0f5";
    brightBlack = "#51576d";
    brightRed = "#fc9596";
    brightGreen = "#b9e59c";
    brightYellow = "#f9dca3";
    brightBlue = "#a0bdff";
    brightMagenta = "#deb1fa";
    brightCyan = "#94dcd1";
    brightWhite = "#f2d5cf";
  };

  orange = "#ef9f76";
  brightOrange = "#ffb48e";
  cursor = "#8caaee";

  tools = {
    bat = "Catppuccin Frappe";
  };
}
