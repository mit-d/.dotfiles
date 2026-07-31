# Helios -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/helios.yaml
# Author: Alex Meyer (https://github.com/reyemxela)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/helios.nix. Edits here are lost on the
# next run.

{
  name = "helios";
  displayName = "Helios";
  author = "Alex Meyer (https://github.com/reyemxela)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1d2021";
  surfaceDim = "#111314";
  surfaceBright = "#555a5c";
  surfaceContainerLowest = "#111314";
  surfaceContainerLow = "#1d2021";
  surfaceContainer = "#383c3e";
  surfaceContainerHigh = "#464b4d";
  surfaceContainerHighest = "#555a5c";
  surfaceVariant = "#383c3e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e5e5e5";
  onSurface = "#d5d5d5";
  onSurfaceMuted = "#d1d1d1";
  onSurfaceVariant = "#cdcdcd";
  onSurfaceFaint = "#6f7579";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6f7579";
  outlineVariant = "#53585b";

  # --- Accent roles -------------------------------------------------------
  primary = "#1e8bac";
  onPrimary = "#ffffff";
  primaryContainer = "#264652";
  onPrimaryContainer = "#e5e5e5";
  secondary = "#1ba595";
  onSecondary = "#1d2021";
  tertiary = "#be4264";
  onTertiary = "#f2f2f2";
  error = "#d72638";
  onError = "#f3f3f3";
  inverseSurface = "#d5d5d5";
  inverseOnSurface = "#1d2021";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#383c3e";
    red = "#d72638";
    green = "#88b92d";
    yellow = "#f19d1a";
    blue = "#1e8bac";
    magenta = "#be4264";
    cyan = "#1ba595";
    white = "#d5d5d5";
    brightBlack = "#6f7579";
    brightRed = "#ed3f4a";
    brightGreen = "#9acd45";
    brightYellow = "#ffb352";
    brightBlue = "#389ebf";
    brightMagenta = "#d35575";
    brightCyan = "#3ab8a7";
    brightWhite = "#e5e5e5";
  };

  orange = "#eb8413";
  brightOrange = "#ff9836";
  cursor = "#1e8bac";

  tools = {
    bat = "ansi";
  };
}
