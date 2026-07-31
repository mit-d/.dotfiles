# Nebula -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/nebula.yaml
# Author: Gabriel Fontes (https://github.com/Misterio77)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/nebula.nix. Edits here are lost on the
# next run.

{
  name = "nebula";
  displayName = "Nebula";
  author = "Gabriel Fontes (https://github.com/Misterio77)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#22273b";
  surfaceDim = "#151a2d";
  surfaceBright = "#5f6e80";
  surfaceContainerLowest = "#151a2d";
  surfaceContainerLow = "#22273b";
  surfaceContainer = "#414f60";
  surfaceContainerHigh = "#505e70";
  surfaceContainerHighest = "#5f6e80";
  surfaceVariant = "#414f60";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#c7c9cd";
  onSurface = "#a4a6a9";
  onSurfaceMuted = "#95979a";
  onSurfaceVariant = "#87888b";
  onSurfaceFaint = "#6e6f72";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6e6f72";
  outlineVariant = "#5a8380";

  # --- Accent roles -------------------------------------------------------
  primary = "#4d6bb6";
  onPrimary = "#f0f0f1";
  primaryContainer = "#324067";
  onPrimaryContainer = "#c7c9cd";
  secondary = "#226f68";
  onSecondary = "#dfe1e3";
  tertiary = "#716cae";
  onTertiary = "#f9fafa";
  error = "#777abc";
  onError = "#131724";
  inverseSurface = "#a4a6a9";
  inverseOnSurface = "#22273b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#414f60";
    red = "#777abc";
    green = "#6562a8";
    yellow = "#4f9062";
    blue = "#4d6bb6";
    magenta = "#716cae";
    cyan = "#226f68";
    white = "#a4a6a9";
    brightBlack = "#6e6f72";
    brightRed = "#898cd0";
    brightGreen = "#7674bb";
    brightYellow = "#61a373";
    brightBlue = "#5e7dca";
    brightMagenta = "#827ec1";
    brightCyan = "#378179";
    brightWhite = "#c7c9cd";
  };

  orange = "#94929e";
  brightOrange = "#a6a4b1";
  cursor = "#516fb7";

  tools = {
    bat = "ansi";
  };
}
