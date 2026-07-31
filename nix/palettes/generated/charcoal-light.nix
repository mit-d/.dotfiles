# Charcoal Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/charcoal-light.yaml
# Author: Mubin Muhammad (https://github.com/mubin6th)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/charcoal-light.nix. Edits here are lost on the
# next run.

{
  name = "charcoal-light";
  displayName = "Charcoal Light";
  author = "Mubin Muhammad (https://github.com/mubin6th)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#cabda0";
  surfaceDim = "#dacdb0";
  surfaceBright = "#9d8e6e";
  surfaceContainerLowest = "#dacdb0";
  surfaceContainerLow = "#cabda0";
  surfaceContainer = "#bcad8c";
  surfaceContainerHigh = "#ac9e7d";
  surfaceContainerHighest = "#9d8e6e";
  surfaceVariant = "#bcad8c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#382e1b";
  onSurface = "#382e1b";
  onSurfaceMuted = "#362f1f";
  onSurfaceVariant = "#343023";
  onSurfaceFaint = "#645538";

  # --- Borders and dividers -----------------------------------------------
  outline = "#645538";
  outlineVariant = "#ae9f7d";

  # --- Accent roles -------------------------------------------------------
  primary = "#251e0f";
  onPrimary = "#cabda0";
  primaryContainer = "#867b64";
  onPrimaryContainer = "#161108";
  secondary = "#110e06";
  onSecondary = "#cabda0";
  tertiary = "#382e1b";
  onTertiary = "#cabda0";
  error = "#382e1b";
  onError = "#cabda0";
  inverseSurface = "#382e1b";
  inverseOnSurface = "#cabda0";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#bcad8c";
    red = "#382e1b";
    green = "#110e06";
    yellow = "#110e06";
    blue = "#251e0f";
    magenta = "#382e1b";
    cyan = "#110e06";
    white = "#382e1b";
    brightBlack = "#645538";
    brightRed = "#291f0d";
    brightGreen = "#050401";
    brightYellow = "#050401";
    brightBlue = "#171003";
    brightMagenta = "#291f0d";
    brightCyan = "#050401";
    brightWhite = "#291f0d";
  };

  orange = "#110e06";
  brightOrange = "#050401";
  cursor = "#251e0f";

  tools = {
    bat = "ansi";
  };
}
