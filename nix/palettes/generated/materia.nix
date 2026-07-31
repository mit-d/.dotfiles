# Materia -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/materia.yaml
# Author: Defman21
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/materia.nix. Edits here are lost on the
# next run.

{
  name = "materia";
  displayName = "Materia";
  author = "Defman21";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#263238";
  surfaceDim = "#202b31";
  surfaceBright = "#3a474d";
  surfaceContainerLowest = "#202b31";
  surfaceContainerLow = "#263238";
  surfaceContainer = "#2c393f";
  surfaceContainerHigh = "#334046";
  surfaceContainerHighest = "#3a474d";
  surfaceVariant = "#2c393f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#cdd3de";
  onSurfaceMuted = "#cbcfd8";
  onSurfaceVariant = "#c9ccd3";
  onSurfaceFaint = "#707880";

  # --- Borders and dividers -----------------------------------------------
  outline = "#707880";
  outlineVariant = "#394950";

  # --- Accent roles -------------------------------------------------------
  primary = "#89ddff";
  onPrimary = "#263238";
  primaryContainer = "#4a6e7d";
  onPrimaryContainer = "#ffffff";
  secondary = "#80cbc4";
  onSecondary = "#263238";
  tertiary = "#82aaff";
  onTertiary = "#263238";
  error = "#ec5f67";
  onError = "#1f292f";
  inverseSurface = "#cdd3de";
  inverseOnSurface = "#263238";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2c393f";
    red = "#ec5f67";
    green = "#8bd649";
    yellow = "#ffcc00";
    blue = "#89ddff";
    magenta = "#82aaff";
    cyan = "#80cbc4";
    white = "#cdd3de";
    brightBlack = "#707880";
    brightRed = "#ff757a";
    brightGreen = "#9eea5f";
    brightYellow = "#ffe49a";
    brightBlue = "#beecff";
    brightMagenta = "#9fbfff";
    brightCyan = "#93dfd7";
    brightWhite = "#ffffff";
  };

  orange = "#ea9560";
  brightOrange = "#ffa873";
  cursor = "#89ddff";

  tools = {
    bat = "ansi";
  };
}
