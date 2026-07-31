# Nord, expressed in the shared palette schema.
#
# Values from https://www.nordtheme.com/docs/colors-and-palettes. Nord names four
# groups and states what each is for, which maps onto the schema cleanly:
#
#   Polar Night (nord0-3)  backgrounds and UI elements in dark designs
#   Snow Storm  (nord4-6)  text colours
#   Frost       (nord7-10) primary UI components and text highlighting
#   Aurora      (nord11-15) semantic states: error, warning, success
#
# Nord publishes four dark and three light tones, so a handful of ramp steps are
# interpolated -- marked below. That interpolation is the weak point of
# hand-authored palettes and is where earlier theming bugs came from; see
# ./README.md.
{
  name = "nord";
  variant = "dark";
  version = "1.0.0";

  # Bump on ANY change that reaches Firefox's theme manifest, not just colours.
  # Firefox compares this version to decide whether to reinstall a
  # policy-installed theme and ignores install_url pointing at a new store path,
  # so an unbumped change is silently not applied.

  # Surfaces, from Polar Night. nord0 is the canonical background.
  surface = "#2e3440"; # nord0
  surfaceDim = "#2e3440"; # nord0
  surfaceBright = "#4c566a"; # nord3
  surfaceContainerLowest = "#292e39"; # interpolated: one step below nord0
  surfaceContainerLow = "#2e3440"; # nord0
  surfaceContainer = "#3b4252"; # nord1
  surfaceContainerHigh = "#434c5e"; # nord2
  surfaceContainerHighest = "#4c566a"; # nord3
  surfaceVariant = "#3b4252"; # nord1

  # Text, from Snow Storm. The two dim steps are interpolated between nord4 and
  # nord3: Snow Storm has no tone between "text" and "comment", and dropping
  # straight to nord3 for secondary text is what makes labels illegible.
  onSurfaceStrong = "#eceff4"; # nord6
  onSurface = "#d8dee9"; # nord4
  onSurfaceMuted = "#b8c1d1"; # interpolated
  onSurfaceVariant = "#98a3b8"; # interpolated
  onSurfaceFaint = "#7b88a1"; # interpolated

  outline = "#4c566a"; # nord3
  outlineVariant = "#434c5e"; # nord2

  # Accents, from Frost. nord8 is Nord's signature and its documented primary.
  primary = "#88c0d0"; # nord8
  onPrimary = "#2e3440"; # nord0
  primaryContainer = "#5e81ac"; # nord10
  onPrimaryContainer = "#eceff4"; # nord6

  secondary = "#81a1c1"; # nord9
  onSecondary = "#2e3440";

  tertiary = "#8fbcbb"; # nord7
  onTertiary = "#2e3440";

  error = "#bf616a"; # nord11, Aurora red
  onError = "#eceff4"; # nord6

  inverseSurface = "#eceff4"; # nord6
  inverseOnSurface = "#2e3440"; # nord0

  # ANSI 16, following Nord's own documented terminal mapping: Aurora supplies
  # the semantic colours and Frost the blues/cyans.
  ansi = {
    black = "#3b4252"; # nord1
    red = "#bf616a"; # nord11
    green = "#a3be8c"; # nord14
    yellow = "#ebcb8b"; # nord13
    blue = "#81a1c1"; # nord9
    magenta = "#b48ead"; # nord15
    cyan = "#88c0d0"; # nord8
    white = "#e5e9f0"; # nord5

    brightBlack = "#4c566a"; # nord3
    brightRed = "#bf616a"; # nord11
    brightGreen = "#a3be8c"; # nord14
    brightYellow = "#ebcb8b"; # nord13
    brightBlue = "#81a1c1"; # nord9
    brightMagenta = "#b48ead"; # nord15
    brightCyan = "#8fbcbb"; # nord7
    brightWhite = "#eceff4"; # nord6
  };

  orange = "#d08770"; # nord12, Aurora orange
  brightOrange = "#d08770"; # nord12

  cursor = "#88c0d0"; # nord8, for contrast against nord0

  # See the gruvbox palette for why these are stated per-palette.
  tools = {
    bat = "Nord"; # `bat --list-themes`
    btop = "nord"; # $out/share/btop/themes
  };
}
