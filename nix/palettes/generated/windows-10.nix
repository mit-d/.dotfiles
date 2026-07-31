# Windows 10 -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/windows-10.yaml
# Author: Fergus Collins (https://github.com/ferguscollins)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/windows-10.nix. Edits here are lost on the
# next run.

{
  name = "windows-10";
  displayName = "Windows 10";
  author = "Fergus Collins (https://github.com/ferguscollins)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0c0c0c";
  surfaceDim = "#030303";
  surfaceBright = "#4c4c4c";
  surfaceContainerLowest = "#030303";
  surfaceContainerLow = "#0c0c0c";
  surfaceContainer = "#2f2f2f";
  surfaceContainerHigh = "#3d3d3d";
  surfaceContainerHighest = "#4c4c4c";
  surfaceVariant = "#2f2f2f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f2f2f2";
  onSurface = "#cccccc";
  onSurfaceMuted = "#c2c2c2";
  onSurfaceVariant = "#b9b9b9";
  onSurfaceFaint = "#767676";

  # --- Borders and dividers -----------------------------------------------
  outline = "#767676";
  outlineVariant = "#535353";

  # --- Accent roles -------------------------------------------------------
  primary = "#3b78ff";
  onPrimary = "#0c0c0c";
  primaryContainer = "#1e335d";
  onPrimaryContainer = "#f2f2f2";
  secondary = "#61d6d6";
  onSecondary = "#0c0c0c";
  tertiary = "#b4009e";
  onTertiary = "#f2f2f2";
  error = "#e74856";
  onError = "#0c0c0c";
  inverseSurface = "#cccccc";
  inverseOnSurface = "#0c0c0c";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2f2f2f";
    red = "#e74856";
    green = "#16c60c";
    yellow = "#f9f1a5";
    blue = "#3b78ff";
    magenta = "#b4009e";
    cyan = "#61d6d6";
    white = "#cccccc";
    brightBlack = "#767676";
    brightRed = "#fd5d68";
    brightGreen = "#3bda32";
    brightYellow = "#ffffff";
    brightBlue = "#5a90ff";
    brightMagenta = "#c929b1";
    brightCyan = "#76eaea";
    brightWhite = "#f2f2f2";
  };

  orange = "#c19c00";
  brightOrange = "#d4af2c";
  cursor = "#3b78ff";

  tools = {
    bat = "ansi";
  };
}
