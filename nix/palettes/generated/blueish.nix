# Blueish -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/blueish.yaml
# Author: Ben Mayoras
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/blueish.nix. Edits here are lost on the
# next run.

{
  name = "blueish";
  displayName = "Blueish";
  author = "Ben Mayoras";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#182430";
  surfaceDim = "#0b1722";
  surfaceBright = "#415a74";
  surfaceContainerLowest = "#0b1722";
  surfaceContainerLow = "#182430";
  surfaceContainer = "#243c54";
  surfaceContainerHigh = "#324b64";
  surfaceContainerHighest = "#415a74";
  surfaceVariant = "#243c54";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ddeaf6";
  onSurface = "#c8e1f8";
  onSurfaceMuted = "#9ec8f0";
  onSurfaceVariant = "#74afe7";
  onSurfaceFaint = "#616d78";

  # --- Borders and dividers -----------------------------------------------
  outline = "#616d78";
  outlineVariant = "#50351b";

  # --- Accent roles -------------------------------------------------------
  primary = "#82aaff";
  onPrimary = "#182430";
  primaryContainer = "#3d5378";
  onPrimaryContainer = "#ddeaf6";
  secondary = "#5fd1ff";
  onSecondary = "#182430";
  tertiary = "#ff84dd";
  onTertiary = "#182430";
  error = "#4ce587";
  onError = "#182430";
  inverseSurface = "#c8e1f8";
  inverseOnSurface = "#182430";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#243c54";
    red = "#4ce587";
    green = "#c3e88d";
    yellow = "#f6cd5c";
    blue = "#82aaff";
    magenta = "#ff84dd";
    cyan = "#5fd1ff";
    white = "#c8e1f8";
    brightBlack = "#616d78";
    brightRed = "#64f99a";
    brightGreen = "#d6fca0";
    brightYellow = "#ffe39b";
    brightBlue = "#9fbfff";
    brightMagenta = "#ffaae5";
    brightCyan = "#9ce0ff";
    brightWhite = "#ddeaf6";
  };

  orange = "#f6a85c";
  brightOrange = "#ffc087";
  cursor = "#82aaff";

  tools = {
    bat = "ansi";
  };
}
