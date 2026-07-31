# Moonlight -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/moonlight.yaml
# Author: Jeremy Swinarton (https://github.com/jswinarton)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/moonlight.nix. Edits here are lost on the
# next run.

{
  name = "moonlight";
  displayName = "Moonlight";
  author = "Jeremy Swinarton (https://github.com/jswinarton)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#212337";
  surfaceDim = "#141629";
  surfaceBright = "#5e5a85";
  surfaceContainerLowest = "#141629";
  surfaceContainerLow = "#212337";
  surfaceContainer = "#403c64";
  surfaceContainerHigh = "#4f4b74";
  surfaceContainerHighest = "#5e5a85";
  surfaceVariant = "#403c64";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#b4a4f4";
  onSurface = "#a3ace1";
  onSurfaceMuted = "#a2ace0";
  onSurfaceVariant = "#a1abe0";
  onSurfaceFaint = "#748cd6";

  # --- Borders and dividers -----------------------------------------------
  outline = "#748cd6";
  outlineVariant = "#596399";

  # --- Accent roles -------------------------------------------------------
  primary = "#40ffff";
  onPrimary = "#212337";
  primaryContainer = "#396f7d";
  onPrimaryContainer = "#e6e6e9";
  secondary = "#04d1f9";
  onSecondary = "#212337";
  tertiary = "#b994f1";
  onTertiary = "#212337";
  error = "#ff5370";
  onError = "#212337";
  inverseSurface = "#a3ace1";
  inverseOnSurface = "#212337";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#403c64";
    red = "#ff5370";
    green = "#2df4c0";
    yellow = "#ffc777";
    blue = "#40ffff";
    magenta = "#b994f1";
    cyan = "#04d1f9";
    white = "#a3ace1";
    brightBlack = "#748cd6";
    brightRed = "#ff7e8d";
    brightGreen = "#91ffd9";
    brightYellow = "#ffe0b7";
    brightBlue = "#d6fffe";
    brightMagenta = "#cba9ff";
    brightCyan = "#73e1ff";
    brightWhite = "#b4a4f4";
  };

  orange = "#f67f81";
  brightOrange = "#ff9b9a";
  cursor = "#40ffff";

  tools = {
    bat = "ansi";
  };
}
