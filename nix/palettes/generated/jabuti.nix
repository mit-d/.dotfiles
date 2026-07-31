# Jabuti -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/jabuti.yaml
# Author: https://github.com/notusknot
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/jabuti.nix. Edits here are lost on the
# next run.

{
  name = "jabuti";
  displayName = "Jabuti";
  author = "https://github.com/notusknot";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#292a37";
  surfaceDim = "#1e1f2c";
  surfaceBright = "#4c4d5e";
  surfaceContainerLowest = "#1e1f2c";
  surfaceContainerLow = "#292a37";
  surfaceContainer = "#343545";
  surfaceContainerHigh = "#404151";
  surfaceContainerHighest = "#4c4d5e";
  surfaceVariant = "#343545";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#c0cbe3";
  onSurfaceMuted = "#868ca5";
  onSurfaceVariant = "#7b7d91";
  onSurfaceFaint = "#5b5e71";

  # --- Borders and dividers -----------------------------------------------
  outline = "#636679";
  outlineVariant = "#3e4153";

  # --- Accent roles -------------------------------------------------------
  primary = "#3fc6de";
  onPrimary = "#292a37";
  primaryContainer = "#3a6172";
  onPrimaryContainer = "#ffffff";
  secondary = "#ff7eb6";
  onSecondary = "#292a37";
  tertiary = "#be95ff";
  onTertiary = "#292a37";
  error = "#ec6a88";
  onError = "#292a37";
  inverseSurface = "#c0cbe3";
  inverseOnSurface = "#292a37";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#343545";
    red = "#ec6a88";
    green = "#3fdaa4";
    yellow = "#e1c697";
    blue = "#3fc6de";
    magenta = "#be95ff";
    cyan = "#ff7eb6";
    white = "#c0cbe3";
    brightBlack = "#45475d";
    brightRed = "#ff7f9b";
    brightGreen = "#59eeb7";
    brightYellow = "#f5d9aa";
    brightBlue = "#57daf2";
    brightMagenta = "#cdb0ff";
    brightCyan = "#ffa2c7";
    brightWhite = "#ffffff";
  };

  orange = "#efb993";
  brightOrange = "#ffceac";
  cursor = "#3fc6de";

  tools = {
    bat = "ansi";
  };
}
