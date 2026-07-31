# Atelier Sulphurpool -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-sulphurpool.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-sulphurpool.nix. Edits here are lost on the
# next run.

{
  name = "atelier-sulphurpool";
  displayName = "Atelier Sulphurpool";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#202746";
  surfaceDim = "#161c3a";
  surfaceBright = "#404a70";
  surfaceContainerLowest = "#161c3a";
  surfaceContainerLow = "#202746";
  surfaceContainer = "#293256";
  surfaceContainerHigh = "#343e63";
  surfaceContainerHighest = "#404a70";
  surfaceVariant = "#293256";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5f7ff";
  onSurface = "#979db4";
  onSurfaceMuted = "#9095ac";
  onSurfaceVariant = "#898ea4";
  onSurfaceFaint = "#6b7394";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6b7394";
  outlineVariant = "#5e6687";

  # --- Accent roles -------------------------------------------------------
  primary = "#3d8fd1";
  onPrimary = "#1b223d";
  primaryContainer = "#2d4c78";
  onPrimaryContainer = "#f5f7ff";
  secondary = "#22a2c9";
  onSecondary = "#202746";
  tertiary = "#6679cc";
  onTertiary = "#141516";
  error = "#c94922";
  onError = "#f8faff";
  inverseSurface = "#979db4";
  inverseOnSurface = "#202746";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#293256";
    red = "#c94922";
    green = "#ac9739";
    yellow = "#c08b30";
    blue = "#3d8fd1";
    magenta = "#6679cc";
    cyan = "#22a2c9";
    white = "#979db4";
    brightBlack = "#6b7394";
    brightRed = "#de5c37";
    brightGreen = "#bfaa4d";
    brightYellow = "#d49e45";
    brightBlue = "#51a2e5";
    brightMagenta = "#778be0";
    brightCyan = "#3eb5dd";
    brightWhite = "#f5f7ff";
  };

  orange = "#c76b29";
  brightOrange = "#db7d3e";
  cursor = "#3d8fd1";

  tools = {
    bat = "ansi";
  };
}
