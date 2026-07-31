{ ... }:
let
  palette = import ../palettes/active.nix;

  # btop themes are a bespoke `theme[key]="#rrggbb"` format, so unlike Ghostty
  # or fzf it cannot simply be handed the palette. It ships builtins for a
  # handful of popular schemes, but the library has 335 palettes and only ~24
  # have a builtin -- the rest would fall back to btop's `tty` theme, which uses
  # the terminal's 16 ANSI colours and ignores the surface and text ramps
  # entirely.
  #
  # Generating the file instead means every palette gets a real theme, and edits
  # in nix/palettes/overrides flow through, which a builtin name could never do.
  #
  # All 37 keys btop reads are set. Anything omitted silently falls back to
  # btop's compiled-in default, which is not this palette.
  theme = ''
    # ${palette.name}, generated from nix/palettes by nix/home/btop.nix.
    # Do not edit: rewritten on every `darwin-rebuild switch`.

    theme[main_bg]="${palette.surface}"
    theme[main_fg]="${palette.onSurface}"
    theme[title]="${palette.primary}"
    theme[hi_fg]="${palette.secondary}"
    theme[selected_bg]="${palette.surfaceContainerHigh}"
    theme[selected_fg]="${palette.onSurfaceStrong}"
    theme[inactive_fg]="${palette.onSurfaceFaint}"
    theme[proc_misc]="${palette.tertiary}"

    # Box outlines and dividers.
    theme[cpu_box]="${palette.outlineVariant}"
    theme[mem_box]="${palette.outlineVariant}"
    theme[net_box]="${palette.outlineVariant}"
    theme[proc_box]="${palette.outlineVariant}"
    theme[div_line]="${palette.outlineVariant}"

    # Gradients where a rising value is worse run green -> yellow -> red, taken
    # from the ANSI slots so they stay recognisable as "good" and "bad" in every
    # palette rather than tracking an accent hue.
    theme[temp_start]="${palette.ansi.green}"
    theme[temp_mid]="${palette.ansi.yellow}"
    theme[temp_end]="${palette.ansi.red}"

    theme[cpu_start]="${palette.ansi.cyan}"
    theme[cpu_mid]="${palette.ansi.yellow}"
    theme[cpu_end]="${palette.ansi.red}"

    theme[used_start]="${palette.ansi.green}"
    theme[used_mid]="${palette.ansi.yellow}"
    theme[used_end]="${palette.ansi.red}"

    # Single-hue gradients: btop treats an empty `mid` as a two-colour ramp.
    theme[free_start]="${palette.ansi.brightGreen}"
    theme[free_mid]=""
    theme[free_end]="${palette.ansi.green}"

    theme[cached_start]="${palette.ansi.brightBlue}"
    theme[cached_mid]=""
    theme[cached_end]="${palette.ansi.blue}"

    theme[available_start]="${palette.ansi.brightCyan}"
    theme[available_mid]=""
    theme[available_end]="${palette.ansi.cyan}"

    theme[download_start]="${palette.ansi.brightGreen}"
    theme[download_mid]=""
    theme[download_end]="${palette.ansi.green}"

    theme[upload_start]="${palette.ansi.brightMagenta}"
    theme[upload_mid]=""
    theme[upload_end]="${palette.ansi.magenta}"
  '';
in
{
  programs.btop = {
    enable = true;
    themes.${palette.name} = theme;
    settings.color_theme = palette.name;
  };
}
