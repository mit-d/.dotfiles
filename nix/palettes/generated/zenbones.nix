# Zenbones -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/zenbones.yaml
# Author: mcchrish
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/zenbones.nix. Edits here are lost on the
# next run.

{
  name = "zenbones";
  displayName = "Zenbones";
  author = "mcchrish";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#191919";
  surfaceDim = "#0d0d0d";
  surfaceBright = "#ff94a0";
  surfaceContainerLowest = "#0d0d0d";
  surfaceContainerLow = "#191919";
  surfaceContainer = "#de6e7c";
  surfaceContainerHigh = "#f17f8c";
  surfaceContainerHighest = "#ff94a0";
  surfaceVariant = "#de6e7c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#bbbbbb";
  onSurface = "#b279a7";
  onSurfaceMuted = "#8b87ae";
  onSurfaceVariant = "#5c91b5";
  onSurfaceFaint = "#b67e64";

  # --- Borders and dividers -----------------------------------------------
  outline = "#b77e64";
  outlineVariant = "#819b69";

  # --- Accent roles -------------------------------------------------------
  primary = "#cf86c1";
  onPrimary = "#191919";
  primaryContainer = "#584053";
  onPrimaryContainer = "#bbbbbb";
  secondary = "#61abda";
  onSecondary = "#191919";
  tertiary = "#65b8c1";
  onTertiary = "#191919";
  error = "#3d3839";
  onError = "#bbbbbb";
  inverseSurface = "#b279a7";
  inverseOnSurface = "#191919";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#de6e7c";
    red = "#3d3839";
    green = "#d68c67";
    yellow = "#8bae68";
    blue = "#cf86c1";
    magenta = "#65b8c1";
    cyan = "#61abda";
    white = "#b279a7";
    brightBlack = "#b77e64";
    brightRed = "#4d4849";
    brightGreen = "#ea9f79";
    brightYellow = "#9dc17a";
    brightBlue = "#e399d4";
    brightMagenta = "#78cbd4";
    brightCyan = "#74beee";
    brightWhite = "#bbbbbb";
  };

  orange = "#e8838f";
  brightOrange = "#fd96a1";
  cursor = "#cf86c1";

  tools = {
    bat = "ansi";
  };
}
