# Kissa Latte -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/kissa-latte.yaml
# Author: rwendell (https://github.com/rwendell/kissa)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/kissa-latte.nix. Edits here are lost on the
# next run.

{
  name = "kissa-latte";
  displayName = "Kissa Latte";
  author = "rwendell (https://github.com/rwendell/kissa)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f5f4f0";
  surfaceDim = "#ffffff";
  surfaceBright = "#cecdc9";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f5f4f0";
  surfaceContainer = "#e8e7e3";
  surfaceContainerHigh = "#dbdad6";
  surfaceContainerHighest = "#cecdc9";
  surfaceVariant = "#e8e7e3";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1f1b17";
  onSurface = "#1f1c16";
  onSurfaceMuted = "#47423a";
  onSurfaceVariant = "#746c62";
  onSurfaceFaint = "#91887d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#91887d";
  outlineVariant = "#d3cfc9";

  # --- Accent roles -------------------------------------------------------
  primary = "#3468a8";
  onPrimary = "#f5f4f0";
  primaryContainer = "#aabed6";
  onPrimaryContainer = "#1f1b17";
  secondary = "#287070";
  onSecondary = "#f5f4f0";
  tertiary = "#6438a0";
  onTertiary = "#f5f4f0";
  error = "#9e3e3e";
  onError = "#f5f4f0";
  inverseSurface = "#1f1c16";
  inverseOnSurface = "#f5f4f0";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e8e7e3";
    red = "#9e3e3e";
    green = "#387050";
    yellow = "#7d6820";
    blue = "#3468a8";
    magenta = "#6438a0";
    cyan = "#287070";
    white = "#1f1c16";
    brightBlack = "#91887d";
    brightRed = "#8a2c2e";
    brightGreen = "#265f40";
    brightYellow = "#6c5705";
    brightBlue = "#225695";
    brightMagenta = "#54258d";
    brightCyan = "#105f5f";
    brightWhite = "#1f1b17";
  };

  orange = "#8f5d22";
  brightOrange = "#7d4c0a";
  cursor = "#3468a8";

  tools = {
    bat = "ansi";
  };
}
