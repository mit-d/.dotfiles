# Harmonic16 Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/harmonic16-dark.yaml
# Author: Jannik Siebert (https://github.com/janniks)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/harmonic16-dark.nix. Edits here are lost on the
# next run.

{
  name = "harmonic16-dark";
  displayName = "Harmonic16 Dark";
  author = "Jannik Siebert (https://github.com/janniks)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0b1c2c";
  surfaceDim = "#020f1e";
  surfaceBright = "#3f5974";
  surfaceContainerLowest = "#020f1e";
  surfaceContainerLow = "#0b1c2c";
  surfaceContainer = "#223b54";
  surfaceContainerHigh = "#304a64";
  surfaceContainerHighest = "#3f5974";
  surfaceVariant = "#223b54";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f7f9fb";
  onSurface = "#cbd6e2";
  onSurfaceMuted = "#bac9d8";
  onSurfaceVariant = "#aabcce";
  onSurfaceFaint = "#627e99";

  # --- Borders and dividers -----------------------------------------------
  outline = "#627e99";
  outlineVariant = "#405c79";

  # --- Accent roles -------------------------------------------------------
  primary = "#8b56bf";
  onPrimary = "#f7f9fb";
  primaryContainer = "#3a3260";
  onPrimaryContainer = "#f7f9fb";
  secondary = "#568bbf";
  onSecondary = "#0b1c2c";
  tertiary = "#bf568b";
  onTertiary = "#ffffff";
  error = "#bf8b56";
  onError = "#0b1c2c";
  inverseSurface = "#cbd6e2";
  inverseOnSurface = "#0b1c2c";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#223b54";
    red = "#bf8b56";
    green = "#56bf8b";
    yellow = "#8bbf56";
    blue = "#8b56bf";
    magenta = "#bf568b";
    cyan = "#568bbf";
    white = "#cbd6e2";
    brightBlack = "#627e99";
    brightRed = "#d39e68";
    brightGreen = "#6ad39d";
    brightYellow = "#9dd369";
    brightBlue = "#9d68d3";
    brightMagenta = "#d3689d";
    brightCyan = "#689ed3";
    brightWhite = "#f7f9fb";
  };

  orange = "#bfbf56";
  brightOrange = "#d2d26a";
  cursor = "#8b56bf";

  tools = {
    bat = "ansi";
  };
}
