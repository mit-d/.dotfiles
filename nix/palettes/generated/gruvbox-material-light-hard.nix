# Gruvbox Material Light, Hard -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-material-light-hard.yaml
# Author: Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-material-light-hard.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-material-light-hard";
  displayName = "Gruvbox Material Light, Hard";
  author = "Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f9f5d7";
  surfaceDim = "#fffce5";
  surfaceBright = "#ece2b9";
  surfaceContainerLowest = "#fffce5";
  surfaceContainerLow = "#f9f5d7";
  surfaceContainer = "#fbf1c7";
  surfaceContainerHigh = "#f4eac0";
  surfaceContainerHighest = "#ece2b9";
  surfaceVariant = "#fbf1c7";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#282828";
  onSurface = "#654735";
  onSurfaceMuted = "#8a755f";
  onSurfaceVariant = "#8a816e";
  onSurfaceFaint = "#a89984";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a89984";
  outlineVariant = "#e0cfa9";

  # --- Accent roles -------------------------------------------------------
  primary = "#45707a";
  onPrimary = "#f9f5d7";
  primaryContainer = "#b3c1b3";
  onPrimaryContainer = "#282828";
  secondary = "#4c7a5d";
  onSecondary = "#f9f5d8";
  tertiary = "#945e80";
  onTertiary = "#f9f5d7";
  error = "#c14a4a";
  onError = "#fbf8e1";
  inverseSurface = "#654735";
  inverseOnSurface = "#f9f5d7";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#fbf1c7";
    red = "#c14a4a";
    green = "#6c782e";
    yellow = "#b47109";
    blue = "#45707a";
    magenta = "#945e80";
    cyan = "#4c7a5d";
    white = "#654735";
    brightBlack = "#a89984";
    brightRed = "#ac3739";
    brightGreen = "#5b661a";
    brightYellow = "#9d6100";
    brightBlue = "#345f69";
    brightMagenta = "#814d6e";
    brightCyan = "#3b684c";
    brightWhite = "#282828";
  };

  orange = "#c35e0a";
  brightOrange = "#aa5000";
  cursor = "#45707a";

  tools = {
    bat = "ansi";
  };
}
