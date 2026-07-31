# Yesterday Night -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/yesterday-night.yaml
# Author: FroZnShiva (https://github.com/FroZnShiva)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/yesterday-night.nix. Edits here are lost on the
# next run.

{
  name = "yesterday-night";
  displayName = "Yesterday Night";
  author = "FroZnShiva (https://github.com/FroZnShiva)";
  variant = "dark";
  version = "3.1.0";

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
  primary = "#81a2be";
  onPrimary = "#ffffff";
  primaryContainer = "#506171";
  onPrimaryContainer = "#ffffff";
  secondary = "#8abeb7";
  onSecondary = "#343d46";
  tertiary = "#b294bb";
  onTertiary = "#ffffff";
  error = "#cc6666";
  onError = "#ffffff";
  inverseSurface = "#dfe1e8";
  inverseOnSurface = "#343d46";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#4f5b66";
    red = "#cc6666";
    green = "#b5bd68";
    yellow = "#f0c674";
    blue = "#81a2be";
    magenta = "#b294bb";
    cyan = "#8abeb7";
    white = "#dfe1e8";
    brightBlack = "#a7adba";
    brightRed = "#e17878";
    brightGreen = "#c8d07b";
    brightYellow = "#ffdb96";
    brightBlue = "#93b5d1";
    brightMagenta = "#c5a7ce";
    brightCyan = "#9dd1ca";
    brightWhite = "#ffffff";
  };

  orange = "#de935f";
  brightOrange = "#f2a672";
  cursor = "#81a2be";

  tools = {
    bat = "ansi";
  };
}
