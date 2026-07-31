# UwUnicorn -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/uwunicorn.yaml
# Author: Fernando Marques (https://github.com/RakkiUwU) and Gabriel Fontes (https://github.com/Misterio77)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/uwunicorn.nix. Edits here are lost on the
# next run.

{
  name = "uwunicorn";
  displayName = "UwUnicorn";
  author = "Fernando Marques (https://github.com/RakkiUwU) and Gabriel Fontes (https://github.com/Misterio77)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#241b26";
  surfaceDim = "#170f19";
  surfaceBright = "#4c465d";
  surfaceContainerLowest = "#170f19";
  surfaceContainerLow = "#241b26";
  surfaceContainer = "#2f2a3f";
  surfaceContainerHigh = "#3d384e";
  surfaceContainerHighest = "#4c465d";
  surfaceVariant = "#2f2a3f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ead7da";
  onSurface = "#eed5d9";
  onSurfaceMuted = "#b498ad";
  onSurfaceVariant = "#87698a";
  onSurfaceFaint = "#6c3cb2";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7043b4";
  outlineVariant = "#46354a";

  # --- Accent roles -------------------------------------------------------
  primary = "#6a9eb5";
  onPrimary = "#241b26";
  primaryContainer = "#3f4958";
  onPrimaryContainer = "#ead7da";
  secondary = "#9c5fce";
  onSecondary = "#140d15";
  tertiary = "#78a38f";
  onTertiary = "#241b26";
  error = "#877bb6";
  onError = "#211923";
  inverseSurface = "#eed5d9";
  inverseOnSurface = "#241b26";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2f2a3f";
    red = "#877bb6";
    green = "#c965bf";
    yellow = "#a84a73";
    blue = "#6a9eb5";
    magenta = "#78a38f";
    cyan = "#9c5fce";
    white = "#eed5d9";
    brightBlack = "#6c3cb2";
    brightRed = "#998dc9";
    brightGreen = "#dd78d3";
    brightYellow = "#bc5c85";
    brightBlue = "#7cb1c8";
    brightMagenta = "#8ab6a1";
    brightCyan = "#af72e2";
    brightWhite = "#ead7da";
  };

  orange = "#de5b44";
  brightOrange = "#f36e56";
  cursor = "#6a9eb5";

  tools = {
    bat = "ansi";
  };
}
