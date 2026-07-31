# pinky -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/pinky.yaml
# Author: Benjamin (https://github.com/b3nj5m1n)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/pinky.nix. Edits here are lost on the
# next run.

{
  name = "pinky";
  displayName = "pinky";
  author = "Benjamin (https://github.com/b3nj5m1n)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#171517";
  surfaceDim = "#121012";
  surfaceBright = "#252225";
  surfaceContainerLowest = "#121012";
  surfaceContainerLow = "#171517";
  surfaceContainer = "#1b181b";
  surfaceContainerHigh = "#201d20";
  surfaceContainerHighest = "#252225";
  surfaceVariant = "#1b181b";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#f5f5f5";
  onSurfaceMuted = "#eee8e8";
  onSurfaceVariant = "#e7dbdb";
  onSurfaceFaint = "#524d52";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5a555a";
  outlineVariant = "#333133";

  # --- Accent roles -------------------------------------------------------
  primary = "#00ffff";
  onPrimary = "#171517";
  primaryContainer = "#2f6465";
  onPrimaryContainer = "#ffffff";
  secondary = "#6600ff";
  onSecondary = "#ffffff";
  tertiary = "#007fff";
  onTertiary = "#171517";
  error = "#ffa600";
  onError = "#171517";
  inverseSurface = "#f5f5f5";
  inverseOnSurface = "#171517";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1b181b";
    red = "#ffa600";
    green = "#ff0066";
    yellow = "#20df6c";
    blue = "#00ffff";
    magenta = "#007fff";
    cyan = "#6600ff";
    white = "#f5f5f5";
    brightBlack = "#383338";
    brightRed = "#ffc277";
    brightGreen = "#ff5c80";
    brightYellow = "#44f37f";
    brightBlue = "#cdfffe";
    brightMagenta = "#4596ff";
    brightCyan = "#7248ff";
    brightWhite = "#ffffff";
  };

  orange = "#00ff66";
  brightOrange = "#b1ffba";
  cursor = "#00ffff";

  tools = {
    bat = "ansi";
  };
}
