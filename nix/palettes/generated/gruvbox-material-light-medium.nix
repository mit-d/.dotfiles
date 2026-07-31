# Gruvbox Material Light, Medium -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-material-light-medium.yaml
# Author: Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-material-light-medium.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-material-light-medium";
  displayName = "Gruvbox Material Light, Medium";
  author = "Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fbf1c7";
  surfaceDim = "#fffcee";
  surfaceBright = "#dccfa7";
  surfaceContainerLowest = "#fffcee";
  surfaceContainerLow = "#fbf1c7";
  surfaceContainer = "#f2e5bc";
  surfaceContainerHigh = "#e7dab1";
  surfaceContainerHighest = "#dccfa7";
  surfaceVariant = "#f2e5bc";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#282828";
  onSurface = "#654735";
  onSurfaceMuted = "#665245";
  onSurfaceVariant = "#665c54";
  onSurfaceFaint = "#b0a28a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a49882";
  outlineVariant = "#d5c4a1";

  # --- Accent roles -------------------------------------------------------
  primary = "#45707a";
  onPrimary = "#fbf1c7";
  primaryContainer = "#b4bfaa";
  onPrimaryContainer = "#282828";
  secondary = "#4c7a5d";
  onSecondary = "#fcf5d5";
  tertiary = "#945e80";
  onTertiary = "#fbf3cd";
  error = "#c14a4a";
  onError = "#fdf7df";
  inverseSurface = "#654735";
  inverseOnSurface = "#fbf1c7";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f2e5bc";
    red = "#c14a4a";
    green = "#6c782e";
    yellow = "#b47109";
    blue = "#45707a";
    magenta = "#945e80";
    cyan = "#4c7a5d";
    white = "#654735";
    brightBlack = "#bdae93";
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
