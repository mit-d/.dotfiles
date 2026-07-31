# Equilibrium Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/equilibrium-dark.yaml
# Author: Carlo Abelli
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/equilibrium-dark.nix. Edits here are lost on the
# next run.

{
  name = "equilibrium-dark";
  displayName = "Equilibrium Dark";
  author = "Carlo Abelli";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0c1118";
  surfaceDim = "#04070d";
  surfaceBright = "#30343b";
  surfaceContainerLowest = "#04070d";
  surfaceContainerLow = "#0c1118";
  surfaceContainer = "#181c22";
  surfaceContainerHigh = "#24282e";
  surfaceContainerHighest = "#30343b";
  surfaceVariant = "#181c22";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e7e2d9";
  onSurface = "#afaba2";
  onSurfaceMuted = "#a19d95";
  onSurfaceVariant = "#949088";
  onSurfaceFaint = "#7b776e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7b776e";
  outlineVariant = "#2b2f35";

  # --- Accent roles -------------------------------------------------------
  primary = "#008dd1";
  onPrimary = "#0c1118";
  primaryContainer = "#163c57";
  onPrimaryContainer = "#e7e2d9";
  secondary = "#00948b";
  onSecondary = "#0c1118";
  tertiary = "#6a7fd2";
  onTertiary = "#0c1118";
  error = "#f04339";
  onError = "#0c1118";
  inverseSurface = "#afaba2";
  inverseOnSurface = "#0c1118";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#181c22";
    red = "#f04339";
    green = "#7f8b00";
    yellow = "#bb8801";
    blue = "#008dd1";
    magenta = "#6a7fd2";
    cyan = "#00948b";
    white = "#afaba2";
    brightBlack = "#7b776e";
    brightRed = "#ff6254";
    brightGreen = "#919e26";
    brightYellow = "#ce9b2a";
    brightBlue = "#2ba0e5";
    brightMagenta = "#7b92e6";
    brightCyan = "#2ca79d";
    brightWhite = "#e7e2d9";
  };

  orange = "#df5923";
  brightOrange = "#f46c39";
  cursor = "#008dd1";

  tools = {
    bat = "ansi";
  };
}
