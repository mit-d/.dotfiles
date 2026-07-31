# Apathy -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/apathy.yaml
# Author: Jannik Siebert (https://github.com/janniks)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/apathy.nix. Edits here are lost on the
# next run.

{
  name = "apathy";
  displayName = "Apathy";
  author = "Jannik Siebert (https://github.com/janniks)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#031a16";
  surfaceDim = "#000d0a";
  surfaceBright = "#2b5149";
  surfaceContainerLowest = "#000d0a";
  surfaceContainerLow = "#031a16";
  surfaceContainer = "#0b342d";
  surfaceContainerHigh = "#1b423b";
  surfaceContainerHighest = "#2b5149";
  surfaceVariant = "#0b342d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d2e7e4";
  onSurface = "#81b5ac";
  onSurfaceMuted = "#70a89f";
  onSurfaceVariant = "#5f9c92";
  onSurfaceFaint = "#2b685e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#2b685e";
  outlineVariant = "#184e45";

  # --- Accent roles -------------------------------------------------------
  primary = "#96883e";
  onPrimary = "#031a16";
  primaryContainer = "#384127";
  onPrimaryContainer = "#d2e7e4";
  secondary = "#963e4c";
  onSecondary = "#d2e7e4";
  tertiary = "#4c963e";
  onTertiary = "#031a16";
  error = "#3e9688";
  onError = "#031a16";
  inverseSurface = "#81b5ac";
  inverseOnSurface = "#031a16";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#0b342d";
    red = "#3e9688";
    green = "#883e96";
    yellow = "#3e4c96";
    blue = "#96883e";
    magenta = "#4c963e";
    cyan = "#963e4c";
    white = "#81b5ac";
    brightBlack = "#2b685e";
    brightRed = "#52a99a";
    brightGreen = "#9b50a9";
    brightYellow = "#4e5da9";
    brightBlue = "#a89a51";
    brightMagenta = "#5ea950";
    brightCyan = "#aa505d";
    brightWhite = "#d2e7e4";
  };

  orange = "#3e7996";
  brightOrange = "#508ba9";
  cursor = "#96883e";

  tools = {
    bat = "ansi";
  };
}
