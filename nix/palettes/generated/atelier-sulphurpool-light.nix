# Atelier Sulphurpool Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-sulphurpool-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-sulphurpool-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-sulphurpool-light";
  displayName = "Atelier Sulphurpool Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f5f7ff";
  surfaceDim = "#ffffff";
  surfaceBright = "#bcbecd";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f5f7ff";
  surfaceContainer = "#dfe2f1";
  surfaceContainerHigh = "#cdd0df";
  surfaceContainerHighest = "#bcbecd";
  surfaceVariant = "#dfe2f1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#202746";
  onSurface = "#5e6687";
  onSurfaceMuted = "#646c8d";
  onSurfaceVariant = "#6b7394";
  onSurfaceFaint = "#898ea4";

  # --- Borders and dividers -----------------------------------------------
  outline = "#898ea4";
  outlineVariant = "#979db4";

  # --- Accent roles -------------------------------------------------------
  primary = "#3d8fd1";
  onPrimary = "#1b223d";
  primaryContainer = "#b2d0ef";
  onPrimaryContainer = "#202746";
  secondary = "#22a2c9";
  onSecondary = "#202746";
  tertiary = "#6679cc";
  onTertiary = "#141516";
  error = "#c94922";
  onError = "#f8faff";
  inverseSurface = "#5e6687";
  inverseOnSurface = "#f5f7ff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#dfe2f1";
    red = "#c94922";
    green = "#ac9739";
    yellow = "#c08b30";
    blue = "#3d8fd1";
    magenta = "#6679cc";
    cyan = "#22a2c9";
    white = "#5e6687";
    brightBlack = "#898ea4";
    brightRed = "#b43505";
    brightGreen = "#998522";
    brightYellow = "#ad7915";
    brightBlue = "#287dbd";
    brightMagenta = "#5567b8";
    brightCyan = "#008fb4";
    brightWhite = "#202746";
  };

  orange = "#c76b29";
  brightOrange = "#b3590e";
  cursor = "#3d8fd1";

  tools = {
    bat = "ansi";
  };
}
