# Harmonic16 Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/harmonic16-light.yaml
# Author: Jannik Siebert (https://github.com/janniks)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/harmonic16-light.nix. Edits here are lost on the
# next run.

{
  name = "harmonic16-light";
  displayName = "Harmonic16 Light";
  author = "Jannik Siebert (https://github.com/janniks)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f7f9fb";
  surfaceDim = "#ffffff";
  surfaceBright = "#c8ced4";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f7f9fb";
  surfaceContainer = "#e5ebf1";
  surfaceContainerHigh = "#d7dde2";
  surfaceContainerHighest = "#c8ced4";
  surfaceVariant = "#e5ebf1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#0b1c2c";
  onSurface = "#405c79";
  onSurfaceMuted = "#516d89";
  onSurfaceVariant = "#627e99";
  onSurfaceFaint = "#9aacbe";

  # --- Borders and dividers -----------------------------------------------
  outline = "#8fa1b3";
  outlineVariant = "#cbd6e2";

  # --- Accent roles -------------------------------------------------------
  primary = "#8b56bf";
  onPrimary = "#f7f9fb";
  primaryContainer = "#cdbbe6";
  onPrimaryContainer = "#0b1c2c";
  secondary = "#568bbf";
  onSecondary = "#0b1c2c";
  tertiary = "#bf568b";
  onTertiary = "#ffffff";
  error = "#bf8b56";
  onError = "#0b1c2c";
  inverseSurface = "#405c79";
  inverseOnSurface = "#f7f9fb";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e5ebf1";
    red = "#bf8b56";
    green = "#56bf8b";
    yellow = "#8bbf56";
    blue = "#8b56bf";
    magenta = "#bf568b";
    cyan = "#568bbf";
    white = "#405c79";
    brightBlack = "#aabcce";
    brightRed = "#ac7944";
    brightGreen = "#41ac79";
    brightYellow = "#79ac42";
    brightBlue = "#7944ab";
    brightMagenta = "#ab4479";
    brightCyan = "#4479ac";
    brightWhite = "#0b1c2c";
  };

  orange = "#bfbf56";
  brightOrange = "#acac41";
  cursor = "#8b56bf";

  tools = {
    bat = "ansi";
  };
}
