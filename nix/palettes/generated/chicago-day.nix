# Chicago Day -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/chicago-day.yaml
# Author: Wendell, Ryan <ryanjwendell@gmail.com>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/chicago-day.nix. Edits here are lost on the
# next run.

{
  name = "chicago-day";
  displayName = "Chicago Day";
  author = "Wendell, Ryan <ryanjwendell@gmail.com>";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#e8f0ea";
  surfaceDim = "#ffffff";
  surfaceBright = "#aebdb4";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#e8f0ea";
  surfaceContainer = "#d1e0d7";
  surfaceContainerHigh = "#bfcec5";
  surfaceContainerHighest = "#aebdb4";
  surfaceVariant = "#d1e0d7";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1e2a24";
  onSurface = "#364c40";
  onSurfaceMuted = "#405348";
  onSurfaceVariant = "#4b5a51";
  onSurfaceFaint = "#8a9a91";

  # --- Borders and dividers -----------------------------------------------
  outline = "#8a9a91";
  outlineVariant = "#b9d0c3";

  # --- Accent roles -------------------------------------------------------
  primary = "#522398";
  onPrimary = "#e8f0ea";
  primaryContainer = "#aaa4cf";
  onPrimaryContainer = "#1e2a24";
  secondary = "#00a1de";
  onSecondary = "#1e2a24";
  tertiary = "#e27ea6";
  onTertiary = "#1e2a24";
  error = "#c60c30";
  onError = "#e8f0ea";
  inverseSurface = "#364c40";
  inverseOnSurface = "#e8f0ea";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#d1e0d7";
    red = "#c60c30";
    green = "#009b3a";
    yellow = "#968400";
    blue = "#522398";
    magenta = "#e27ea6";
    cyan = "#00a1de";
    white = "#364c40";
    brightBlack = "#8a9a91";
    brightRed = "#aa0026";
    brightGreen = "#008631";
    brightYellow = "#827200";
    brightBlue = "#430885";
    brightMagenta = "#ce6c94";
    brightCyan = "#008ec4";
    brightWhite = "#1e2a24";
  };

  orange = "#f9461c";
  brightOrange = "#e03300";
  cursor = "#522398";

  tools = {
    bat = "ansi";
  };
}
