# Github Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/github-dark.yaml
# Author: Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/github-dark.nix. Edits here are lost on the
# next run.

{
  name = "github-dark";
  displayName = "Github Dark";
  author = "Tinted Theming (https://github.com/tinted-theming)";
  variant = "dark";
  version = "3.1.0";

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
  secondary = "#7ee787";
  onSecondary = "#0d1117";
  tertiary = "#ff7b72";
  onTertiary = "#0d1117";
  error = "#ffa657";
  onError = "#0d1117";
  inverseSurface = "#c9d1d9";
  inverseOnSurface = "#0d1117";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#161b22";
    red = "#ffa657";
    green = "#a5d6ff";
    yellow = "#bb8009";
    blue = "#d2a8ff";
    magenta = "#ff7b72";
    cyan = "#7ee787";
    white = "#c9d1d9";
    brightBlack = "#6e7681";
    brightRed = "#ffc291";
    brightGreen = "#cce7ff";
    brightYellow = "#cf932c";
    brightBlue = "#dfc3ff";
    brightMagenta = "#ff9d94";
    brightCyan = "#92fb9a";
    brightWhite = "#ffffff";
  };

  orange = "#79c0ff";
  brightOrange = "#a1d2ff";
  cursor = "#d2a8ff";

  tools = {
    bat = "ansi";
  };
}
