# Gruvbox Material Dark, Medium -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-material-dark-medium.yaml
# Author: Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-material-dark-medium.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-material-dark-medium";
  displayName = "Gruvbox Material Dark, Medium";
  author = "Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#292828";
  surfaceDim = "#212020";
  surfaceBright = "#434140";
  surfaceContainerLowest = "#212020";
  surfaceContainerLow = "#292828";
  surfaceContainer = "#32302f";
  surfaceContainerHigh = "#3a3837";
  surfaceContainerHighest = "#434140";
  surfaceVariant = "#32302f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fbf1c7";
  onSurface = "#ddc7a1";
  onSurfaceMuted = "#cdba9a";
  onSurfaceVariant = "#bdae93";
  onSurfaceFaint = "#665c54";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6d6359";
  outlineVariant = "#504945";

  # --- Accent roles -------------------------------------------------------
  primary = "#7daea3";
  onPrimary = "#292828";
  primaryContainer = "#485753";
  onPrimaryContainer = "#fbf1c7";
  secondary = "#89b482";
  onSecondary = "#292828";
  tertiary = "#d3869b";
  onTertiary = "#292828";
  error = "#ea6962";
  onError = "#292828";
  inverseSurface = "#ddc7a1";
  inverseOnSurface = "#292828";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#32302f";
    red = "#ea6962";
    green = "#a9b665";
    yellow = "#d8a657";
    blue = "#7daea3";
    magenta = "#d3869b";
    cyan = "#89b482";
    white = "#ddc7a1";
    brightBlack = "#665c54";
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
