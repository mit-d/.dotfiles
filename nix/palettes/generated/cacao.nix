# Cacao -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/cacao.yaml
# Author: Teshre
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/cacao.nix. Edits here are lost on the
# next run.

{
  name = "cacao";
  displayName = "Cacao";
  author = "Teshre";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#160f0c";
  surfaceDim = "#0b0604";
  surfaceBright = "#3d312a";
  surfaceContainerLowest = "#0b0604";
  surfaceContainerLow = "#160f0c";
  surfaceContainer = "#241913";
  surfaceContainerHigh = "#30251e";
  surfaceContainerHighest = "#3d312a";
  surfaceVariant = "#241913";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f4e6d6";
  onSurface = "#e8d6c4";
  onSurfaceMuted = "#cbb8a7";
  onSurfaceVariant = "#af9b8b";
  onSurfaceFaint = "#766052";

  # --- Borders and dividers -----------------------------------------------
  outline = "#766052";
  outlineVariant = "#3d2b20";

  # --- Accent roles -------------------------------------------------------
  primary = "#a89ad0";
  onPrimary = "#160f0c";
  primaryContainer = "#483f4e";
  onPrimaryContainer = "#f4e6d6";
  secondary = "#74c8b0";
  onSecondary = "#160f0c";
  tertiary = "#ce8ab0";
  onTertiary = "#160f0c";
  error = "#e0705c";
  onError = "#160f0c";
  inverseSurface = "#e8d6c4";
  inverseOnSurface = "#160f0c";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#241913";
    red = "#e0705c";
    green = "#9ac97a";
    yellow = "#e8a84a";
    blue = "#a89ad0";
    magenta = "#ce8ab0";
    cyan = "#74c8b0";
    white = "#e8d6c4";
    brightBlack = "#766052";
    brightRed = "#f5836e";
    brightGreen = "#addd8d";
    brightYellow = "#fcbb5f";
    brightBlue = "#bbade4";
    brightMagenta = "#e29dc3";
    brightCyan = "#87dcc3";
    brightWhite = "#f4e6d6";
  };

  orange = "#c77b4a";
  brightOrange = "#db8d5c";
  cursor = "#a89ad0";

  tools = {
    bat = "ansi";
  };
}
