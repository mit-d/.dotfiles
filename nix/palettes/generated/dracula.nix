# Dracula -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/dracula.yaml
# Author: clach04 (https://github.com/clach04)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/dracula.nix. Edits here are lost on the
# next run.

{
  name = "dracula";
  displayName = "Dracula";
  author = "clach04 (https://github.com/clach04)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#282a36";
  surfaceDim = "#20222e";
  surfaceBright = "#31323d";
  surfaceContainerLowest = "#20222e";
  surfaceContainerLow = "#282a36";
  surfaceContainer = "#21222c";
  surfaceContainerHigh = "#292a34";
  surfaceContainerHighest = "#31323d";
  surfaceVariant = "#21222c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#f8f8f2";
  onSurfaceMuted = "#cacfdd";
  onSurfaceVariant = "#9ea8c7";
  onSurfaceFaint = "#6272a4";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6272a4";
  outlineVariant = "#44475a";

  # --- Accent roles -------------------------------------------------------
  primary = "#bd93f9";
  onPrimary = "#282a36";
  primaryContainer = "#5c507a";
  onPrimaryContainer = "#ffffff";
  secondary = "#8be9fd";
  onSecondary = "#282a36";
  tertiary = "#ff79c6";
  onTertiary = "#282a36";
  error = "#ff5555";
  onError = "#282a36";
  inverseSurface = "#f8f8f2";
  inverseOnSurface = "#282a36";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#21222c";
    red = "#ff5555";
    green = "#50fa7b";
    yellow = "#f1fa8c";
    blue = "#bd93f9";
    magenta = "#ff79c6";
    cyan = "#8be9fd";
    white = "#f8f8f2";
    brightBlack = "#6272a4";
    brightRed = "#ff7f79";
    brightGreen = "#afffba";
    brightYellow = "#ffffff";
    brightBlue = "#cdacff";
    brightMagenta = "#ff9fd3";
    brightCyan = "#c9f5ff";
    brightWhite = "#ffffff";
  };

  orange = "#ffb86c";
  brightOrange = "#ffd3a7";
  cursor = "#bd93f9";

  tools = {
    bat = "Dracula";
  };
}
