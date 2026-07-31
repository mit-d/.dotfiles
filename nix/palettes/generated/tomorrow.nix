# Tomorrow -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tomorrow.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tomorrow.nix. Edits here are lost on the
# next run.

{
  name = "tomorrow";
  displayName = "Tomorrow";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#bcbcbc";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#e0e0e0";
  surfaceContainerHigh = "#cecece";
  surfaceContainerHighest = "#bcbcbc";
  surfaceVariant = "#e0e0e0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1d1f21";
  onSurface = "#373b41";
  onSurfaceMuted = "#65686a";
  onSurfaceVariant = "#878988";
  onSurfaceFaint = "#adb0ad";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a2a5a2";
  outlineVariant = "#c5c8c6";

  # --- Accent roles -------------------------------------------------------
  primary = "#4271ae";
  onPrimary = "#ffffff";
  primaryContainer = "#b5c8e1";
  onPrimaryContainer = "#1d1f21";
  secondary = "#3e999f";
  onSecondary = "#1d1f21";
  tertiary = "#8959a8";
  onTertiary = "#ffffff";
  error = "#c82829";
  onError = "#ffffff";
  inverseSurface = "#373b41";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e0e0e0";
    red = "#c82829";
    green = "#718c00";
    yellow = "#eab700";
    blue = "#4271ae";
    magenta = "#8959a8";
    cyan = "#3e999f";
    white = "#373b41";
    brightBlack = "#b4b7b4";
    brightRed = "#b30215";
    brightGreen = "#617900";
    brightYellow = "#d3a500";
    brightBlue = "#315f9b";
    brightMagenta = "#774895";
    brightCyan = "#28878d";
    brightWhite = "#1d1f21";
  };

  orange = "#f5871f";
  brightOrange = "#de7600";
  cursor = "#4271ae";

  tools = {
    bat = "ansi";
  };
}
