# Github Dark Colorblind -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/github-dark-colorblind.yaml
# Author: Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/github-dark-colorblind.nix. Edits here are lost on the
# next run.

{
  name = "github-dark-colorblind";
  displayName = "Github Dark Colorblind";
  author = "Tinted Theming (https://github.com/tinted-theming)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0d1117";
  surfaceDim = "#05080d";
  surfaceBright = "#2b3038";
  surfaceContainerLowest = "#05080d";
  surfaceContainerLow = "#0d1117";
  surfaceContainer = "#161b22";
  surfaceContainerHigh = "#20252d";
  surfaceContainerHighest = "#2b3038";
  surfaceVariant = "#161b22";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#c9d1d9";
  onSurfaceMuted = "#a9b2bb";
  onSurfaceVariant = "#8b949e";
  onSurfaceFaint = "#6e7681";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6e7681";
  outlineVariant = "#484f58";

  # --- Accent roles -------------------------------------------------------
  primary = "#d2a8ff";
  onPrimary = "#0d1117";
  primaryContainer = "#4f4565";
  onPrimaryContainer = "#ffffff";
  secondary = "#a5d6ff";
  onSecondary = "#0d1117";
  tertiary = "#ec8e2c";
  onTertiary = "#0d1117";
  error = "#fdac54";
  onError = "#0d1117";
  inverseSurface = "#c9d1d9";
  inverseOnSurface = "#0d1117";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#161b22";
    red = "#fdac54";
    green = "#a5d6ff";
    yellow = "#bb8009";
    blue = "#d2a8ff";
    magenta = "#ec8e2c";
    cyan = "#a5d6ff";
    white = "#c9d1d9";
    brightBlack = "#6e7681";
    brightRed = "#ffc790";
    brightGreen = "#cce7ff";
    brightYellow = "#cf932c";
    brightBlue = "#dfc3ff";
    brightMagenta = "#ffa249";
    brightCyan = "#cce7ff";
    brightWhite = "#ffffff";
  };

  orange = "#79c0ff";
  brightOrange = "#a1d2ff";
  cursor = "#d2a8ff";

  tools = {
    bat = "ansi";
  };
}
