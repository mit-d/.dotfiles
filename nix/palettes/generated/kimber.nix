# Kimber -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/kimber.yaml
# Author: Mishka Nguyen (https://github.com/akhsiM)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/kimber.nix. Edits here are lost on the
# next run.

{
  name = "kimber";
  displayName = "Kimber";
  author = "Mishka Nguyen (https://github.com/akhsiM)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#222222";
  surfaceDim = "#151515";
  surfaceBright = "#4e4e4e";
  surfaceContainerLowest = "#151515";
  surfaceContainerLow = "#222222";
  surfaceContainer = "#313131";
  surfaceContainerHigh = "#3f3f3f";
  surfaceContainerHighest = "#4e4e4e";
  surfaceVariant = "#313131";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffe6";
  onSurface = "#dedee7";
  onSurfaceMuted = "#99999e";
  onSurfaceVariant = "#767672";
  onSurfaceFaint = "#6d504f";

  # --- Borders and dividers -----------------------------------------------
  outline = "#745956";
  outlineVariant = "#555d55";

  # --- Accent roles -------------------------------------------------------
  primary = "#537c9c";
  onPrimary = "#ffffff";
  primaryContainer = "#35424d";
  onPrimaryContainer = "#ffffe6";
  secondary = "#78b4b4";
  onSecondary = "#222222";
  tertiary = "#86cacd";
  onTertiary = "#222222";
  error = "#c88c8c";
  onError = "#222222";
  inverseSurface = "#dedee7";
  inverseOnSurface = "#222222";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#313131";
    red = "#c88c8c";
    green = "#99c899";
    yellow = "#d8b56d";
    blue = "#537c9c";
    magenta = "#86cacd";
    cyan = "#78b4b4";
    white = "#dedee7";
    brightBlack = "#644646";
    brightRed = "#dc9e9e";
    brightGreen = "#acdcac";
    brightYellow = "#ecc880";
    brightBlue = "#648eaf";
    brightMagenta = "#99dee1";
    brightCyan = "#8bc7c7";
    brightWhite = "#ffffe6";
  };

  orange = "#476c88";
  brightOrange = "#587e9a";
  cursor = "#537c9c";

  tools = {
    bat = "ansi";
  };
}
