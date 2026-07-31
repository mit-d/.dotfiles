# Windows NT -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/windows-nt.yaml
# Author: Fergus Collins (https://github.com/ferguscollins)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/windows-nt.nix. Edits here are lost on the
# next run.

{
  name = "windows-nt";
  displayName = "Windows NT";
  author = "Fergus Collins (https://github.com/ferguscollins)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#464646";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#2a2a2a";
  surfaceContainerHigh = "#383838";
  surfaceContainerHighest = "#464646";
  surfaceVariant = "#2a2a2a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#c0c0c0";
  onSurfaceMuted = "#b0b0b0";
  onSurfaceVariant = "#a1a1a1";
  onSurfaceFaint = "#808080";

  # --- Borders and dividers -----------------------------------------------
  outline = "#808080";
  outlineVariant = "#555555";

  # --- Accent roles -------------------------------------------------------
  primary = "#0000ff";
  onPrimary = "#ffffff";
  primaryContainer = "#000042";
  onPrimaryContainer = "#ffffff";
  secondary = "#00ffff";
  onSecondary = "#000000";
  tertiary = "#ff00ff";
  onTertiary = "#000000";
  error = "#ff0000";
  onError = "#000000";
  inverseSurface = "#c0c0c0";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2a2a2a";
    red = "#ff0000";
    green = "#00ff00";
    yellow = "#ffff00";
    blue = "#0000ff";
    magenta = "#ff00ff";
    cyan = "#00ffff";
    white = "#c0c0c0";
    brightBlack = "#808080";
    brightRed = "#ff5c4a";
    brightGreen = "#aeffa7";
    brightYellow = "#ffffff";
    brightBlue = "#0a47ff";
    brightMagenta = "#ff6cfc";
    brightCyan = "#cdfffe";
    brightWhite = "#ffffff";
  };

  orange = "#808000";
  brightOrange = "#929225";
  cursor = "#0038ff";

  tools = {
    bat = "ansi";
  };
}
