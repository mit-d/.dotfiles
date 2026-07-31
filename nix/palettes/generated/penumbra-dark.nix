# Penumbra Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/penumbra-dark.yaml
# Author: Zachary Weiss (https://github.com/zacharyweiss)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/penumbra-dark.nix. Edits here are lost on the
# next run.

{
  name = "penumbra-dark";
  displayName = "Penumbra Dark";
  author = "Zachary Weiss (https://github.com/zacharyweiss)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#24272b";
  surfaceDim = "#191b1f";
  surfaceBright = "#494d52";
  surfaceContainerLowest = "#191b1f";
  surfaceContainerLow = "#24272b";
  surfaceContainer = "#303338";
  surfaceContainerHigh = "#3c4045";
  surfaceContainerHighest = "#494d52";
  surfaceVariant = "#303338";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fffdfb";
  onSurface = "#bebebe";
  onSurfaceMuted = "#a6a6a6";
  onSurfaceVariant = "#8f8f8f";
  onSurfaceFaint = "#636363";

  # --- Borders and dividers -----------------------------------------------
  outline = "#646363";
  outlineVariant = "#3e4044";

  # --- Accent roles -------------------------------------------------------
  primary = "#5794d0";
  onPrimary = "#24272b";
  primaryContainer = "#384e65";
  onPrimaryContainer = "#fffdfb";
  secondary = "#00a2af";
  onSecondary = "#24272b";
  tertiary = "#9481cc";
  onTertiary = "#24262a";
  error = "#ca736c";
  onError = "#232529";
  inverseSurface = "#bebebe";
  inverseOnSurface = "#24272b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#303338";
    red = "#ca736c";
    green = "#47a477";
    yellow = "#8d9741";
    blue = "#5794d0";
    magenta = "#9481cc";
    cyan = "#00a2af";
    white = "#bebebe";
    brightBlack = "#636363";
    brightRed = "#de857e";
    brightGreen = "#5bb789";
    brightYellow = "#9faa54";
    brightBlue = "#69a7e4";
    brightMagenta = "#a693e0";
    brightCyan = "#2fb5c2";
    brightWhite = "#fffdfb";
  };

  orange = "#ba823a";
  brightOrange = "#ce944d";
  cursor = "#5794d0";

  tools = {
    bat = "ansi";
  };
}
