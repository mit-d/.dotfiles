# darkmoss -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/darkmoss.yaml
# Author: Gabriel Avanzi (https://github.com/avanzzzi)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/darkmoss.nix. Edits here are lost on the
# next run.

{
  name = "darkmoss";
  displayName = "darkmoss";
  author = "Gabriel Avanzi (https://github.com/avanzzzi)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#171e1f";
  surfaceDim = "#0b1112";
  surfaceBright = "#414849";
  surfaceContainerLowest = "#0b1112";
  surfaceContainerLow = "#171e1f";
  surfaceContainer = "#252c2d";
  surfaceContainerHigh = "#333a3b";
  surfaceContainerHighest = "#414849";
  surfaceVariant = "#252c2d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e1eaef";
  onSurface = "#c7c7a5";
  onSurfaceMuted = "#a3ab92";
  onSurfaceVariant = "#818f80";
  onSurfaceFaint = "#555e5f";

  # --- Borders and dividers -----------------------------------------------
  outline = "#555e5f";
  outlineVariant = "#373c3d";

  # --- Accent roles -------------------------------------------------------
  primary = "#498091";
  onPrimary = "#070b0b";
  primaryContainer = "#2a4147";
  onPrimaryContainer = "#e1eaef";
  secondary = "#66d9ef";
  onSecondary = "#171e1f";
  tertiary = "#9bc0c8";
  onTertiary = "#171e1f";
  error = "#ff4658";
  onError = "#171e1f";
  inverseSurface = "#c7c7a5";
  inverseOnSurface = "#171e1f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#252c2d";
    red = "#ff4658";
    green = "#499180";
    yellow = "#fdb11f";
    blue = "#498091";
    magenta = "#9bc0c8";
    cyan = "#66d9ef";
    white = "#c7c7a5";
    brightBlack = "#555e5f";
    brightRed = "#ff7579";
    brightGreen = "#5ca492";
    brightYellow = "#ffcb7e";
    brightBlue = "#5b92a3";
    brightMagenta = "#aed3db";
    brightCyan = "#88ebff";
    brightWhite = "#e1eaef";
  };

  orange = "#e6db74";
  brightOrange = "#faef88";
  cursor = "#498091";

  tools = {
    bat = "ansi";
  };
}
