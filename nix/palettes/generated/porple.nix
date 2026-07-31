# Porple -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/porple.yaml
# Author: Niek den Breeje (https://github.com/AuditeMarlow)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/porple.nix. Edits here are lost on the
# next run.

{
  name = "porple";
  displayName = "Porple";
  author = "Niek den Breeje (https://github.com/AuditeMarlow)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#292c36";
  surfaceDim = "#21242d";
  surfaceBright = "#454557";
  surfaceContainerLowest = "#21242d";
  surfaceContainerLow = "#292c36";
  surfaceContainer = "#333344";
  surfaceContainerHigh = "#3c3c4d";
  surfaceContainerHighest = "#454557";
  surfaceVariant = "#333344";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f8f8f8";
  onSurface = "#d8d8d8";
  onSurfaceMuted = "#c8c8c8";
  onSurfaceVariant = "#b8b8b8";
  onSurfaceFaint = "#66578b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6e6092";
  outlineVariant = "#474160";

  # --- Accent roles -------------------------------------------------------
  primary = "#8485ce";
  onPrimary = "#ffffff";
  primaryContainer = "#494c6c";
  onPrimaryContainer = "#f8f8f8";
  secondary = "#64878f";
  onSecondary = "#ffffff";
  tertiary = "#b74989";
  onTertiary = "#f8f8f8";
  error = "#f84547";
  onError = "#ffffff";
  inverseSurface = "#d8d8d8";
  inverseOnSurface = "#292c36";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#333344";
    red = "#f84547";
    green = "#95c76f";
    yellow = "#efa16b";
    blue = "#8485ce";
    magenta = "#b74989";
    cyan = "#64878f";
    white = "#d8d8d8";
    brightBlack = "#65568a";
    brightRed = "#ff6d67";
    brightGreen = "#a8db82";
    brightYellow = "#ffb685";
    brightBlue = "#9697e2";
    brightMagenta = "#cb5c9b";
    brightCyan = "#7699a1";
    brightWhite = "#f8f8f8";
  };

  orange = "#d28e5d";
  brightOrange = "#e6a16f";
  cursor = "#8485ce";

  tools = {
    bat = "ansi";
  };
}
