# PhD -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/phd.yaml
# Author: Hennig Hasemann (http://leetless.de/vim.html)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/phd.nix. Edits here are lost on the
# next run.

{
  name = "phd";
  displayName = "PhD";
  author = "Hennig Hasemann (http://leetless.de/vim.html)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#061229";
  surfaceDim = "#01061b";
  surfaceBright = "#465167";
  surfaceContainerLowest = "#01061b";
  surfaceContainerLow = "#061229";
  surfaceContainer = "#2a3448";
  surfaceContainerHigh = "#384257";
  surfaceContainerHighest = "#465167";
  surfaceVariant = "#2a3448";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#b8bbc2";
  onSurfaceMuted = "#a9aab2";
  onSurfaceVariant = "#9a99a3";
  onSurfaceFaint = "#717885";

  # --- Borders and dividers -----------------------------------------------
  outline = "#717885";
  outlineVariant = "#4d5666";

  # --- Accent roles -------------------------------------------------------
  primary = "#5299bf";
  onPrimary = "#061229";
  primaryContainer = "#1f415e";
  onPrimaryContainer = "#ffffff";
  secondary = "#72b9bf";
  onSecondary = "#061229";
  tertiary = "#9989cc";
  onTertiary = "#061229";
  error = "#d07346";
  onError = "#061229";
  inverseSurface = "#b8bbc2";
  inverseOnSurface = "#061229";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2a3448";
    red = "#d07346";
    green = "#99bf52";
    yellow = "#fbd461";
    blue = "#5299bf";
    magenta = "#9989cc";
    cyan = "#72b9bf";
    white = "#b8bbc2";
    brightBlack = "#717885";
    brightRed = "#e48658";
    brightGreen = "#acd366";
    brightYellow = "#ffebb2";
    brightBlue = "#65acd3";
    brightMagenta = "#ab9be0";
    brightCyan = "#85ccd2";
    brightWhite = "#ffffff";
  };

  orange = "#f0a000";
  brightOrange = "#ffb649";
  cursor = "#5299bf";

  tools = {
    bat = "ansi";
  };
}
