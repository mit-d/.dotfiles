# Windows 95 Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/windows-95-light.yaml
# Author: Fergus Collins (https://github.com/ferguscollins)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/windows-95-light.nix. Edits here are lost on the
# next run.

{
  name = "windows-95-light";
  displayName = "Windows 95 Light";
  author = "Fergus Collins (https://github.com/ferguscollins)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fcfcfc";
  surfaceDim = "#ffffff";
  surfaceBright = "#bcbcbc";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fcfcfc";
  surfaceContainer = "#e0e0e0";
  surfaceContainerHigh = "#cecece";
  surfaceContainerHighest = "#bcbcbc";
  surfaceVariant = "#e0e0e0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#000000";
  onSurface = "#545454";
  onSurfaceMuted = "#696969";
  onSurfaceVariant = "#7e7e7e";
  onSurfaceFaint = "#a8a8a8";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a1a1a1";
  outlineVariant = "#c4c4c4";

  # --- Accent roles -------------------------------------------------------
  primary = "#0000a8";
  onPrimary = "#fcfcfc";
  primaryContainer = "#8fabe3";
  onPrimaryContainer = "#000000";
  secondary = "#00a8a8";
  onSecondary = "#000000";
  tertiary = "#a800a8";
  onTertiary = "#fcfcfc";
  error = "#a80000";
  onError = "#fcfcfc";
  inverseSurface = "#545454";
  inverseOnSurface = "#fcfcfc";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e0e0e0";
    red = "#a80000";
    green = "#00a800";
    yellow = "#a85400";
    blue = "#0000a8";
    magenta = "#a800a8";
    cyan = "#00a8a8";
    white = "#545454";
    brightBlack = "#a8a8a8";
    brightRed = "#8b0000";
    brightGreen = "#009300";
    brightYellow = "#8f4700";
    brightBlue = "#001372";
    brightMagenta = "#8e008e";
    brightCyan = "#009494";
    brightWhite = "#000000";
  };

  orange = "#fcfc54";
  brightOrange = "#e8e839";
  cursor = "#0000a8";

  tools = {
    bat = "ansi";
  };
}
