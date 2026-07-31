# Lichen Chartreuse Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/lichen-chartreuse-light.yaml
# Author: Aaron Colichia (https://aaron.colichia.org/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/lichen-chartreuse-light.nix. Edits here are lost on the
# next run.

{
  name = "lichen-chartreuse-light";
  displayName = "Lichen Chartreuse Light";
  author = "Aaron Colichia (https://aaron.colichia.org/)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f5f7f2";
  surfaceDim = "#fefffd";
  surfaceBright = "#dbded6";
  surfaceContainerLowest = "#fefffd";
  surfaceContainerLow = "#f5f7f2";
  surfaceContainer = "#ecefe7";
  surfaceContainerHigh = "#e4e7df";
  surfaceContainerHighest = "#dbded6";
  surfaceVariant = "#ecefe7";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#151613";
  onSurface = "#2d302b";
  onSurfaceMuted = "#3d403a";
  onSurfaceVariant = "#4e5149";
  onSurfaceFaint = "#687161";

  # --- Borders and dividers -----------------------------------------------
  outline = "#687161";
  outlineVariant = "#c6d9a6";

  # --- Accent roles -------------------------------------------------------
  primary = "#356e8a";
  onPrimary = "#f5f7f2";
  primaryContainer = "#abc1ca";
  onPrimaryContainer = "#151613";
  secondary = "#356569";
  onSecondary = "#f5f7f2";
  tertiary = "#6e5689";
  onTertiary = "#f5f7f2";
  error = "#a34740";
  onError = "#f5f7f2";
  inverseSurface = "#2d302b";
  inverseOnSurface = "#f5f7f2";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ecefe7";
    red = "#a34740";
    green = "#2f7462";
    yellow = "#506b29";
    blue = "#356e8a";
    magenta = "#6e5689";
    cyan = "#356569";
    white = "#2d302b";
    brightBlack = "#687161";
    brightRed = "#8f3530";
    brightGreen = "#1a6351";
    brightYellow = "#405a16";
    brightBlue = "#225d78";
    brightMagenta = "#5d4577";
    brightCyan = "#235458";
    brightWhite = "#151613";
  };

  orange = "#8b5d27";
  brightOrange = "#794c12";
  cursor = "#356e8a";

  tools = {
    bat = "ansi";
  };
}
