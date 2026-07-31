# Eldritch -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/eldritch.yaml
# Author: https://github.com/eldritch-theme
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/eldritch.nix. Edits here are lost on the
# next run.

{
  name = "eldritch";
  displayName = "Eldritch";
  author = "https://github.com/eldritch-theme";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#212337";
  surfaceDim = "#141629";
  surfaceBright = "#4f5168";
  surfaceContainerLowest = "#141629";
  surfaceContainerLow = "#212337";
  surfaceContainer = "#323449";
  surfaceContainerHigh = "#404258";
  surfaceContainerHighest = "#4f5168";
  surfaceVariant = "#323449";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#ebfafa";
  onSurfaceMuted = "#c5d2ee";
  onSurfaceVariant = "#a1abe0";
  onSurfaceFaint = "#7081d0";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7081d0";
  outlineVariant = "#3b4261";

  # --- Accent roles -------------------------------------------------------
  primary = "#39ddfd";
  onPrimary = "#212337";
  primaryContainer = "#35647c";
  onPrimaryContainer = "#ffffff";
  secondary = "#04d1f9";
  onSecondary = "#212337";
  tertiary = "#a48cf2";
  onTertiary = "#212337";
  error = "#f16c75";
  onError = "#212337";
  inverseSurface = "#ebfafa";
  inverseOnSurface = "#212337";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#323449";
    red = "#f16c75";
    green = "#37f499";
    yellow = "#f1fc79";
    blue = "#39ddfd";
    magenta = "#a48cf2";
    cyan = "#04d1f9";
    white = "#ebfafa";
    brightBlack = "#7081d0";
    brightRed = "#ff858b";
    brightGreen = "#8fffbd";
    brightYellow = "#ffffff";
    brightBlue = "#93eaff";
    brightMagenta = "#b6a1ff";
    brightCyan = "#73e1ff";
    brightWhite = "#ffffff";
  };

  orange = "#f7c67f";
  brightOrange = "#ffddae";
  cursor = "#39ddfd";

  tools = {
    bat = "ansi";
  };
}
