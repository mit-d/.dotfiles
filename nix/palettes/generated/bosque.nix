# Bosque -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/bosque.yaml
# Author: Teshre
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/bosque.nix. Edits here are lost on the
# next run.

{
  name = "bosque";
  displayName = "Bosque";
  author = "Teshre";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0e1410";
  surfaceDim = "#050906";
  surfaceBright = "#2f3b33";
  surfaceContainerLowest = "#050906";
  surfaceContainerLow = "#0e1410";
  surfaceContainer = "#16211a";
  surfaceContainerHigh = "#222e26";
  surfaceContainerHighest = "#2f3b33";
  surfaceVariant = "#16211a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e4f0e2";
  onSurface = "#cfe5d2";
  onSurfaceMuted = "#b2c7b5";
  onSurfaceVariant = "#96aa98";
  onSurfaceFaint = "#5c6e5e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5c6e5e";
  outlineVariant = "#223326";

  # --- Accent roles -------------------------------------------------------
  primary = "#6dae9e";
  onPrimary = "#0e1410";
  primaryContainer = "#2f4940";
  onPrimaryContainer = "#e4f0e2";
  secondary = "#5fd0b8";
  onSecondary = "#0e1410";
  tertiary = "#b894d0";
  onTertiary = "#0e1410";
  error = "#e2706a";
  onError = "#0e1410";
  inverseSurface = "#cfe5d2";
  inverseOnSurface = "#0e1410";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#16211a";
    red = "#e2706a";
    green = "#6fc56e";
    yellow = "#c8b84a";
    blue = "#6dae9e";
    magenta = "#b894d0";
    cyan = "#5fd0b8";
    white = "#cfe5d2";
    brightBlack = "#5c6e5e";
    brightRed = "#f7837c";
    brightGreen = "#82d981";
    brightYellow = "#dbcb5f";
    brightBlue = "#80c1b1";
    brightMagenta = "#cba7e4";
    brightCyan = "#74e4cb";
    brightWhite = "#e4f0e2";
  };

  orange = "#7dc97a";
  brightOrange = "#90dd8d";
  cursor = "#6dae9e";

  tools = {
    bat = "ansi";
  };
}
