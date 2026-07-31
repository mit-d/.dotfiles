# Chinoiserie -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/chinoiserie.yaml
# Author: Di Wang (https://cs.cmu.edu/~diw3)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/chinoiserie.nix. Edits here are lost on the
# next run.

{
  name = "chinoiserie";
  displayName = "Chinoiserie";
  author = "Di Wang (https://cs.cmu.edu/~diw3)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#bcbcbc";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#e0e0e0";
  surfaceContainerHigh = "#cecece";
  surfaceContainerHighest = "#bcbcbc";
  surfaceVariant = "#e0e0e0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#131124";
  onSurface = "#4a4035";
  onSurfaceMuted = "#6c5f53";
  onSurfaceVariant = "#918072";
  onSurfaceFaint = "#8b817a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#80766e";
  outlineVariant = "#d6d6d6";

  # --- Accent roles -------------------------------------------------------
  primary = "#815c94";
  onPrimary = "#ffffff";
  primaryContainer = "#cebfd6";
  onPrimaryContainer = "#131124";
  secondary = "#2b73af";
  onSecondary = "#ffffff";
  tertiary = "#c08eaf";
  onTertiary = "#131124";
  error = "#c04851";
  onError = "#ffffff";
  inverseSurface = "#4a4035";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e0e0e0";
    red = "#c04851";
    green = "#428675";
    yellow = "#d6a01d";
    blue = "#815c94";
    magenta = "#c08eaf";
    cyan = "#2b73af";
    white = "#4a4035";
    brightBlack = "#80766e";
    brightRed = "#ab3540";
    brightGreen = "#2f7464";
    brightYellow = "#c18e00";
    brightBlue = "#6f4b82";
    brightMagenta = "#ad7c9c";
    brightCyan = "#14619c";
    brightWhite = "#131124";
  };

  orange = "#fb8b05";
  brightOrange = "#e17b00";
  cursor = "#815c94";

  tools = {
    bat = "ansi";
  };
}
