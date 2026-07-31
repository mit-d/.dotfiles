# Github -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/github.yaml
# Author: Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/github.nix. Edits here are lost on the
# next run.

{
  name = "github";
  displayName = "Github";
  author = "Tinted Theming (https://github.com/tinted-theming)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#e7e9eb";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#f6f8fa";
  surfaceContainerHigh = "#eff1f3";
  surfaceContainerHighest = "#e7e9eb";
  surfaceVariant = "#f6f8fa";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1f2328";
  onSurface = "#424a53";
  onSurfaceMuted = "#58606a";
  onSurfaceVariant = "#6e7781";
  onSurfaceFaint = "#8c959f";

  # --- Borders and dividers -----------------------------------------------
  outline = "#8c959f";
  outlineVariant = "#afb8c1";

  # --- Accent roles -------------------------------------------------------
  primary = "#8250df";
  onPrimary = "#ffffff";
  primaryContainer = "#ccbff7";
  onPrimaryContainer = "#1f2328";
  secondary = "#116329";
  onSecondary = "#ffffff";
  tertiary = "#cf222e";
  onTertiary = "#ffffff";
  error = "#953800";
  onError = "#ffffff";
  inverseSurface = "#424a53";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f6f8fa";
    red = "#953800";
    green = "#0a3069";
    yellow = "#bf8700";
    blue = "#8250df";
    magenta = "#cf222e";
    cyan = "#116329";
    white = "#424a53";
    brightBlack = "#8c959f";
    brightRed = "#7b2d00";
    brightGreen = "#002054";
    brightYellow = "#a87600";
    brightBlue = "#713cca";
    brightMagenta = "#b7001e";
    brightCyan = "#00511c";
    brightWhite = "#1f2328";
  };

  orange = "#0550ae";
  brightOrange = "#004091";
  cursor = "#8250df";

  tools = {
    bat = "GitHub";
  };
}
