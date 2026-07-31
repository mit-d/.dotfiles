# Apprentice -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/apprentice.yaml
# Author: romainl
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/apprentice.nix. Edits here are lost on the
# next run.

{
  name = "apprentice";
  displayName = "Apprentice";
  author = "romainl";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#262626";
  surfaceDim = "#191919";
  surfaceBright = "#d4807f";
  surfaceContainerLowest = "#191919";
  surfaceContainerLow = "#262626";
  surfaceContainer = "#af5f5f";
  surfaceContainerHigh = "#c16f6f";
  surfaceContainerHighest = "#d4807f";
  surfaceVariant = "#af5f5f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#9db5b5";
  onSurface = "#898aa8";
  onSurfaceMuted = "#7283a7";
  onSurfaceVariant = "#5f87af";
  onSurfaceFaint = "#86865e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#87875f";
  outlineVariant = "#5f875f";

  # --- Accent roles -------------------------------------------------------
  primary = "#8787af";
  onPrimary = "#ffffff";
  primaryContainer = "#484956";
  onPrimaryContainer = "#a7bdbc";
  secondary = "#87afd7";
  onSecondary = "#262626";
  tertiary = "#5fafaf";
  onTertiary = "#262626";
  error = "#444444";
  onError = "#9db5b5";
  inverseSurface = "#898aa8";
  inverseOnSurface = "#262626";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#af5f5f";
    red = "#444444";
    green = "#ffffaf";
    yellow = "#87af87";
    blue = "#8787af";
    magenta = "#5fafaf";
    cyan = "#87afd7";
    white = "#5f5f87";
    brightBlack = "#87875f";
    brightRed = "#545454";
    brightGreen = "#ebeb9c";
    brightYellow = "#99c299";
    brightBlue = "#9999c2";
    brightMagenta = "#72c2c2";
    brightCyan = "#99c2eb";
    brightWhite = "#5f8787";
  };

  orange = "#ff8700";
  brightOrange = "#ffa766";
  cursor = "#8787af";

  tools = {
    bat = "ansi";
  };
}
