# Penumbra Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/penumbra-light.yaml
# Author: Zachary Weiss (https://github.com/zacharyweiss)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/penumbra-light.nix. Edits here are lost on the
# next run.

{
  name = "penumbra-light";
  displayName = "Penumbra Light";
  author = "Zachary Weiss (https://github.com/zacharyweiss)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fffdfb";
  surfaceDim = "#ffffff";
  surfaceBright = "#f0e8de";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fffdfb";
  surfaceContainer = "#fff7ed";
  surfaceContainerHigh = "#f8f0e6";
  surfaceContainerHighest = "#f0e8de";
  surfaceVariant = "#fff7ed";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#24272b";
  onSurface = "#636363";
  onSurfaceMuted = "#797979";
  onSurfaceVariant = "#888888";
  onSurfaceFaint = "#adaeae";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a2a3a3";
  outlineVariant = "#e2d7c7";

  # --- Accent roles -------------------------------------------------------
  primary = "#5794d0";
  onPrimary = "#24272b";
  primaryContainer = "#bfd5ec";
  onPrimaryContainer = "#24272b";
  secondary = "#00a2af";
  onSecondary = "#24272b";
  tertiary = "#9481cc";
  onTertiary = "#ffffff";
  error = "#ca736c";
  onError = "#ffffff";
  inverseSurface = "#636363";
  inverseOnSurface = "#fffdfb";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#fff7ed";
    red = "#ca736c";
    green = "#47a477";
    yellow = "#8d9741";
    blue = "#5794d0";
    magenta = "#9481cc";
    cyan = "#00a2af";
    white = "#636363";
    brightBlack = "#bebebe";
    brightRed = "#b6615b";
    brightGreen = "#329166";
    brightYellow = "#7b852d";
    brightBlue = "#4582bc";
    brightMagenta = "#826fb8";
    brightCyan = "#008e99";
    brightWhite = "#24272b";
  };

  orange = "#ba823a";
  brightOrange = "#a77025";
  cursor = "#5794d0";

  tools = {
    bat = "ansi";
  };
}
