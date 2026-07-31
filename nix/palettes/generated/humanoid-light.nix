# Humanoid light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/humanoid-light.yaml
# Author: Thomas (tasmo) Friese
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/humanoid-light.nix. Edits here are lost on the
# next run.

{
  name = "humanoid-light";
  displayName = "Humanoid light";
  author = "Thomas (tasmo) Friese";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f8f8f2";
  surfaceDim = "#ffffff";
  surfaceBright = "#ddddd7";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f8f8f2";
  surfaceContainer = "#efefe9";
  surfaceContainerHigh = "#e6e6e0";
  surfaceContainerHighest = "#ddddd7";
  surfaceVariant = "#efefe9";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#070708";
  onSurface = "#232629";
  onSurfaceMuted = "#404242";
  onSurfaceVariant = "#60615d";
  onSurfaceFaint = "#a9a9a7";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9f9f9c";
  outlineVariant = "#d4d4ce";

  # --- Accent roles -------------------------------------------------------
  primary = "#0082c9";
  onPrimary = "#070708";
  primaryContainer = "#aacce5";
  onPrimaryContainer = "#070708";
  secondary = "#008e8e";
  onSecondary = "#070708";
  tertiary = "#700f98";
  onTertiary = "#f8f8f2";
  error = "#b0151a";
  onError = "#f8f8f2";
  inverseSurface = "#232629";
  inverseOnSurface = "#f8f8f2";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#efefe9";
    red = "#b0151a";
    green = "#388e3c";
    yellow = "#ffb627";
    blue = "#0082c9";
    magenta = "#700f98";
    cyan = "#008e8e";
    white = "#232629";
    brightBlack = "#c0c0bd";
    brightRed = "#96000d";
    brightGreen = "#237c2a";
    brightYellow = "#e9a300";
    brightBlue = "#0070ae";
    brightMagenta = "#5b007e";
    brightCyan = "#007a7a";
    brightWhite = "#070708";
  };

  orange = "#ff3d00";
  brightOrange = "#e03400";
  cursor = "#0082c9";

  tools = {
    bat = "ansi";
  };
}
