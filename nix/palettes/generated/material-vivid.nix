# Material Vivid -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/material-vivid.yaml
# Author: joshyrobot
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/material-vivid.nix. Edits here are lost on the
# next run.

{
  name = "material-vivid";
  displayName = "Material Vivid";
  author = "joshyrobot";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#202124";
  surfaceDim = "#19191c";
  surfaceBright = "#37393c";
  surfaceContainerLowest = "#19191c";
  surfaceContainerLow = "#202124";
  surfaceContainer = "#27292c";
  surfaceContainerHigh = "#2f3134";
  surfaceContainerHighest = "#37393c";
  surfaceVariant = "#27292c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#83888d";
  onSurfaceMuted = "#7a8084";
  onSurfaceVariant = "#71767a";
  onSurfaceFaint = "#55565d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5d5f65";
  outlineVariant = "#363a3c";

  # --- Accent roles -------------------------------------------------------
  primary = "#2196f3";
  onPrimary = "#202124";
  primaryContainer = "#2b4b6c";
  onPrimaryContainer = "#ffffff";
  secondary = "#00bcd4";
  onSecondary = "#202124";
  tertiary = "#673ab7";
  onTertiary = "#ffffff";
  error = "#f44336";
  onError = "#1e1e21";
  inverseSurface = "#83888d";
  inverseOnSurface = "#202124";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#27292c";
    red = "#f44336";
    green = "#00e676";
    yellow = "#ffeb3b";
    blue = "#2196f3";
    magenta = "#673ab7";
    cyan = "#00bcd4";
    white = "#80868b";
    brightBlack = "#44464d";
    brightRed = "#ff6756";
    brightGreen = "#3afa89";
    brightYellow = "#fffde4";
    brightBlue = "#4baaff";
    brightMagenta = "#784dcb";
    brightCyan = "#34d0e8";
    brightWhite = "#ffffff";
  };

  orange = "#ff9800";
  brightOrange = "#ffb66e";
  cursor = "#2196f3";

  tools = {
    bat = "ansi";
  };
}
