# Spaceduck -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/spaceduck.yaml
# Author: Guillermo Rodriguez (https://github.com/pineapplegiant), packaged by Gabriel Fontes (https://github.com/Misterio77)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/spaceduck.nix. Edits here are lost on the
# next run.

{
  name = "spaceduck";
  displayName = "Spaceduck";
  author = "Guillermo Rodriguez (https://github.com/pineapplegiant), packaged by Gabriel Fontes (https://github.com/Misterio77)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#16172d";
  surfaceDim = "#111127";
  surfaceBright = "#262843";
  surfaceContainerLowest = "#111127";
  surfaceContainerLow = "#16172d";
  surfaceContainer = "#1b1c36";
  surfaceContainerHigh = "#20223c";
  surfaceContainerHighest = "#262843";
  surfaceVariant = "#1b1c36";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#ecf0c1";
  onSurfaceMuted = "#b5b9ad";
  onSurfaceVariant = "#818596";
  onSurfaceFaint = "#686f9a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#686f9a";
  outlineVariant = "#30365f";

  # --- Accent roles -------------------------------------------------------
  primary = "#7a5ccc";
  onPrimary = "#ffffff";
  primaryContainer = "#393065";
  onPrimaryContainer = "#ffffff";
  secondary = "#00a3cc";
  onSecondary = "#16172d";
  tertiary = "#b3a1e6";
  onTertiary = "#16172d";
  error = "#e33400";
  onError = "#ffffff";
  inverseSurface = "#ecf0c1";
  inverseOnSurface = "#16172d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1b1c36";
    red = "#e33400";
    green = "#5ccc96";
    yellow = "#f2ce00";
    blue = "#7a5ccc";
    magenta = "#b3a1e6";
    cyan = "#00a3cc";
    white = "#ecf0c1";
    brightBlack = "#686f9a";
    brightRed = "#f94c24";
    brightGreen = "#71e0a9";
    brightYellow = "#ffe36c";
    brightBlue = "#8b6ee0";
    brightMagenta = "#c6b4fa";
    brightCyan = "#2fb6e0";
    brightWhite = "#ffffff";
  };

  orange = "#e39400";
  brightOrange = "#f7a72e";
  cursor = "#7a5ccc";

  tools = {
    bat = "ansi";
  };
}
