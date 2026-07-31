# Windows 95 -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/windows-95.yaml
# Author: Fergus Collins (https://github.com/ferguscollins)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/windows-95.nix. Edits here are lost on the
# next run.

{
  name = "windows-95";
  displayName = "Windows 95";
  author = "Fergus Collins (https://github.com/ferguscollins)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#373737";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#1c1c1c";
  surfaceContainerHigh = "#292929";
  surfaceContainerHighest = "#373737";
  surfaceVariant = "#1c1c1c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fcfcfc";
  onSurface = "#a8a8a8";
  onSurfaceMuted = "#939393";
  onSurfaceVariant = "#7e7e7e";
  onSurfaceFaint = "#545454";

  # --- Borders and dividers -----------------------------------------------
  outline = "#545454";
  outlineVariant = "#383838";

  # --- Accent roles -------------------------------------------------------
  primary = "#5454fc";
  onPrimary = "#fcfcfc";
  primaryContainer = "#0f0f41";
  onPrimaryContainer = "#fcfcfc";
  secondary = "#54fcfc";
  onSecondary = "#000000";
  tertiary = "#fc54fc";
  onTertiary = "#000000";
  error = "#fc5454";
  onError = "#000000";
  inverseSurface = "#a8a8a8";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1c1c1c";
    red = "#fc5454";
    green = "#54fc54";
    yellow = "#fcfc54";
    blue = "#5454fc";
    magenta = "#fc54fc";
    cyan = "#54fcfc";
    white = "#a8a8a8";
    brightBlack = "#545454";
    brightRed = "#ff7c76";
    brightGreen = "#b5ffb1";
    brightYellow = "#ffffff";
    brightBlue = "#6570ff";
    brightMagenta = "#ff86fd";
    brightCyan = "#cffffe";
    brightWhite = "#fcfcfc";
  };

  orange = "#a85400";
  brightOrange = "#bc6621";
  cursor = "#5454fc";

  tools = {
    bat = "ansi";
  };
}
