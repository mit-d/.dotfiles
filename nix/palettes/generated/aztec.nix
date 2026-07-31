# Aztec -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/aztec.yaml
# Author: TheNeverMan (github.com/TheNeverMan)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/aztec.nix. Edits here are lost on the
# next run.

{
  name = "aztec";
  displayName = "Aztec";
  author = "TheNeverMan (github.com/TheNeverMan)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#101600";
  surfaceDim = "#090e00";
  surfaceBright = "#2b3011";
  surfaceContainerLowest = "#090e00";
  surfaceContainerLow = "#101600";
  surfaceContainer = "#1a1e01";
  surfaceContainerHigh = "#222708";
  surfaceContainerHighest = "#2b3011";
  surfaceVariant = "#1a1e01";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffeba0";
  onSurface = "#ffda51";
  onSurfaceMuted = "#ffd640";
  onSurfaceVariant = "#ffd129";
  onSurfaceFaint = "#524f21";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5b5728";
  outlineVariant = "#31320d";

  # --- Accent roles -------------------------------------------------------
  primary = "#5b4a9f";
  onPrimary = "#ffeba0";
  primaryContainer = "#292c39";
  onPrimaryContainer = "#ffeba0";
  secondary = "#3d94a5";
  onSecondary = "#101600";
  tertiary = "#883e9f";
  onTertiary = "#ffeba0";
  error = "#ee2e00";
  onError = "#ffffff";
  inverseSurface = "#ffda51";
  inverseOnSurface = "#101600";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1a1e01";
    red = "#ee2e00";
    green = "#63d932";
    yellow = "#eebb00";
    blue = "#5b4a9f";
    magenta = "#883e9f";
    cyan = "#3d94a5";
    white = "#ffda51";
    brightBlack = "#2e2e05";
    brightRed = "#ff5031";
    brightGreen = "#77ed4b";
    brightYellow = "#ffd049";
    brightBlue = "#6b5cb2";
    brightMagenta = "#9b50b2";
    brightCyan = "#51a7b8";
    brightWhite = "#ffeba0";
  };

  orange = "#ee8800";
  brightOrange = "#ff9d3c";
  cursor = "#6556a1";

  tools = {
    bat = "ansi";
  };
}
