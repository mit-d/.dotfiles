# Tokyo Night Moon -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-night-moon.yaml
# Author: Olafur Bjarki Bogason
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-night-moon.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-night-moon";
  displayName = "Tokyo Night Moon";
  author = "Olafur Bjarki Bogason";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#222436";
  surfaceDim = "#1d1f30";
  surfaceBright = "#282b3b";
  surfaceContainerLowest = "#1d1f30";
  surfaceContainerLow = "#222436";
  surfaceContainer = "#1e2030";
  surfaceContainerHigh = "#232536";
  surfaceContainerHighest = "#282b3b";
  surfaceVariant = "#1e2030";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#c8d3f5";
  onSurface = "#828bb8";
  onSurfaceMuted = "#7680b2";
  onSurfaceVariant = "#6b76ad";
  onSurfaceFaint = "#515978";

  # --- Borders and dividers -----------------------------------------------
  outline = "#586181";
  outlineVariant = "#2d3f76";

  # --- Accent roles -------------------------------------------------------
  primary = "#82aaff";
  onPrimary = "#222436";
  primaryContainer = "#44537c";
  onPrimaryContainer = "#c8d3f5";
  secondary = "#86e1fc";
  onSecondary = "#222436";
  tertiary = "#fca7ea";
  onTertiary = "#222436";
  error = "#ff757f";
  onError = "#222436";
  inverseSurface = "#828bb8";
  inverseOnSurface = "#222436";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1e2030";
    red = "#ff757f";
    green = "#c3e88d";
    yellow = "#ffdf77";
    blue = "#82aaff";
    magenta = "#fca7ea";
    cyan = "#86e1fc";
    white = "#828bb8";
    brightBlack = "#3b4261";
    brightRed = "#ff999d";
    brightGreen = "#d6fca0";
    brightYellow = "#fff5d5";
    brightBlue = "#9fbfff";
    brightMagenta = "#ffc7f2";
    brightCyan = "#bcefff";
    brightWhite = "#c8d3f5";
  };

  orange = "#ffc777";
  brightOrange = "#ffe0b7";
  cursor = "#82aaff";

  tools = {
    bat = "ansi";
  };
}
