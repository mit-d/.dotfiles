# Da One Paper -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/da-one-paper.yaml
# Author: NNB (https://github.com/NNBnh)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/da-one-paper.nix. Edits here are lost on the
# next run.

{
  name = "da-one-paper";
  displayName = "Da One Paper";
  author = "NNB (https://github.com/NNBnh)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#faf0dc";
  surfaceDim = "#ffffff";
  surfaceBright = "#a5a5a5";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#faf0dc";
  surfaceContainer = "#c8c8c8";
  surfaceContainerHigh = "#b6b6b6";
  surfaceContainerHighest = "#a5a5a5";
  surfaceVariant = "#c8c8c8";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#000000";
  onSurface = "#181818";
  onSurfaceMuted = "#202020";
  onSurfaceVariant = "#282828";
  onSurfaceFaint = "#585858";

  # --- Borders and dividers -----------------------------------------------
  outline = "#585858";
  outlineVariant = "#888888";

  # --- Accent roles -------------------------------------------------------
  primary = "#5890f8";
  onPrimary = "#000000";
  primaryContainer = "#bcceeb";
  onPrimaryContainer = "#000000";
  secondary = "#64b5a7";
  onSecondary = "#000000";
  tertiary = "#c173d1";
  onTertiary = "#000000";
  error = "#de5d6e";
  onError = "#000000";
  inverseSurface = "#181818";
  inverseOnSurface = "#faf0dc";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#c8c8c8";
    red = "#de5d6e";
    green = "#76a85d";
    yellow = "#b3684f";
    blue = "#5890f8";
    magenta = "#c173d1";
    cyan = "#64b5a7";
    white = "#181818";
    brightBlack = "#585858";
    brightRed = "#c94a5d";
    brightGreen = "#64954b";
    brightYellow = "#9f563e";
    brightBlue = "#477de3";
    brightMagenta = "#ae61bd";
    brightCyan = "#51a295";
    brightWhite = "#000000";
  };

  orange = "#ff9470";
  brightOrange = "#ea815e";
  cursor = "#5489ed";

  tools = {
    bat = "ansi";
  };
}
