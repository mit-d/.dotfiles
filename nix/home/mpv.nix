{ lib, pkgs, ... }:
let
  palette = import ../palettes/active.nix;
  # mpv wants #AARRGGBB, so the palette hex is spliced in after an alpha byte.
  argb = a: colour: "#" + a + lib.removePrefix "#" colour;
  mpv-cut = pkgs.callPackage ../pkgs/mpv-cut.nix { };
in
{
  programs.mpv = {
    enable = true;

    # The active settings from mpv/.config/mpv/mpv.conf. The rest of that
    # file was mpv's stock commented example boilerplate.
    config = {
      # no window title bar
      border = false;

      # On Screen Display
      osd-level = 1;
      osd-bar-align-y = 0;
      osd-bar-h = 4;
      osd-border-size = 0.4;
      # Was #CCFFFFFF / #99000000 -- plain white on black. Now the palette, with
      # the original alpha bytes preserved so the OSD keeps its translucency.
      osd-color = argb "CC" palette.onSurface;
      osd-border-color = argb "99" palette.surface;
      osd-font = "Hiragino Maru Gothic Pro";
      # \${filename} is an mpv property reference, escaped so Nix does not
      # try to interpolate it.
      osd-playing-msg = "file: \${filename}";
      osd-duration = 2000;

      # Video
      geometry = "50%:50%";
      autofit-larger = "90%x90%";
      keep-open = true;
      profile = "gpu-hq";
      hwdec = "auto";

      # Subtitles and audio language preference
      slang = "en,eng,enm";
      alang = "ja,jp,jpn,en,eng";
    };

    scripts = [ mpv-cut ];
  };

  # Hand-written script with no upstream package.
  xdg.configFile."mpv/scripts/easycrop.lua".source = ../../mpv/.config/mpv/scripts/easycrop.lua;
}
