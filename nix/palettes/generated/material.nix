# Material -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/material.yaml
# Author: Nate Peterson
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/material.nix. Edits here are lost on the
# next run.

{
  name = "material";
  displayName = "Material";
  author = "Nate Peterson";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#263238";
  surfaceDim = "#1d292e";
  surfaceBright = "#425058";
  surfaceContainerLowest = "#1d292e";
  surfaceContainerLow = "#263238";
  surfaceContainer = "#2e3c43";
  surfaceContainerHigh = "#38464d";
  surfaceContainerHighest = "#425058";
  surfaceVariant = "#2e3c43";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#eeffff";
  onSurfaceMuted = "#d0e5ea";
  onSurfaceVariant = "#b2ccd6";
  onSurfaceFaint = "#546e7a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#56707b";
  outlineVariant = "#364a4d";

  # --- Accent roles -------------------------------------------------------
  primary = "#82aaff";
  onPrimary = "#263238";
  primaryContainer = "#475d7e";
  onPrimaryContainer = "#ffffff";
  secondary = "#89ddff";
  onSecondary = "#263238";
  tertiary = "#c792ea";
  onTertiary = "#263238";
  error = "#f07178";
  onError = "#263238";
  inverseSurface = "#eeffff";
  inverseOnSurface = "#263238";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2e3c43";
    red = "#f07178";
    green = "#c3e88d";
    yellow = "#ffcb6b";
    blue = "#82aaff";
    magenta = "#c792ea";
    cyan = "#89ddff";
    white = "#eeffff";
    brightBlack = "#546e7a";
    brightRed = "#ff898e";
    brightGreen = "#d6fca0";
    brightYellow = "#ffe4b5";
    brightBlue = "#9fbfff";
    brightMagenta = "#dba5fe";
    brightCyan = "#beecff";
    brightWhite = "#ffffff";
  };

  orange = "#f78c6c";
  brightOrange = "#ffa78c";
  cursor = "#82aaff";

  tools = {
    bat = "ansi";
  };
}
