# Horizon Terminal Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/horizon-terminal-dark.yaml
# Author: Michael Ball (http://github.com/michael-ball/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/horizon-terminal-dark.nix. Edits here are lost on the
# next run.

{
  name = "horizon-terminal-dark";
  displayName = "Horizon Terminal Dark";
  author = "Michael Ball (http://github.com/michael-ball/)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1c1e26";
  surfaceDim = "#15171f";
  surfaceBright = "#323440";
  surfaceContainerLowest = "#15171f";
  surfaceContainerLow = "#1c1e26";
  surfaceContainer = "#232530";
  surfaceContainerHigh = "#2a2d38";
  surfaceContainerHighest = "#323440";
  surfaceVariant = "#232530";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e3e6ee";
  onSurface = "#cbced0";
  onSurfaceMuted = "#b4b7b9";
  onSurfaceVariant = "#9da0a2";
  onSurfaceFaint = "#6f6f70";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6f6f70";
  outlineVariant = "#343644";

  # --- Accent roles -------------------------------------------------------
  primary = "#26bbd9";
  onPrimary = "#1c1e26";
  primaryContainer = "#2c5564";
  onPrimaryContainer = "#e3e6ee";
  secondary = "#59e1e3";
  onSecondary = "#1c1e26";
  tertiary = "#ee64ac";
  onTertiary = "#1c1e26";
  error = "#e95678";
  onError = "#1c1e26";
  inverseSurface = "#cbced0";
  inverseOnSurface = "#1c1e26";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#232530";
    red = "#e95678";
    green = "#29d398";
    yellow = "#fac29a";
    blue = "#26bbd9";
    magenta = "#ee64ac";
    cyan = "#59e1e3";
    white = "#cbced0";
    brightBlack = "#6f6f70";
    brightRed = "#ff6a8a";
    brightGreen = "#48e7ab";
    brightYellow = "#ffdbc2";
    brightBlue = "#44cfed";
    brightMagenta = "#ff7cbe";
    brightCyan = "#70f5f7";
    brightWhite = "#e3e6ee";
  };

  orange = "#fab795";
  brightOrange = "#ffd1b9";
  cursor = "#26bbd9";

  tools = {
    bat = "ansi";
  };
}
