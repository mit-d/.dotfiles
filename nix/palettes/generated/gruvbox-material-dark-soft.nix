# Gruvbox Material Dark, Soft -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-material-dark-soft.yaml
# Author: Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-material-dark-soft.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-material-dark-soft";
  displayName = "Gruvbox Material Dark, Soft";
  author = "Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#32302f";
  surfaceDim = "#2a2827";
  surfaceBright = "#4e4947";
  surfaceContainerLowest = "#2a2827";
  surfaceContainerLow = "#32302f";
  surfaceContainer = "#3c3836";
  surfaceContainerHigh = "#45413f";
  surfaceContainerHighest = "#4e4947";
  surfaceVariant = "#3c3836";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fbf1c7";
  onSurface = "#ddc7a1";
  onSurfaceMuted = "#cdba9a";
  onSurfaceVariant = "#bdae93";
  onSurfaceFaint = "#7c6f64";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7c6f64";
  outlineVariant = "#5a524c";

  # --- Accent roles -------------------------------------------------------
  primary = "#7daea3";
  onPrimary = "#32302f";
  primaryContainer = "#4e5d58";
  onPrimaryContainer = "#fbf1c7";
  secondary = "#89b482";
  onSecondary = "#32302f";
  tertiary = "#d3869b";
  onTertiary = "#32302f";
  error = "#ea6962";
  onError = "#ffffff";
  inverseSurface = "#ddc7a1";
  inverseOnSurface = "#32302f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3c3836";
    red = "#ea6962";
    green = "#a9b665";
    yellow = "#d8a657";
    blue = "#7daea3";
    magenta = "#d3869b";
    cyan = "#89b482";
    white = "#ddc7a1";
    brightBlack = "#7c6f64";
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
