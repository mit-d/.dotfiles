# Gruvbox Material Dark, Hard -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-material-dark-hard.yaml
# Author: Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-material-dark-hard.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-material-dark-hard";
  displayName = "Gruvbox Material Dark, Hard";
  author = "Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#202020";
  surfaceDim = "#181818";
  surfaceBright = "#3c3a39";
  surfaceContainerLowest = "#181818";
  surfaceContainerLow = "#202020";
  surfaceContainer = "#2a2827";
  surfaceContainerHigh = "#333130";
  surfaceContainerHighest = "#3c3a39";
  surfaceVariant = "#2a2827";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fbf1c7";
  onSurface = "#ddc7a1";
  onSurfaceMuted = "#cdba9a";
  onSurfaceVariant = "#bdae93";
  onSurfaceFaint = "#5c544e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#655c54";
  outlineVariant = "#504945";

  # --- Accent roles -------------------------------------------------------
  primary = "#7daea3";
  onPrimary = "#202020";
  primaryContainer = "#42514e";
  onPrimaryContainer = "#fbf1c7";
  secondary = "#89b482";
  onSecondary = "#202020";
  tertiary = "#d3869b";
  onTertiary = "#202020";
  error = "#ea6962";
  onError = "#202020";
  inverseSurface = "#ddc7a1";
  inverseOnSurface = "#202020";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2a2827";
    red = "#ea6962";
    green = "#a9b665";
    yellow = "#d8a657";
    blue = "#7daea3";
    magenta = "#d3869b";
    cyan = "#89b482";
    white = "#ddc7a1";
    brightBlack = "#5a524c";
    brightRed = "#ff7c74";
    brightGreen = "#bcc978";
    brightYellow = "#ecb96a";
    brightBlue = "#8fc1b6";
    brightMagenta = "#e798ae";
    brightCyan = "#9bc794";
    brightWhite = "#fbf1c7";
  };

  orange = "#e78a4e";
  brightOrange = "#fc9d61";
  cursor = "#7daea3";

  tools = {
    bat = "ansi";
  };
}
