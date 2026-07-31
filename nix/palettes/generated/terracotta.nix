# Terracotta -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/terracotta.yaml
# Author: Alexander Rossell Hayes (https://github.com/rossellhayes)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/terracotta.nix. Edits here are lost on the
# next run.

{
  name = "terracotta";
  displayName = "Terracotta";
  author = "Alexander Rossell Hayes (https://github.com/rossellhayes)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#efeae8";
  surfaceDim = "#fffdfc";
  surfaceBright = "#bbb3ae";
  surfaceContainerLowest = "#fffdfc";
  surfaceContainerLow = "#efeae8";
  surfaceContainer = "#dfd6d1";
  surfaceContainerHigh = "#cdc4bf";
  surfaceContainerHighest = "#bbb3ae";
  surfaceVariant = "#dfd6d1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#241c19";
  onSurface = "#473731";
  onSurfaceMuted = "#503e37";
  onSurfaceVariant = "#59453d";
  onSurfaceFaint = "#af9c95";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a4928b";
  outlineVariant = "#d0c1bb";

  # --- Accent roles -------------------------------------------------------
  primary = "#625574";
  onPrimary = "#efeae8";
  primaryContainer = "#b7afbb";
  onPrimaryContainer = "#241c19";
  secondary = "#847f9e";
  onSecondary = "#ffffff";
  tertiary = "#8d5968";
  onTertiary = "#efeae8";
  error = "#a75045";
  onError = "#efeae8";
  inverseSurface = "#473731";
  inverseOnSurface = "#efeae8";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#dfd6d1";
    red = "#a75045";
    green = "#7a894a";
    yellow = "#ce943e";
    blue = "#625574";
    magenta = "#8d5968";
    cyan = "#847f9e";
    white = "#473731";
    brightBlack = "#c0aca4";
    brightRed = "#933e34";
    brightGreen = "#697738";
    brightYellow = "#ba8228";
    brightBlue = "#514563";
    brightMagenta = "#7b4857";
    brightCyan = "#726d8c";
    brightWhite = "#241c19";
  };

  orange = "#bd6942";
  brightOrange = "#a95730";
  cursor = "#625574";

  tools = {
    bat = "ansi";
  };
}
