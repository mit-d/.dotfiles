# Circus -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/circus.yaml
# Author: Stephan Boyer (https://github.com/stepchowfun) and Esther Wang (https://github.com/ewang12)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/circus.nix. Edits here are lost on the
# next run.

{
  name = "circus";
  displayName = "Circus";
  author = "Stephan Boyer (https://github.com/stepchowfun) and Esther Wang (https://github.com/ewang12)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#191919";
  surfaceDim = "#121212";
  surfaceBright = "#2f2f2f";
  surfaceContainerLowest = "#121212";
  surfaceContainerLow = "#191919";
  surfaceContainer = "#202020";
  surfaceContainerHigh = "#272727";
  surfaceContainerHighest = "#2f2f2f";
  surfaceVariant = "#202020";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#a7a7a7";
  onSurfaceMuted = "#7a7a7a";
  onSurfaceVariant = "#70706f";
  onSurfaceFaint = "#5f5a60";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5f5a60";
  outlineVariant = "#343434";

  # --- Accent roles -------------------------------------------------------
  primary = "#639ee4";
  onPrimary = "#191919";
  primaryContainer = "#35485f";
  onPrimaryContainer = "#ffffff";
  secondary = "#4bb1a7";
  onSecondary = "#191919";
  tertiary = "#b888e2";
  onTertiary = "#191919";
  error = "#dc657d";
  onError = "#191919";
  inverseSurface = "#a7a7a7";
  inverseOnSurface = "#191919";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#202020";
    red = "#dc657d";
    green = "#84b97c";
    yellow = "#c3ba63";
    blue = "#639ee4";
    magenta = "#b888e2";
    cyan = "#4bb1a7";
    white = "#a7a7a7";
    brightBlack = "#5f5a60";
    brightRed = "#f1788f";
    brightGreen = "#97cc8e";
    brightYellow = "#d6cd76";
    brightBlue = "#75b1f8";
    brightMagenta = "#cb9bf6";
    brightCyan = "#60c4ba";
    brightWhite = "#ffffff";
  };

  orange = "#4bb1a7";
  brightOrange = "#60c4ba";
  cursor = "#639ee4";

  tools = {
    bat = "ansi";
  };
}
