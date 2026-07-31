# Edge Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/edge-light.yaml
# Author: cjayross (https://github.com/cjayross), Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/edge-light.nix. Edits here are lost on the
# next run.

{
  name = "edge-light";
  displayName = "Edge Light";
  author = "cjayross (https://github.com/cjayross), Tinted Theming (https://github.com/tinted-theming)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fafafa";
  surfaceDim = "#ffffff";
  surfaceBright = "#bfc1c4";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fafafa";
  surfaceContainer = "#e3e5e8";
  surfaceContainerHigh = "#d1d3d6";
  surfaceContainerHighest = "#bfc1c4";
  surfaceVariant = "#e3e5e8";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#2e2e38";
  onSurface = "#474752";
  onSurfaceMuted = "#525560";
  onSurfaceVariant = "#5e646f";
  onSurfaceFaint = "#9197a1";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9197a1";
  outlineVariant = "#acb1b9";

  # --- Accent roles -------------------------------------------------------
  primary = "#6587bf";
  onPrimary = "#ffffff";
  primaryContainer = "#bfcee5";
  onPrimaryContainer = "#2e2e38";
  secondary = "#509c93";
  onSecondary = "#ffffff";
  tertiary = "#b870ce";
  onTertiary = "#ffffff";
  error = "#db7070";
  onError = "#ffffff";
  inverseSurface = "#474752";
  inverseOnSurface = "#fafafa";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e3e5e8";
    red = "#db7070";
    green = "#7c9f4b";
    yellow = "#ebcc1a";
    blue = "#6587bf";
    magenta = "#b870ce";
    cyan = "#509c93";
    white = "#474752";
    brightBlack = "#9197a1";
    brightRed = "#c65e5f";
    brightGreen = "#6a8c38";
    brightYellow = "#d6b900";
    brightBlue = "#5475ac";
    brightMagenta = "#a55eba";
    brightCyan = "#3d8a81";
    brightWhite = "#2e2e38";
  };

  orange = "#eba31a";
  brightOrange = "#d49100";
  cursor = "#6587bf";

  tools = {
    bat = "ansi";
  };
}
