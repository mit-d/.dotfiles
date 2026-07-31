# Hardcore -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/hardcore.yaml
# Author: Chris Caller
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/hardcore.nix. Edits here are lost on the
# next run.

{
  name = "hardcore";
  displayName = "Hardcore";
  author = "Chris Caller";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#212121";
  surfaceDim = "#141414";
  surfaceBright = "#4d4d4d";
  surfaceContainerLowest = "#141414";
  surfaceContainerLow = "#212121";
  surfaceContainer = "#303030";
  surfaceContainerHigh = "#3e3e3e";
  surfaceContainerHighest = "#4d4d4d";
  surfaceVariant = "#303030";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#cdcdcd";
  onSurfaceMuted = "#9d9d9d";
  onSurfaceVariant = "#767575";
  onSurfaceFaint = "#575656";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5f5f5e";
  outlineVariant = "#3a3a3a";

  # --- Accent roles -------------------------------------------------------
  primary = "#66d9ef";
  onPrimary = "#212121";
  primaryContainer = "#3e6168";
  onPrimaryContainer = "#ffffff";
  secondary = "#708387";
  onSecondary = "#181717";
  tertiary = "#9e6ffe";
  onTertiary = "#212121";
  error = "#f92672";
  onError = "#1c1c1c";
  inverseSurface = "#cdcdcd";
  inverseOnSurface = "#212121";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#303030";
    red = "#f92672";
    green = "#a6e22e";
    yellow = "#e6db74";
    blue = "#66d9ef";
    magenta = "#9e6ffe";
    cyan = "#708387";
    white = "#cdcdcd";
    brightBlack = "#4a4a4a";
    brightRed = "#ff5d88";
    brightGreen = "#b9f64a";
    brightYellow = "#faef88";
    brightBlue = "#88ebff";
    brightMagenta = "#ad8bff";
    brightCyan = "#829599";
    brightWhite = "#ffffff";
  };

  orange = "#fd971f";
  brightOrange = "#ffb46f";
  cursor = "#66d9ef";

  tools = {
    bat = "ansi";
  };
}
