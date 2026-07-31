# Darktooth -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/darktooth.yaml
# Author: Jason Milkins (https://github.com/jasonm23)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/darktooth.nix. Edits here are lost on the
# next run.

{
  name = "darktooth";
  displayName = "Darktooth";
  author = "Jason Milkins (https://github.com/jasonm23)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1d2021";
  surfaceDim = "#111314";
  surfaceBright = "#4f4d4c";
  surfaceContainerLowest = "#111314";
  surfaceContainerLow = "#1d2021";
  surfaceContainer = "#32302f";
  surfaceContainerHigh = "#403e3d";
  surfaceContainerHighest = "#4f4d4c";
  surfaceVariant = "#32302f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fdf4c1";
  onSurface = "#a89984";
  onSurfaceMuted = "#9d8e7c";
  onSurfaceVariant = "#928374";
  onSurfaceFaint = "#665c54";

  # --- Borders and dividers -----------------------------------------------
  outline = "#665c54";
  outlineVariant = "#504945";

  # --- Accent roles -------------------------------------------------------
  primary = "#0d6678";
  onPrimary = "#fdf4c1";
  primaryContainer = "#203940";
  onPrimaryContainer = "#fdf4c1";
  secondary = "#8ba59b";
  onSecondary = "#1d2021";
  tertiary = "#8f4673";
  onTertiary = "#fdf4c1";
  error = "#fb543f";
  onError = "#1d2021";
  inverseSurface = "#a89984";
  inverseOnSurface = "#1d2021";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#32302f";
    red = "#fb543f";
    green = "#95c085";
    yellow = "#fac03b";
    blue = "#0d6678";
    magenta = "#8f4673";
    cyan = "#8ba59b";
    white = "#a89984";
    brightBlack = "#665c54";
    brightRed = "#ff7b66";
    brightGreen = "#a8d397";
    brightYellow = "#ffd88b";
    brightBlue = "#28788a";
    brightMagenta = "#a25785";
    brightCyan = "#9db8ae";
    brightWhite = "#fdf4c1";
  };

  orange = "#fe8625";
  brightOrange = "#ffa56b";
  cursor = "#2e727f";

  tools = {
    bat = "ansi";
  };
}
