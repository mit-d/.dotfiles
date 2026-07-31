# Atelier Savanna -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-savanna.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-savanna.nix. Edits here are lost on the
# next run.

{
  name = "atelier-savanna";
  displayName = "Atelier Savanna";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#171c19";
  surfaceDim = "#0b100d";
  surfaceBright = "#3f4641";
  surfaceContainerLowest = "#0b100d";
  surfaceContainerLow = "#171c19";
  surfaceContainer = "#232a25";
  surfaceContainerHigh = "#313833";
  surfaceContainerHighest = "#3f4641";
  surfaceVariant = "#232a25";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ecf4ee";
  onSurface = "#87928a";
  onSurfaceMuted = "#7f8c83";
  onSurfaceVariant = "#78877d";
  onSurfaceFaint = "#5f6d64";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5f6d64";
  outlineVariant = "#526057";

  # --- Accent roles -------------------------------------------------------
  primary = "#478c90";
  onPrimary = "#161b18";
  primaryContainer = "#2a4343";
  onPrimaryContainer = "#ecf4ee";
  secondary = "#1c9aa0";
  onSecondary = "#171c19";
  tertiary = "#55859b";
  onTertiary = "#121714";
  error = "#b16139";
  onError = "#050505";
  inverseSurface = "#87928a";
  inverseOnSurface = "#171c19";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#232a25";
    red = "#b16139";
    green = "#489963";
    yellow = "#a07e3b";
    blue = "#478c90";
    magenta = "#55859b";
    cyan = "#1c9aa0";
    white = "#87928a";
    brightBlack = "#5f6d64";
    brightRed = "#c5734b";
    brightGreen = "#5bac75";
    brightYellow = "#b3904e";
    brightBlue = "#5a9ea2";
    brightMagenta = "#6797ae";
    brightCyan = "#39adb3";
    brightWhite = "#ecf4ee";
  };

  orange = "#9f713c";
  brightOrange = "#b2834e";
  cursor = "#478c90";

  tools = {
    bat = "ansi";
  };
}
