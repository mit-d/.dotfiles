# Nord Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/nord-light.yaml
# Author: threddast, based on fuxialexander's doom-nord-light-theme (Doom Emacs)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/nord-light.nix. Edits here are lost on the
# next run.

{
  name = "nord-light";
  displayName = "Nord Light";
  author = "threddast, based on fuxialexander's doom-nord-light-theme (Doom Emacs)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#e5e9f0";
  surfaceDim = "#f9fbff";
  surfaceBright = "#9fadc3";
  surfaceContainerLowest = "#f9fbff";
  surfaceContainerLow = "#e5e9f0";
  surfaceContainer = "#c2d0e7";
  surfaceContainerHigh = "#b1bed5";
  surfaceContainerHighest = "#9fadc3";
  surfaceVariant = "#c2d0e7";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#2e3341";
  onSurface = "#2e3440";
  onSurfaceMuted = "#465265";
  onSurfaceVariant = "#60728c";
  onSurfaceFaint = "#949eb2";

  # --- Borders and dividers -----------------------------------------------
  outline = "#8a94a8";
  outlineVariant = "#b8c5db";

  # --- Accent roles -------------------------------------------------------
  primary = "#3b6ea8";
  onPrimary = "#eaeef3";
  primaryContainer = "#a3bad6";
  onPrimaryContainer = "#2e3341";
  secondary = "#398eac";
  onSecondary = "#1a1d27";
  tertiary = "#97365b";
  onTertiary = "#e5e9f0";
  error = "#99324b";
  onError = "#e5e9f0";
  inverseSurface = "#2e3440";
  inverseOnSurface = "#e5e9f0";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#c2d0e7";
    red = "#99324b";
    green = "#4f894c";
    yellow = "#9a7500";
    blue = "#3b6ea8";
    magenta = "#97365b";
    cyan = "#398eac";
    white = "#2e3440";
    brightBlack = "#aebacf";
    brightRed = "#851e3b";
    brightGreen = "#3d773b";
    brightYellow = "#856400";
    brightBlue = "#295c95";
    brightMagenta = "#83234b";
    brightCyan = "#237c99";
    brightWhite = "#2e3341";
  };

  orange = "#ac4426";
  brightOrange = "#983111";
  cursor = "#3b6ea8";

  tools = {
    bat = "ansi";
  };
}
