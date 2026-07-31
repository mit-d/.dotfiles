{ pkgs, ... }:
let
  palette = import ../palettes/gruvbox-dark-hard.nix;

  # bg0_hard is gruvbox's darkest background and its ANSI slot 0 -- the same
  # colour Ghostty's background and the Firefox theme frame use, so the desktop
  # matches the terminal exactly.
  colour = palette.bg0_hard;

  # Dimensions are arbitrary for a flat fill: a solid-colour PNG compresses to a
  # couple of KB whatever its size, and desktoppr's default `fill` scaling covers
  # any display. Generated at 5K so macOS never upscales it on a Retina panel.
  solid =
    pkgs.runCommand "gruvbox-dark-hard-${builtins.replaceStrings [ "#" ] [ "" ] colour}.png"
      { nativeBuildInputs = [ pkgs.imagemagick ]; }
      ''
        magick -size 5120x2880 xc:'${colour}' "$out"
      '';
in
{
  # macOS System Settings can pick a solid colour directly, but that choice is
  # not declarable. There is no wallpaper option in nix-darwin *or*
  # home-manager, and since Sonoma the setting lives in
  # ~/Library/Application Support/com.apple.wallpaper/Store/Index.plist as
  # binary plists nested inside a plist (`Configuration` and
  # `EncodedOptionValues` are both bplist00 blobs) under an undocumented,
  # versioned schema. Generating that by hand would break on macOS updates.
  #
  # A flat PNG set through desktoppr is visually identical and stable. desktoppr
  # drives the public NSWorkspace API, so unlike an `osascript`/System Events
  # approach it needs no Automation permission and prompts for nothing.
  environment.systemPackages = [ pkgs.desktoppr ];

  # A user agent rather than an activation script: setting the desktop picture
  # touches the GUI session, so it has to run as the logged-in user in that
  # session, not as root at activation time. RunAtLoad also means a fresh machine
  # or a new login picks it up, and the store path changing (i.e. the colour
  # changing) re-applies it at next login.
  launchd.user.agents.wallpaper = {
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.desktoppr}/bin/desktoppr"
        "all"
        "${solid}"
      ];
      RunAtLoad = true;
      # desktoppr sets the picture and exits.
      KeepAlive = false;
    };
  };
}
