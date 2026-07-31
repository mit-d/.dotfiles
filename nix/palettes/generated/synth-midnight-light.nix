# Synth Midnight Terminal Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/synth-midnight-light.yaml
# Author: Michael Ball (http://github.com/michael-ball/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/synth-midnight-light.nix. Edits here are lost on the
# next run.

{
  name = "synth-midnight-light";
  displayName = "Synth Midnight Terminal Light";
  author = "Michael Ball (http://github.com/michael-ball/)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#dddfe0";
  surfaceDim = "#ebedee";
  surfaceBright = "#b4b6b6";
  surfaceContainerLowest = "#ebedee";
  surfaceContainerLow = "#dddfe0";
  surfaceContainer = "#cfd1d2";
  surfaceContainerHigh = "#c1c3c4";
  surfaceContainerHighest = "#b4b6b6";
  surfaceVariant = "#cfd1d2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#050608";
  onSurface = "#28292a";
  onSurfaceMuted = "#373839";
  onSurfaceVariant = "#474849";
  onSurfaceFaint = "#959798";

  # --- Borders and dividers -----------------------------------------------
  outline = "#8b8d8e";
  outlineVariant = "#bcbebf";

  # --- Accent roles -------------------------------------------------------
  primary = "#03aeff";
  onPrimary = "#050608";
  primaryContainer = "#a3ceee";
  onPrimaryContainer = "#050608";
  secondary = "#42fff9";
  onSecondary = "#050608";
  tertiary = "#ea5ce2";
  onTertiary = "#050608";
  error = "#b53b50";
  onError = "#e4e5e6";
  inverseSurface = "#28292a";
  inverseOnSurface = "#dddfe0";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#cfd1d2";
    red = "#b53b50";
    green = "#06ea61";
    yellow = "#c9d364";
    blue = "#03aeff";
    magenta = "#ea5ce2";
    cyan = "#42fff9";
    white = "#28292a";
    brightBlack = "#a3a5a6";
    brightRed = "#a02740";
    brightGreen = "#00d456";
    brightYellow = "#b6bf50";
    brightBlue = "#009be3";
    brightMagenta = "#d547ce";
    brightCyan = "#13ebe5";
    brightWhite = "#050608";
  };

  orange = "#ea770d";
  brightOrange = "#d06800";
  cursor = "#1486c4";

  tools = {
    bat = "ansi";
  };
}
