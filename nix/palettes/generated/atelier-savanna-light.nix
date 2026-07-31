# Atelier Savanna Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-savanna-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-savanna-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-savanna-light";
  displayName = "Atelier Savanna Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ecf4ee";
  surfaceDim = "#fdfffe";
  surfaceBright = "#c6cec9";
  surfaceContainerLowest = "#fdfffe";
  surfaceContainerLow = "#ecf4ee";
  surfaceContainer = "#dfe7e2";
  surfaceContainerHigh = "#d2dad5";
  surfaceContainerHighest = "#c6cec9";
  surfaceVariant = "#dfe7e2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#171c19";
  onSurface = "#526057";
  onSurfaceMuted = "#58665d";
  onSurfaceVariant = "#5f6d64";
  onSurfaceFaint = "#78877d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#78877d";
  outlineVariant = "#87928a";

  # --- Accent roles -------------------------------------------------------
  primary = "#478c90";
  onPrimary = "#ffffff";
  primaryContainer = "#aeccc9";
  onPrimaryContainer = "#171c19";
  secondary = "#1c9aa0";
  onSecondary = "#171c19";
  tertiary = "#55859b";
  onTertiary = "#ffffff";
  error = "#b16139";
  onError = "#fefefe";
  inverseSurface = "#526057";
  inverseOnSurface = "#ecf4ee";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#dfe7e2";
    red = "#b16139";
    green = "#489963";
    yellow = "#a07e3b";
    blue = "#478c90";
    magenta = "#55859b";
    cyan = "#1c9aa0";
    white = "#526057";
    brightBlack = "#78877d";
    brightRed = "#9d4f27";
    brightGreen = "#348752";
    brightYellow = "#8e6c28";
    brightBlue = "#347a7e";
    brightMagenta = "#447389";
    brightCyan = "#00878d";
    brightWhite = "#171c19";
  };

  orange = "#9f713c";
  brightOrange = "#8c5f2a";
  cursor = "#478c90";

  tools = {
    bat = "ansi";
  };
}
