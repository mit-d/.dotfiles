# Colors -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/colors.yaml
# Author: mrmrs (http://clrs.cc)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/colors.nix. Edits here are lost on the
# next run.

{
  name = "colors";
  displayName = "Colors";
  author = "mrmrs (http://clrs.cc)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#111111";
  surfaceDim = "#060606";
  surfaceBright = "#505050";
  surfaceContainerLowest = "#060606";
  surfaceContainerLow = "#111111";
  surfaceContainer = "#333333";
  surfaceContainerHigh = "#414141";
  surfaceContainerHighest = "#505050";
  surfaceVariant = "#333333";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#bbbbbb";
  onSurfaceMuted = "#aaaaaa";
  onSurfaceVariant = "#999999";
  onSurfaceFaint = "#777777";

  # --- Borders and dividers -----------------------------------------------
  outline = "#777777";
  outlineVariant = "#555555";

  # --- Accent roles -------------------------------------------------------
  primary = "#0074d9";
  onPrimary = "#ffffff";
  primaryContainer = "#193555";
  onPrimaryContainer = "#ffffff";
  secondary = "#7fdbff";
  onSecondary = "#111111";
  tertiary = "#b10dc9";
  onTertiary = "#ffffff";
  error = "#ff4136";
  onError = "#111111";
  inverseSurface = "#bbbbbb";
  inverseOnSurface = "#111111";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#333333";
    red = "#ff4136";
    green = "#2ecc40";
    yellow = "#ffdc00";
    blue = "#0074d9";
    magenta = "#b10dc9";
    cyan = "#7fdbff";
    white = "#bbbbbb";
    brightBlack = "#777777";
    brightRed = "#ff7263";
    brightGreen = "#4ae055";
    brightYellow = "#fff2b4";
    brightBlue = "#2587ee";
    brightMagenta = "#c531dd";
    brightCyan = "#b6eaff";
    brightWhite = "#ffffff";
  };

  orange = "#ff851b";
  brightOrange = "#ffa569";
  cursor = "#0074d9";

  tools = {
    bat = "ansi";
  };
}
