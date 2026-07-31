# Material Palenight -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/material-palenight.yaml
# Author: Nate Peterson
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/material-palenight.nix. Edits here are lost on the
# next run.

{
  name = "material-palenight";
  displayName = "Material Palenight";
  author = "Nate Peterson";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#292d3e";
  surfaceDim = "#1c2030";
  surfaceBright = "#626088";
  surfaceContainerLowest = "#1c2030";
  surfaceContainerLow = "#292d3e";
  surfaceContainer = "#444267";
  surfaceContainerHigh = "#535177";
  surfaceContainerHighest = "#626088";
  surfaceVariant = "#444267";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#959dcb";
  onSurfaceMuted = "#8e9abd";
  onSurfaceVariant = "#8796b0";
  onSurfaceFaint = "#676e95";

  # --- Borders and dividers -----------------------------------------------
  outline = "#676e95";
  outlineVariant = "#3f4359";

  # --- Accent roles -------------------------------------------------------
  primary = "#82aaff";
  onPrimary = "#292d3e";
  primaryContainer = "#495982";
  onPrimaryContainer = "#ffffff";
  secondary = "#89ddff";
  onSecondary = "#292d3e";
  tertiary = "#c792ea";
  onTertiary = "#292d3e";
  error = "#f07178";
  onError = "#292d3e";
  inverseSurface = "#959dcb";
  inverseOnSurface = "#292d3e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#444267";
    red = "#f07178";
    green = "#c3e88d";
    yellow = "#ffcb6b";
    blue = "#82aaff";
    magenta = "#c792ea";
    cyan = "#89ddff";
    white = "#959dcb";
    brightBlack = "#676e95";
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
