# Katy -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/katy.yaml
# Author: George Essig (https://github.com/gessig)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/katy.nix. Edits here are lost on the
# next run.

{
  name = "katy";
  displayName = "Katy";
  author = "George Essig (https://github.com/gessig)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#292d3e";
  surfaceDim = "#1c2030";
  surfaceBright = "#626088";
  surfaceContainerLowest = "#1c2030";
  surfaceContainerLow = "#292d3e";
  surfaceContainer = "#444267";
  surfaceContainerHigh = "#535177";
  surfaceContainerHighest = "#626088";
  surfaceVariant = "#444267";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#959dcb";
  onSurfaceMuted = "#8e9abd";
  onSurfaceVariant = "#8796b0";
  onSurfaceFaint = "#676e95";

  # --- Borders and dividers -----------------------------------------------
  outline = "#676e95";
  outlineVariant = "#5c598b";

  # --- Accent roles -------------------------------------------------------
  primary = "#82aaff";
  onPrimary = "#292d3e";
  primaryContainer = "#495982";
  onPrimaryContainer = "#ffffff";
  secondary = "#83b7e5";
  onSecondary = "#292d3e";
  tertiary = "#c792ea";
  onTertiary = "#292d3e";
  error = "#6e98e1";
  onError = "#292d3e";
  inverseSurface = "#959dcb";
  inverseOnSurface = "#292d3e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#444267";
    red = "#6e98e1";
    green = "#78c06e";
    yellow = "#e0a557";
    blue = "#82aaff";
    magenta = "#c792ea";
    cyan = "#83b7e5";
    white = "#959dcb";
    brightBlack = "#676e95";
    brightRed = "#80abf5";
    brightGreen = "#8bd480";
    brightYellow = "#f4b86a";
    brightBlue = "#9fbfff";
    brightMagenta = "#dba5fe";
    brightCyan = "#96caf9";
    brightWhite = "#ffffff";
  };

  orange = "#f78c6c";
  brightOrange = "#ffa78c";
  cursor = "#82aaff";

  tools = {
    bat = "ansi";
  };
}
