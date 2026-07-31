# standardized-dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/standardized-dark.yaml
# Author: ali (https://github.com/ali-githb/base16-standardized-scheme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/standardized-dark.nix. Edits here are lost on the
# next run.

{
  name = "standardized-dark";
  displayName = "standardized-dark";
  author = "ali (https://github.com/ali-githb/base16-standardized-scheme)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#222222";
  surfaceDim = "#151515";
  surfaceBright = "#4d4d4d";
  surfaceContainerLowest = "#151515";
  surfaceContainerLow = "#222222";
  surfaceContainer = "#303030";
  surfaceContainerHigh = "#3e3e3e";
  surfaceContainerHighest = "#4d4d4d";
  surfaceVariant = "#303030";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#c0c0c0";
  onSurfaceMuted = "#a4a4a4";
  onSurfaceVariant = "#898989";
  onSurfaceFaint = "#898989";

  # --- Borders and dividers -----------------------------------------------
  outline = "#898989";
  outlineVariant = "#555555";

  # --- Accent roles -------------------------------------------------------
  primary = "#00a3f2";
  onPrimary = "#222222";
  primaryContainer = "#2b506a";
  onPrimaryContainer = "#ffffff";
  secondary = "#21c992";
  onSecondary = "#222222";
  tertiary = "#b46ee0";
  onTertiary = "#222222";
  error = "#e15d67";
  onError = "#222222";
  inverseSurface = "#c0c0c0";
  inverseOnSurface = "#222222";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#303030";
    red = "#e15d67";
    green = "#5db129";
    yellow = "#e1b31a";
    blue = "#00a3f2";
    magenta = "#b46ee0";
    cyan = "#21c992";
    white = "#c0c0c0";
    brightBlack = "#898989";
    brightRed = "#f67079";
    brightGreen = "#70c441";
    brightYellow = "#f5c63b";
    brightBlue = "#44b6ff";
    brightMagenta = "#c781f4";
    brightCyan = "#42dda5";
    brightWhite = "#ffffff";
  };

  orange = "#fc804e";
  brightOrange = "#ff9f7a";
  cursor = "#00a3f2";

  tools = {
    bat = "ansi";
  };
}
