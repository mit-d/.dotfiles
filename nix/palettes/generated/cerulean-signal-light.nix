# Cerulean Signal Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/cerulean-signal-light.yaml
# Author: Aaron Colichia (https://aaron.colichia.org/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/cerulean-signal-light.nix. Edits here are lost on the
# next run.

{
  name = "cerulean-signal-light";
  displayName = "Cerulean Signal Light";
  author = "Aaron Colichia (https://aaron.colichia.org/)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f7f9fc";
  surfaceDim = "#ffffff";
  surfaceBright = "#dfe5ec";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f7f9fc";
  surfaceContainer = "#eef4fb";
  surfaceContainerHigh = "#e7edf4";
  surfaceContainerHighest = "#dfe5ec";
  surfaceVariant = "#eef4fb";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#141d2a";
  onSurface = "#232b38";
  onSurfaceMuted = "#3c4757";
  onSurfaceVariant = "#566579";
  onSurfaceFaint = "#637287";

  # --- Borders and dividers -----------------------------------------------
  outline = "#637287";
  outlineVariant = "#ccd6e0";

  # --- Accent roles -------------------------------------------------------
  primary = "#006fa8";
  onPrimary = "#f7f9fc";
  primaryContainer = "#a5c4dd";
  onPrimaryContainer = "#141d2a";
  secondary = "#00727e";
  onSecondary = "#f7f9fc";
  tertiary = "#a0007d";
  onTertiary = "#f7f9fc";
  error = "#b4233d";
  onError = "#f7f9fc";
  inverseSurface = "#232b38";
  inverseOnSurface = "#f7f9fc";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#eef4fb";
    red = "#b4233d";
    green = "#17795e";
    yellow = "#6f6300";
    blue = "#006fa8";
    magenta = "#a0007d";
    cyan = "#00727e";
    white = "#232b38";
    brightBlack = "#637287";
    brightRed = "#9f002d";
    brightGreen = "#00674e";
    brightYellow = "#5c5200";
    brightBlue = "#005d8e";
    brightMagenta = "#850067";
    brightCyan = "#005f6a";
    brightWhite = "#141d2a";
  };

  orange = "#9a4f00";
  brightOrange = "#824200";
  cursor = "#006fa8";

  tools = {
    bat = "ansi";
  };
}
