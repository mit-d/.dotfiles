# Monokai -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/monokai.yaml
# Author: Wimer Hazenberg (http://www.monokai.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/monokai.nix. Edits here are lost on the
# next run.

{
  name = "monokai";
  displayName = "Monokai";
  author = "Wimer Hazenberg (http://www.monokai.nl)";
  variant = "dark";
  version = "3.2.1";

  # --- Surfaces -----------------------------------------------------------
  surface = "#272822";
  surfaceDim = "#1a1b15";
  surfaceBright = "#55554d";
  surfaceContainerLowest = "#1a1b15";
  surfaceContainerLow = "#272822";
  surfaceContainer = "#383830";
  surfaceContainerHigh = "#46463e";
  surfaceContainerHighest = "#55554d";
  surfaceVariant = "#383830";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f9f8f5";
  onSurface = "#f8f8f2";
  onSurfaceMuted = "#cecbba";
  onSurfaceVariant = "#a59f85";
  onSurfaceFaint = "#75715e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#75715e";
  outlineVariant = "#49483e";

  # --- Accent roles -------------------------------------------------------
  primary = "#66d9ef";
  onPrimary = "#272822";
  primaryContainer = "#426669";
  onPrimaryContainer = "#f9f8f5";
  secondary = "#a1efe4";
  onSecondary = "#272822";
  tertiary = "#ae81ff";
  onTertiary = "#272822";
  error = "#f92672";
  onError = "#1c1c18";
  inverseSurface = "#f8f8f2";
  inverseOnSurface = "#272822";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#383830";
    red = "#f92672";
    green = "#a6e22e";
    yellow = "#f4bf75";
    blue = "#66d9ef";
    magenta = "#ae81ff";
    cyan = "#a1efe4";
    white = "#f8f8f2";
    brightBlack = "#75715e";
    brightRed = "#ff5d88";
    brightGreen = "#b9f64a";
    brightYellow = "#ffd59d";
    brightBlue = "#88ebff";
    brightMagenta = "#bd9cff";
    brightCyan = "#c5fff6";
    brightWhite = "#f9f8f5";
  };

  orange = "#fd971f";
  brightOrange = "#ffb46f";
  cursor = "#66d9ef";

  tools = {
    bat = "Monokai Extended";
  };
}
