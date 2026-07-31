# Edge Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/edge-dark.yaml
# Author: cjayross (https://github.com/cjayross), Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/edge-dark.nix. Edits here are lost on the
# next run.

{
  name = "edge-dark";
  displayName = "Edge Dark";
  author = "cjayross (https://github.com/cjayross), Tinted Theming (https://github.com/tinted-theming)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#262729";
  surfaceDim = "#1b1c1e";
  surfaceBright = "#48494d";
  surfaceContainerLowest = "#1b1c1e";
  surfaceContainerLow = "#262729";
  surfaceContainer = "#313235";
  surfaceContainerHigh = "#3c3d41";
  surfaceContainerHighest = "#48494d";
  surfaceVariant = "#313235";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e4e5e6";
  onSurface = "#afb2b5";
  onSurfaceMuted = "#a2a5a9";
  onSurfaceVariant = "#95989d";
  onSurfaceFaint = "#595b5e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#626366";
  outlineVariant = "#3d3f42";

  # --- Accent roles -------------------------------------------------------
  primary = "#73b3e7";
  onPrimary = "#262729";
  primaryContainer = "#43586b";
  onPrimaryContainer = "#e4e5e6";
  secondary = "#5ebaa5";
  onSecondary = "#262729";
  tertiary = "#d390e7";
  onTertiary = "#262729";
  error = "#e77171";
  onError = "#262729";
  inverseSurface = "#afb2b5";
  inverseOnSurface = "#262729";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#313235";
    red = "#e77171";
    green = "#a1bf78";
    yellow = "#dbb774";
    blue = "#73b3e7";
    magenta = "#d390e7";
    cyan = "#5ebaa5";
    white = "#afb2b5";
    brightBlack = "#4a4c4f";
    brightRed = "#fc8483";
    brightGreen = "#b4d28b";
    brightYellow = "#efca87";
    brightBlue = "#86c6fb";
    brightMagenta = "#e7a3fb";
    brightCyan = "#72cdb8";
    brightWhite = "#e4e5e6";
  };

  orange = "#eba31a";
  brightOrange = "#ffb63c";
  cursor = "#73b3e7";

  tools = {
    bat = "ansi";
  };
}
