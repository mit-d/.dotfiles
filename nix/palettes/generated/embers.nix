# Embers -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/embers.yaml
# Author: Jannik Siebert (https://github.com/janniks)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/embers.nix. Edits here are lost on the
# next run.

{
  name = "embers";
  displayName = "Embers";
  author = "Jannik Siebert (https://github.com/janniks)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#16130f";
  surfaceDim = "#0a0805";
  surfaceBright = "#48423b";
  surfaceContainerLowest = "#0a0805";
  surfaceContainerLow = "#16130f";
  surfaceContainer = "#2c2620";
  surfaceContainerHigh = "#3a342d";
  surfaceContainerHighest = "#48423b";
  surfaceVariant = "#2c2620";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#dbd6d1";
  onSurface = "#a39a90";
  onSurfaceMuted = "#968d82";
  onSurfaceVariant = "#8a8075";
  onSurfaceFaint = "#5a5047";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5e544b";
  outlineVariant = "#433b32";

  # --- Accent roles -------------------------------------------------------
  primary = "#6d5782";
  onPrimary = "#ded9d5";
  primaryContainer = "#342b37";
  onPrimaryContainer = "#dbd6d1";
  secondary = "#576d82";
  onSecondary = "#edebe8";
  tertiary = "#82576d";
  onTertiary = "#e3dfdc";
  error = "#826d57";
  onError = "#f5f5f5";
  inverseSurface = "#a39a90";
  inverseOnSurface = "#16130f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2c2620";
    red = "#826d57";
    green = "#57826d";
    yellow = "#6d8257";
    blue = "#6d5782";
    magenta = "#82576d";
    cyan = "#576d82";
    white = "#a39a90";
    brightBlack = "#5a5047";
    brightRed = "#947f68";
    brightGreen = "#69947f";
    brightYellow = "#7f9468";
    brightBlue = "#7f6894";
    brightMagenta = "#94687f";
    brightCyan = "#687f94";
    brightWhite = "#dbd6d1";
  };

  orange = "#828257";
  brightOrange = "#949468";
  cursor = "#6e5883";

  tools = {
    bat = "ansi";
  };
}
