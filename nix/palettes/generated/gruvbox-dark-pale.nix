# Gruvbox dark, pale -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-dark-pale.yaml
# Author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-dark-pale.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-dark-pale";
  displayName = "Gruvbox dark, pale";
  author = "Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#262626";
  surfaceDim = "#191919";
  surfaceBright = "#575757";
  surfaceContainerLowest = "#191919";
  surfaceContainerLow = "#262626";
  surfaceContainer = "#3a3a3a";
  surfaceContainerHigh = "#484848";
  surfaceContainerHighest = "#575757";
  surfaceVariant = "#3a3a3a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ebdbb2";
  onSurface = "#dab997";
  onSurfaceMuted = "#b7a796";
  onSurfaceVariant = "#949494";
  onSurfaceFaint = "#8a8a8a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#8a8a8a";
  outlineVariant = "#4e4e4e";

  # --- Accent roles -------------------------------------------------------
  primary = "#83adad";
  onPrimary = "#262626";
  primaryContainer = "#485555";
  onPrimaryContainer = "#ebdbb2";
  secondary = "#85ad85";
  onSecondary = "#262626";
  tertiary = "#d485ad";
  onTertiary = "#262626";
  error = "#d75f5f";
  onError = "#1e1e1e";
  inverseSurface = "#dab997";
  inverseOnSurface = "#262626";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3a3a3a";
    red = "#d75f5f";
    green = "#afaf00";
    yellow = "#ffaf00";
    blue = "#83adad";
    magenta = "#d485ad";
    cyan = "#85ad85";
    white = "#dab997";
    brightBlack = "#8a8a8a";
    brightRed = "#ec7271";
    brightGreen = "#c2c22e";
    brightYellow = "#ffca7d";
    brightBlue = "#95c0c0";
    brightMagenta = "#e898c0";
    brightCyan = "#97c097";
    brightWhite = "#ebdbb2";
  };

  orange = "#ff8700";
  brightOrange = "#ffa766";
  cursor = "#83adad";

  tools = {
    bat = "ansi";
  };
}
