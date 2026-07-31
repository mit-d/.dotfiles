# Yesterday Bright -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/yesterday-bright.yaml
# Author: FroZnShiva (https://github.com/FroZnShiva)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/yesterday-bright.nix. Edits here are lost on the
# next run.

{
  name = "yesterday-bright";
  displayName = "Yesterday Bright";
  author = "FroZnShiva (https://github.com/FroZnShiva)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#343d46";
  surfaceDim = "#262f38";
  surfaceBright = "#6e7b86";
  surfaceContainerLowest = "#262f38";
  surfaceContainerLow = "#343d46";
  surfaceContainer = "#4f5b66";
  surfaceContainerHigh = "#5e6b76";
  surfaceContainerHighest = "#6e7b86";
  surfaceVariant = "#4f5b66";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#dfe1e8";
  onSurfaceMuted = "#cfd3db";
  onSurfaceVariant = "#c0c5ce";
  onSurfaceFaint = "#a7adba";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a7adba";
  outlineVariant = "#65737e";

  # --- Accent roles -------------------------------------------------------
  primary = "#7aa6da";
  onPrimary = "#323b43";
  primaryContainer = "#4e637b";
  onPrimaryContainer = "#ffffff";
  secondary = "#70c0b1";
  onSecondary = "#343d46";
  tertiary = "#c397d8";
  onTertiary = "#343d46";
  error = "#d54e53";
  onError = "#121211";
  inverseSurface = "#dfe1e8";
  inverseOnSurface = "#343d46";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#4f5b66";
    red = "#d54e53";
    green = "#b9ca4a";
    yellow = "#e7c547";
    blue = "#7aa6da";
    magenta = "#c397d8";
    cyan = "#70c0b1";
    white = "#dfe1e8";
    brightBlack = "#a7adba";
    brightRed = "#ea6164";
    brightGreen = "#ccde5f";
    brightYellow = "#fbd95d";
    brightBlue = "#8cb9ee";
    brightMagenta = "#d6aaec";
    brightCyan = "#83d3c4";
    brightWhite = "#ffffff";
  };

  orange = "#e78c45";
  brightOrange = "#fc9f59";
  cursor = "#7aa6da";

  tools = {
    bat = "ansi";
  };
}
