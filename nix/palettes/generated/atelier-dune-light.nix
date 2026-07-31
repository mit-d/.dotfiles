# Atelier Dune Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-dune-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-dune-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-dune-light";
  displayName = "Atelier Dune Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fefbec";
  surfaceDim = "#ffffff";
  surfaceBright = "#c4c0ac";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fefbec";
  surfaceContainer = "#e8e4cf";
  surfaceContainerHigh = "#d6d2bd";
  surfaceContainerHighest = "#c4c0ac";
  surfaceVariant = "#e8e4cf";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#20201d";
  onSurface = "#6e6b5e";
  onSurfaceMuted = "#757263";
  onSurfaceVariant = "#7d7a68";
  onSurfaceFaint = "#999580";

  # --- Borders and dividers -----------------------------------------------
  outline = "#999580";
  outlineVariant = "#a6a28c";

  # --- Accent roles -------------------------------------------------------
  primary = "#6684e1";
  onPrimary = "#20201d";
  primaryContainer = "#c1cfeb";
  onPrimaryContainer = "#20201d";
  secondary = "#1fad83";
  onSecondary = "#20201d";
  tertiary = "#b854d4";
  onTertiary = "#171614";
  error = "#d73737";
  onError = "#fefbec";
  inverseSurface = "#6e6b5e";
  inverseOnSurface = "#fefbec";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e8e4cf";
    red = "#d73737";
    green = "#60ac39";
    yellow = "#ae9513";
    blue = "#6684e1";
    magenta = "#b854d4";
    cyan = "#1fad83";
    white = "#6e6b5e";
    brightBlack = "#999580";
    brightRed = "#c11d24";
    brightGreen = "#4e9922";
    brightYellow = "#9a8300";
    brightBlue = "#5572cd";
    brightMagenta = "#a540c0";
    brightCyan = "#009972";
    brightWhite = "#20201d";
  };

  orange = "#b65611";
  brightOrange = "#9f4700";
  cursor = "#6684e1";

  tools = {
    bat = "ansi";
  };
}
