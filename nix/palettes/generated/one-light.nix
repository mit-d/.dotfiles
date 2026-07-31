# One Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/one-light.yaml
# Author: Daniel Pfeifer (http://github.com/purpleKarrot)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/one-light.nix. Edits here are lost on the
# next run.

{
  name = "one-light";
  displayName = "One Light";
  author = "Daniel Pfeifer (http://github.com/purpleKarrot)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fafafa";
  surfaceDim = "#ffffff";
  surfaceBright = "#dcdcdd";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fafafa";
  surfaceContainer = "#f0f0f1";
  surfaceContainerHigh = "#e6e6e7";
  surfaceContainerHighest = "#dcdcdd";
  surfaceVariant = "#f0f0f1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#090a0b";
  onSurface = "#383a42";
  onSurfaceMuted = "#50525c";
  onSurfaceVariant = "#696c77";
  onSurfaceFaint = "#a0a1a7";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9fa0a5";
  outlineVariant = "#d5d5d7";

  # --- Accent roles -------------------------------------------------------
  primary = "#4078f2";
  onPrimary = "#090a0b";
  primaryContainer = "#b2cbfb";
  onPrimaryContainer = "#090a0b";
  secondary = "#0184bc";
  onSecondary = "#090a0b";
  tertiary = "#a626a4";
  onTertiary = "#fafafa";
  error = "#ca1243";
  onError = "#fafafa";
  inverseSurface = "#383a42";
  inverseOnSurface = "#fafafa";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f0f0f1";
    red = "#ca1243";
    green = "#50a14f";
    yellow = "#c18401";
    blue = "#4078f2";
    magenta = "#a626a4";
    cyan = "#0184bc";
    white = "#383a42";
    brightBlack = "#a0a1a7";
    brightRed = "#af0036";
    brightGreen = "#3d8e3d";
    brightYellow = "#aa7400";
    brightBlue = "#2f65dd";
    brightMagenta = "#920391";
    brightCyan = "#0071a2";
    brightWhite = "#090a0b";
  };

  orange = "#d75f00";
  brightOrange = "#bc5200";
  cursor = "#4078f2";

  tools = {
    bat = "ansi";
  };
}
