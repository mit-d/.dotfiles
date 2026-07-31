# Brewer -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/brewer.yaml
# Author: Timothee Poisot (http://github.com/tpoisot)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/brewer.nix. Edits here are lost on the
# next run.

{
  name = "brewer";
  displayName = "Brewer";
  author = "Timothee Poisot (http://github.com/tpoisot)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0c0d0e";
  surfaceDim = "#030404";
  surfaceBright = "#4b4c4d";
  surfaceContainerLowest = "#030404";
  surfaceContainerLow = "#0c0d0e";
  surfaceContainer = "#2e2f30";
  surfaceContainerHigh = "#3c3d3e";
  surfaceContainerHighest = "#4b4c4d";
  surfaceVariant = "#2e2f30";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fcfdfe";
  onSurface = "#b7b8b9";
  onSurfaceMuted = "#a6a7a8";
  onSurfaceVariant = "#959697";
  onSurfaceFaint = "#737475";

  # --- Borders and dividers -----------------------------------------------
  outline = "#737475";
  outlineVariant = "#515253";

  # --- Accent roles -------------------------------------------------------
  primary = "#3182bd";
  onPrimary = "#0c0d0e";
  primaryContainer = "#1d3549";
  onPrimaryContainer = "#fcfdfe";
  secondary = "#80b1d3";
  onSecondary = "#0c0d0e";
  tertiary = "#756bb1";
  onTertiary = "#fcfdfe";
  error = "#e31a1c";
  onError = "#fcfdfe";
  inverseSurface = "#b7b8b9";
  inverseOnSurface = "#0c0d0e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2e2f30";
    red = "#e31a1c";
    green = "#31a354";
    yellow = "#dca060";
    blue = "#3182bd";
    magenta = "#756bb1";
    cyan = "#80b1d3";
    white = "#b7b8b9";
    brightBlack = "#737475";
    brightRed = "#f93932";
    brightGreen = "#48b666";
    brightYellow = "#f0b373";
    brightBlue = "#4594d1";
    brightMagenta = "#867dc4";
    brightCyan = "#93c4e7";
    brightWhite = "#fcfdfe";
  };

  orange = "#e6550d";
  brightOrange = "#fc692c";
  cursor = "#3182bd";

  tools = {
    bat = "ansi";
  };
}
