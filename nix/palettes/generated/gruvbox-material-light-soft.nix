# Gruvbox Material Light, Soft -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-material-light-soft.yaml
# Author: Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-material-light-soft.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-material-light-soft";
  displayName = "Gruvbox Material Light, Soft";
  author = "Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f2e5bc";
  surfaceDim = "#fbeec5";
  surfaceBright = "#d9c9a0";
  surfaceContainerLowest = "#fbeec5";
  surfaceContainerLow = "#f2e5bc";
  surfaceContainer = "#ebdbb2";
  surfaceContainerHigh = "#e2d2a9";
  surfaceContainerHighest = "#d9c9a0";
  surfaceVariant = "#ebdbb2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#282828";
  onSurface = "#654735";
  onSurfaceMuted = "#665245";
  onSurfaceVariant = "#665c54";
  onSurfaceFaint = "#a89984";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9d8f7c";
  outlineVariant = "#c9b99a";

  # --- Accent roles -------------------------------------------------------
  primary = "#45707a";
  onPrimary = "#f4e9c8";
  primaryContainer = "#afb7a4";
  onPrimaryContainer = "#282828";
  secondary = "#4c7a5d";
  onSecondary = "#faf4e4";
  tertiary = "#945e80";
  onTertiary = "#f9f2de";
  error = "#c14a4a";
  onError = "#fbf7e9";
  inverseSurface = "#654735";
  inverseOnSurface = "#f2e5bc";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ebdbb2";
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
