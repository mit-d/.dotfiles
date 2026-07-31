# Atelier Forest -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-forest.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-forest.nix. Edits here are lost on the
# next run.

{
  name = "atelier-forest";
  displayName = "Atelier Forest";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1b1918";
  surfaceDim = "#0f0d0c";
  surfaceBright = "#473f3b";
  surfaceContainerLowest = "#0f0d0c";
  surfaceContainerLow = "#1b1918";
  surfaceContainer = "#2c2421";
  surfaceContainerHigh = "#39312e";
  surfaceContainerHighest = "#473f3b";
  surfaceVariant = "#2c2421";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f1efee";
  onSurface = "#a8a19f";
  onSurfaceMuted = "#a29a98";
  onSurfaceVariant = "#9c9491";
  onSurfaceFaint = "#766e6b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#766e6b";
  outlineVariant = "#68615e";

  # --- Accent roles -------------------------------------------------------
  primary = "#407ee7";
  onPrimary = "#1a1818";
  primaryContainer = "#2b3e5f";
  onPrimaryContainer = "#f1efee";
  secondary = "#3d97b8";
  onSecondary = "#1b1918";
  tertiary = "#6666ea";
  onTertiary = "#060505";
  error = "#f22c40";
  onError = "#171515";
  inverseSurface = "#a8a19f";
  inverseOnSurface = "#1b1918";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2c2421";
    red = "#f22c40";
    green = "#7b9726";
    yellow = "#c38418";
    blue = "#407ee7";
    magenta = "#6666ea";
    cyan = "#3d97b8";
    white = "#a8a19f";
    brightBlack = "#766e6b";
    brightRed = "#ff555a";
    brightGreen = "#8daa3d";
    brightYellow = "#d79734";
    brightBlue = "#5291fc";
    brightMagenta = "#7679ff";
    brightCyan = "#51aacb";
    brightWhite = "#f1efee";
  };

  orange = "#df5320";
  brightOrange = "#f46737";
  cursor = "#407ee7";

  tools = {
    bat = "ansi";
  };
}
