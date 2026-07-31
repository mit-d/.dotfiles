# Yesterday -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/yesterday.yaml
# Author: FroZnShiva (https://github.com/FroZnShiva)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/yesterday.nix. Edits here are lost on the
# next run.

{
  name = "yesterday";
  displayName = "Yesterday";
  author = "FroZnShiva (https://github.com/FroZnShiva)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1d1f21";
  surfaceDim = "#121416";
  surfaceBright = "#404246";
  surfaceContainerLowest = "#121416";
  surfaceContainerLow = "#1d1f21";
  surfaceContainer = "#282a2e";
  surfaceContainerHigh = "#34363a";
  surfaceContainerHighest = "#404246";
  surfaceVariant = "#282a2e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#d6d6d6";
  onSurfaceMuted = "#b1b2b0";
  onSurfaceVariant = "#8e908c";
  onSurfaceFaint = "#8d908e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#969896";
  outlineVariant = "#4d4d4c";

  # --- Accent roles -------------------------------------------------------
  primary = "#4271ae";
  onPrimary = "#ffffff";
  primaryContainer = "#2c3d53";
  onPrimaryContainer = "#ffffff";
  secondary = "#3e999f";
  onSecondary = "#1d1f21";
  tertiary = "#8959a8";
  onTertiary = "#ffffff";
  error = "#c82829";
  onError = "#ffffff";
  inverseSurface = "#d6d6d6";
  inverseOnSurface = "#1d1f21";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282a2e";
    red = "#c82829";
    green = "#718c00";
    yellow = "#eab700";
    blue = "#4271ae";
    magenta = "#8959a8";
    cyan = "#3e999f";
    white = "#d6d6d6";
    brightBlack = "#969896";
    brightRed = "#de403b";
    brightGreen = "#829f26";
    brightYellow = "#fecb32";
    brightBlue = "#5383c1";
    brightMagenta = "#9b6bbb";
    brightCyan = "#52acb2";
    brightWhite = "#ffffff";
  };

  orange = "#f5871f";
  brightOrange = "#ffa158";
  cursor = "#4271ae";

  tools = {
    bat = "ansi";
  };
}
