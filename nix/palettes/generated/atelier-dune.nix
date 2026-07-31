# Atelier Dune -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-dune.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-dune.nix. Edits here are lost on the
# next run.

{
  name = "atelier-dune";
  displayName = "Atelier Dune";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#20201d";
  surfaceDim = "#181815";
  surfaceBright = "#3a3935";
  surfaceContainerLowest = "#181815";
  surfaceContainerLow = "#20201d";
  surfaceContainer = "#292824";
  surfaceContainerHigh = "#31302c";
  surfaceContainerHighest = "#3a3935";
  surfaceVariant = "#292824";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fefbec";
  onSurface = "#a6a28c";
  onSurfaceMuted = "#9f9b86";
  onSurfaceVariant = "#999580";
  onSurfaceFaint = "#7d7a68";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7d7a68";
  outlineVariant = "#6e6b5e";

  # --- Accent roles -------------------------------------------------------
  primary = "#6684e1";
  onPrimary = "#20201d";
  primaryContainer = "#394461";
  onPrimaryContainer = "#fefbec";
  secondary = "#1fad83";
  onSecondary = "#20201d";
  tertiary = "#b854d4";
  onTertiary = "#171614";
  error = "#d73737";
  onError = "#fefbec";
  inverseSurface = "#a6a28c";
  inverseOnSurface = "#20201d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#292824";
    red = "#d73737";
    green = "#60ac39";
    yellow = "#ae9513";
    blue = "#6684e1";
    magenta = "#b854d4";
    cyan = "#1fad83";
    white = "#a6a28c";
    brightBlack = "#7d7a68";
    brightRed = "#ed4d49";
    brightGreen = "#72bf4d";
    brightYellow = "#c1a832";
    brightBlue = "#7797f5";
    brightMagenta = "#cc67e8";
    brightCyan = "#3dc095";
    brightWhite = "#fefbec";
  };

  orange = "#b65611";
  brightOrange = "#ca682b";
  cursor = "#6684e1";

  tools = {
    bat = "ansi";
  };
}
