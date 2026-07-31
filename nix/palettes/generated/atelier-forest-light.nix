# Atelier Forest Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-forest-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-forest-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-forest-light";
  displayName = "Atelier Forest Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f1efee";
  surfaceDim = "#fefcfb";
  surfaceBright = "#cdc9c7";
  surfaceContainerLowest = "#fefcfb";
  surfaceContainerLow = "#f1efee";
  surfaceContainer = "#e6e2e0";
  surfaceContainerHigh = "#dad6d4";
  surfaceContainerHighest = "#cdc9c7";
  surfaceVariant = "#e6e2e0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1b1918";
  onSurface = "#68615e";
  onSurfaceMuted = "#6f6764";
  onSurfaceVariant = "#766e6b";
  onSurfaceFaint = "#9c9491";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9c9491";
  outlineVariant = "#a8a19f";

  # --- Accent roles -------------------------------------------------------
  primary = "#407ee7";
  onPrimary = "#1a1818";
  primaryContainer = "#aec6ef";
  onPrimaryContainer = "#1b1918";
  secondary = "#3d97b8";
  onSecondary = "#1b1918";
  tertiary = "#6666ea";
  onTertiary = "#060505";
  error = "#f22c40";
  onError = "#171515";
  inverseSurface = "#68615e";
  inverseOnSurface = "#f1efee";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e6e2e0";
    red = "#f22c40";
    green = "#7b9726";
    yellow = "#c38418";
    blue = "#407ee7";
    magenta = "#6666ea";
    cyan = "#3d97b8";
    white = "#68615e";
    brightBlack = "#9c9491";
    brightRed = "#db002e";
    brightGreen = "#6a8503";
    brightYellow = "#ad7300";
    brightBlue = "#2e6bd2";
    brightMagenta = "#5653d5";
    brightCyan = "#2685a5";
    brightWhite = "#1b1918";
  };

  orange = "#df5320";
  brightOrange = "#c94000";
  cursor = "#407ee7";

  tools = {
    bat = "ansi";
  };
}
