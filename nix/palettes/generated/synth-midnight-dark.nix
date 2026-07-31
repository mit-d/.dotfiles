# Synth Midnight Terminal Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/synth-midnight-dark.yaml
# Author: Michael Ball (http://github.com/michael-ball/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/synth-midnight-dark.nix. Edits here are lost on the
# next run.

{
  name = "synth-midnight-dark";
  displayName = "Synth Midnight Terminal Dark";
  author = "Michael Ball (http://github.com/michael-ball/)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#050608";
  surfaceDim = "#010102";
  surfaceBright = "#353637";
  surfaceContainerLowest = "#010102";
  surfaceContainerLow = "#050608";
  surfaceContainer = "#1a1b1c";
  surfaceContainerHigh = "#272829";
  surfaceContainerHighest = "#353637";
  surfaceVariant = "#1a1b1c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#dddfe0";
  onSurface = "#c1c3c4";
  onSurfaceMuted = "#b2b4b5";
  onSurfaceVariant = "#a3a5a6";
  onSurfaceFaint = "#474849";

  # --- Borders and dividers -----------------------------------------------
  outline = "#4f5051";
  outlineVariant = "#28292a";

  # --- Accent roles -------------------------------------------------------
  primary = "#03aeff";
  onPrimary = "#050608";
  primaryContainer = "#143e59";
  onPrimaryContainer = "#dddfe0";
  secondary = "#42fff9";
  onSecondary = "#050608";
  tertiary = "#ea5ce2";
  onTertiary = "#050608";
  error = "#b53b50";
  onError = "#e4e5e6";
  inverseSurface = "#c1c3c4";
  inverseOnSurface = "#050608";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1a1b1c";
    red = "#b53b50";
    green = "#06ea61";
    yellow = "#c9d364";
    blue = "#03aeff";
    magenta = "#ea5ce2";
    cyan = "#42fff9";
    white = "#c1c3c4";
    brightBlack = "#474849";
    brightRed = "#ca4e61";
    brightGreen = "#3cff75";
    brightYellow = "#dce778";
    brightBlue = "#62c0ff";
    brightMagenta = "#ff70f6";
    brightCyan = "#d4fffc";
    brightWhite = "#dddfe0";
  };

  orange = "#ea770d";
  brightOrange = "#ff8a30";
  cursor = "#03aeff";

  tools = {
    bat = "ansi";
  };
}
