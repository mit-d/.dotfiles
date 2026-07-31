# Solarized Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/solarized-dark.yaml
# Author: Ethan Schoonover (modified by aramisgithub)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/solarized-dark.nix. Edits here are lost on the
# next run.

{
  name = "solarized-dark";
  displayName = "Solarized Dark";
  author = "Ethan Schoonover (modified by aramisgithub)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#002b36";
  surfaceDim = "#002029";
  surfaceBright = "#214c59";
  surfaceContainerLowest = "#002029";
  surfaceContainerLow = "#002b36";
  surfaceContainer = "#073642";
  surfaceContainerHigh = "#15414d";
  surfaceContainerHighest = "#214c59";
  surfaceVariant = "#073642";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fdf6e3";
  onSurface = "#93a1a1";
  onSurfaceMuted = "#8b9a9b";
  onSurfaceVariant = "#839496";
  onSurfaceFaint = "#657b83";

  # --- Borders and dividers -----------------------------------------------
  outline = "#657b83";
  outlineVariant = "#586e75";

  # --- Accent roles -------------------------------------------------------
  primary = "#268bd2";
  onPrimary = "#ffffff";
  primaryContainer = "#0a4d6d";
  onPrimaryContainer = "#fdf6e3";
  secondary = "#2aa198";
  onSecondary = "#002b36";
  tertiary = "#6c71c4";
  onTertiary = "#ffffff";
  error = "#dc322f";
  onError = "#fefcf5";
  inverseSurface = "#93a1a1";
  inverseOnSurface = "#002b36";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#073642";
    red = "#dc322f";
    green = "#859900";
    yellow = "#b58900";
    blue = "#268bd2";
    magenta = "#6c71c4";
    cyan = "#2aa198";
    white = "#93a1a1";
    brightBlack = "#657b83";
    brightRed = "#f24942";
    brightGreen = "#97ac29";
    brightYellow = "#c89c29";
    brightBlue = "#3d9ee6";
    brightMagenta = "#7d83d8";
    brightCyan = "#43b4ab";
    brightWhite = "#fdf6e3";
  };

  orange = "#cb4b16";
  brightOrange = "#e05e2e";
  cursor = "#268bd2";

  tools = {
    bat = "Solarized (dark)";
  };
}
