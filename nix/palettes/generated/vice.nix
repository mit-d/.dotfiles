# vice -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/vice.yaml
# Author: Thomas Leon Highbaugh thighbaugh@zoho.com
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/vice.nix. Edits here are lost on the
# next run.

{
  name = "vice";
  displayName = "vice";
  author = "Thomas Leon Highbaugh thighbaugh@zoho.com";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#17191e";
  surfaceDim = "#0b0d12";
  surfaceBright = "#3d4149";
  surfaceContainerLowest = "#0b0d12";
  surfaceContainerLow = "#17191e";
  surfaceContainer = "#22262d";
  surfaceContainerHigh = "#2f333b";
  surfaceContainerHighest = "#3d4149";
  surfaceVariant = "#22262d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f4f4f7";
  onSurface = "#8b9cbe";
  onSurfaceMuted = "#6f7c96";
  onSurfaceVariant = "#677080";
  onSurfaceFaint = "#4e505d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#575964";
  outlineVariant = "#3c3f4c";

  # --- Accent roles -------------------------------------------------------
  primary = "#00eaff";
  onPrimary = "#17191e";
  primaryContainer = "#2a606a";
  onPrimaryContainer = "#f4f4f7";
  secondary = "#8265ff";
  onSecondary = "#15161b";
  tertiary = "#00f6d9";
  onTertiary = "#17191e";
  error = "#ff29a8";
  onError = "#17191e";
  inverseSurface = "#8b9cbe";
  inverseOnSurface = "#17191e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#22262d";
    red = "#ff29a8";
    green = "#0badff";
    yellow = "#f0ffaa";
    blue = "#00eaff";
    magenta = "#00f6d9";
    cyan = "#8265ff";
    white = "#8b9cbe";
    brightBlack = "#383a47";
    brightRed = "#ff6ab6";
    brightGreen = "#62bfff";
    brightYellow = "#ffffff";
    brightBlue = "#9ef4ff";
    brightMagenta = "#99ffeb";
    brightCyan = "#9281ff";
    brightWhite = "#f4f4f7";
  };

  orange = "#85ffe0";
  brightOrange = "#e7fff7";
  cursor = "#00eaff";

  tools = {
    bat = "ansi";
  };
}
