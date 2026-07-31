# Horizon Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/horizon-dark.yaml
# Author: Michael Ball (http://github.com/michael-ball/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/horizon-dark.nix. Edits here are lost on the
# next run.

{
  name = "horizon-dark";
  displayName = "Horizon Dark";
  author = "Michael Ball (http://github.com/michael-ball/)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1c1e26";
  surfaceDim = "#15171f";
  surfaceBright = "#323440";
  surfaceContainerLowest = "#15171f";
  surfaceContainerLow = "#1c1e26";
  surfaceContainer = "#232530";
  surfaceContainerHigh = "#2a2d38";
  surfaceContainerHighest = "#323440";
  surfaceVariant = "#232530";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e3e6ee";
  onSurface = "#cbced0";
  onSurfaceMuted = "#b4b7b9";
  onSurfaceVariant = "#9da0a2";
  onSurfaceFaint = "#6f6f70";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6f6f70";
  outlineVariant = "#343644";

  # --- Accent roles -------------------------------------------------------
  primary = "#df5273";
  onPrimary = "#ffffff";
  primaryContainer = "#623442";
  onPrimaryContainer = "#e3e6ee";
  secondary = "#24a8b4";
  onSecondary = "#1c1e26";
  tertiary = "#b072d1";
  onTertiary = "#1c1e26";
  error = "#e93c58";
  onError = "#ffffff";
  inverseSurface = "#cbced0";
  inverseOnSurface = "#1c1e26";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#232530";
    red = "#e93c58";
    green = "#efaf8e";
    yellow = "#efb993";
    blue = "#df5273";
    magenta = "#b072d1";
    cyan = "#24a8b4";
    white = "#cbced0";
    brightBlack = "#6f6f70";
    brightRed = "#ff5269";
    brightGreen = "#ffc4a6";
    brightYellow = "#ffceac";
    brightBlue = "#f46685";
    brightMagenta = "#c384e5";
    brightCyan = "#40bbc7";
    brightWhite = "#e3e6ee";
  };

  orange = "#e58d7d";
  brightOrange = "#faa08f";
  cursor = "#df5273";

  tools = {
    bat = "ansi";
  };
}
