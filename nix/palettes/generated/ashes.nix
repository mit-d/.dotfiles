# Ashes -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/ashes.yaml
# Author: Jannik Siebert (https://github.com/janniks)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/ashes.nix. Edits here are lost on the
# next run.

{
  name = "ashes";
  displayName = "Ashes";
  author = "Jannik Siebert (https://github.com/janniks)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1c2023";
  surfaceDim = "#101316";
  surfaceBright = "#565d63";
  surfaceContainerLowest = "#101316";
  surfaceContainerLow = "#1c2023";
  surfaceContainer = "#393f45";
  surfaceContainerHigh = "#474e54";
  surfaceContainerHighest = "#565d63";
  surfaceVariant = "#393f45";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f3f4f5";
  onSurface = "#c7ccd1";
  onSurfaceMuted = "#babfc5";
  onSurfaceVariant = "#adb3ba";
  onSurfaceFaint = "#747c84";

  # --- Borders and dividers -----------------------------------------------
  outline = "#747c84";
  outlineVariant = "#565e65";

  # --- Accent roles -------------------------------------------------------
  primary = "#ae95c7";
  onPrimary = "#1c2023";
  primaryContainer = "#4f495c";
  onPrimaryContainer = "#f3f4f5";
  secondary = "#95aec7";
  onSecondary = "#1c2023";
  tertiary = "#c795ae";
  onTertiary = "#1c2023";
  error = "#c7ae95";
  onError = "#1c2023";
  inverseSurface = "#c7ccd1";
  inverseOnSurface = "#1c2023";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#393f45";
    red = "#c7ae95";
    green = "#95c7ae";
    yellow = "#aec795";
    blue = "#ae95c7";
    magenta = "#c795ae";
    cyan = "#95aec7";
    white = "#c7ccd1";
    brightBlack = "#747c84";
    brightRed = "#dac1a8";
    brightGreen = "#a8dac1";
    brightYellow = "#c1daa8";
    brightBlue = "#c1a8db";
    brightMagenta = "#dba8c1";
    brightCyan = "#a8c1db";
    brightWhite = "#f3f4f5";
  };

  orange = "#c7c795";
  brightOrange = "#dadaa8";
  cursor = "#ae95c7";

  tools = {
    bat = "ansi";
  };
}
