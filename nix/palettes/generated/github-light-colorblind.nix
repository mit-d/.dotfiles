# Github Light Colorblind -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/github-light-colorblind.yaml
# Author: Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/github-light-colorblind.nix. Edits here are lost on the
# next run.

{
  name = "github-light-colorblind";
  displayName = "Github Light Colorblind";
  author = "Tinted Theming (https://github.com/tinted-theming)";
  variant = "light";
  version = "3.2.0";

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
  onSurfaceStrong = "#24292f";
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
  onPrimaryContainer = "#24292f";
  secondary = "#0550ae";
  onSecondary = "#ffffff";
  tertiary = "#b35900";
  onTertiary = "#ffffff";
  error = "#8a4600";
  onError = "#ffffff";
  inverseSurface = "#424a53";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f6f8fa";
    red = "#8a4600";
    green = "#0a3069";
    yellow = "#bf8700";
    blue = "#8250df";
    magenta = "#b35900";
    cyan = "#0550ae";
    white = "#424a53";
    brightBlack = "#8c959f";
    brightRed = "#723900";
    brightGreen = "#002054";
    brightYellow = "#a87600";
    brightBlue = "#713cca";
    brightMagenta = "#9a4b00";
    brightCyan = "#004091";
    brightWhite = "#24292f";
  };

  orange = "#0550ae";
  brightOrange = "#004091";
  cursor = "#8250df";

  tools = {
    bat = "ansi";
  };
}
