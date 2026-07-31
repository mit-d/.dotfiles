# Tokyo Night Storm -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-night-storm.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-night-storm.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-night-storm";
  displayName = "Tokyo Night Storm";
  author = "Michael Ball";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#24283b";
  surfaceDim = "#171b2d";
  surfaceBright = "#303039";
  surfaceContainerLowest = "#171b2d";
  surfaceContainerLow = "#24283b";
  surfaceContainer = "#16161e";
  surfaceContainerHigh = "#23232b";
  surfaceContainerHighest = "#303039";
  surfaceVariant = "#16161e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d5d6db";
  onSurface = "#a9b1d6";
  onSurfaceMuted = "#9096b7";
  onSurfaceVariant = "#787c99";
  onSurfaceFaint = "#555c78";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5e647f";
  outlineVariant = "#393f56";

  # --- Accent roles -------------------------------------------------------
  primary = "#2ac3de";
  onPrimary = "#24283b";
  primaryContainer = "#325e75";
  onPrimaryContainer = "#d5d6db";
  secondary = "#b4f9f8";
  onSecondary = "#24283b";
  tertiary = "#bb9af7";
  onTertiary = "#24283b";
  error = "#c0caf5";
  onError = "#24283b";
  inverseSurface = "#a9b1d6";
  inverseOnSurface = "#24283b";

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
