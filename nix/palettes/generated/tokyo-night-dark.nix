# Tokyo Night Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-night-dark.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-night-dark.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-night-dark";
  displayName = "Tokyo Night Dark";
  author = "Michael Ball";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1a1b26";
  surfaceDim = "#151621";
  surfaceBright = "#202029";
  surfaceContainerLowest = "#151621";
  surfaceContainerLow = "#1a1b26";
  surfaceContainer = "#16161e";
  surfaceContainerHigh = "#1b1b23";
  surfaceContainerHighest = "#202029";
  surfaceVariant = "#16161e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d5d6db";
  onSurface = "#a9b1d6";
  onSurfaceMuted = "#9096b7";
  onSurfaceVariant = "#787c99";
  onSurfaceFaint = "#4b516f";

  # --- Borders and dividers -----------------------------------------------
  outline = "#535a76";
  outlineVariant = "#2f3549";

  # --- Accent roles -------------------------------------------------------
  primary = "#2ac3de";
  onPrimary = "#1a1b26";
  primaryContainer = "#2c5566";
  onPrimaryContainer = "#d5d6db";
  secondary = "#b4f9f8";
  onSecondary = "#1a1b26";
  tertiary = "#bb9af7";
  onTertiary = "#1a1b26";
  error = "#c0caf5";
  onError = "#1a1b26";
  inverseSurface = "#a9b1d6";
  inverseOnSurface = "#1a1b26";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#16161e";
    red = "#c0caf5";
    green = "#9ece6a";
    yellow = "#0db9d7";
    blue = "#2ac3de";
    magenta = "#bb9af7";
    cyan = "#b4f9f8";
    white = "#a9b1d6";
    brightBlack = "#444b6a";
    brightRed = "#d6deff";
    brightGreen = "#b1e27d";
    brightYellow = "#37cdeb";
    brightBlue = "#48d7f2";
    brightMagenta = "#ccb1ff";
    brightCyan = "#faffff";
    brightWhite = "#d5d6db";
  };

  orange = "#a9b1d6";
  brightOrange = "#bcc4ea";
  cursor = "#2ac3de";

  tools = {
    bat = "ansi";
  };
}
