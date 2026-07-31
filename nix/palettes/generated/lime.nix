# lime -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/lime.yaml
# Author: limelier
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/lime.nix. Edits here are lost on the
# next run.

{
  name = "lime";
  displayName = "lime";
  author = "limelier";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1a1a2f";
  surfaceDim = "#151529";
  surfaceBright = "#2b2b3b";
  surfaceContainerLowest = "#151529";
  surfaceContainerLow = "#1a1a2f";
  surfaceContainer = "#202030";
  surfaceContainerHigh = "#252536";
  surfaceContainerHighest = "#2b2b3b";
  surfaceVariant = "#202030";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fff8e1";
  onSurface = "#848477";
  onSurfaceMuted = "#7b7b75";
  onSurfaceVariant = "#727171";
  onSurfaceFaint = "#52525b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5b5a62";
  outlineVariant = "#343447";

  # --- Accent roles -------------------------------------------------------
  primary = "#2b926f";
  onPrimary = "#18182d";
  primaryContainer = "#264548";
  onPrimaryContainer = "#fff8e1";
  secondary = "#4cad83";
  onSecondary = "#1a1a2f";
  tertiary = "#1b825f";
  onTertiary = "#fff9e3";
  error = "#ff662a";
  onError = "#1a1a2f";
  inverseSurface = "#848477";
  inverseOnSurface = "#1a1a2f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#202030";
    red = "#ff662a";
    green = "#8cd97c";
    yellow = "#ffd15e";
    blue = "#2b926f";
    magenta = "#1b825f";
    cyan = "#4cad83";
    white = "#818175";
    brightBlack = "#313140";
    brightRed = "#ff8c64";
    brightGreen = "#9fed8f";
    brightYellow = "#ffe9b6";
    brightBlue = "#42a581";
    brightMagenta = "#349470";
    brightCyan = "#60c095";
    brightWhite = "#fff8e1";
  };

  orange = "#ff773a";
  brightOrange = "#ff9970";
  cursor = "#2b926f";

  tools = {
    bat = "ansi";
  };
}
