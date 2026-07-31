{ pkgs, ... }:
let
  palette = import ../palettes/active.nix;

  # k9s ships a gruvbox-dark-hard skin, but 8 of its 11 colour anchors have
  # drifted from canonical gruvbox -- #989719 for green instead of #98971a,
  # #b16185 for magenta instead of #b16286, #cc231c for red instead of #cc241d.
  # They look hand-transcribed.
  #
  # Rather than hand-write a skin (k9s skins are long: body, prompt, info,
  # dialog, frame, menu, crumbs, views, xray, charts...), take upstream's file
  # and rewrite its anchor definitions from the palette. Every section mapping
  # stays upstream-maintained; only the values become ours.
  #
  # All 11 anchors are substituted, not just the drifted ones. An earlier version
  # rewrote only the 8 that disagreed with canonical gruvbox and left foreground,
  # background and current_line alone because they already matched -- correct for
  # gruvbox purely by luck, and it produced a gruvbox-dark background under a
  # solarized-light palette.
  #
  # `orange` maps to the palette's orange rather than its yellow. Upstream's value
  # (~#d79921) is canonical gruvbox *yellow* despite the anchor's name, the same
  # class of slip as the other eight, so it is corrected rather than perpetuated.
  skin =
    pkgs.runCommand "k9s-${palette.name}.yaml"
      {
        src = "${pkgs.k9s}/share/k9s/skins/gruvbox-dark-hard.yaml";
      }
      ''
        sed -E \
          -e 's|^(foreground: &foreground ")[^"]*|\1${palette.onSurface}|' \
          -e 's|^(background: &background ")[^"]*|\1${palette.surface}|' \
          -e 's|^(current_line: &current_line ")[^"]*|\1${palette.onSurface}|' \
          -e 's|^(selection: &selection ")[^"]*|\1${palette.surfaceContainer}|' \
          -e 's|^(comment: &comment ")[^"]*|\1${palette.onSurfaceVariant}|' \
          -e 's|^(cyan: &cyan ")[^"]*|\1${palette.ansi.cyan}|' \
          -e 's|^(green: &green ")[^"]*|\1${palette.ansi.green}|' \
          -e 's|^(orange: &orange ")[^"]*|\1${palette.orange}|' \
          -e 's|^(magenta: &magenta ")[^"]*|\1${palette.ansi.magenta}|' \
          -e 's|^(blue: &blue ")[^"]*|\1${palette.ansi.blue}|' \
          -e 's|^(red: &red ")[^"]*|\1${palette.ansi.red}|' \
          "$src" > "$out"

        # Fail the build rather than ship a half-themed skin. If upstream renames
        # or adds an anchor, the sed above silently leaves it at gruvbox's value,
        # which is exactly the bug this replaced.
        anchors=$(grep -cE '^[a-z_]+: &' "$out")
        if [ "$anchors" -ne 11 ]; then
          echo "k9s skin: expected 11 colour anchors, found $anchors; upstream changed the skin" >&2
          exit 1
        fi
        if grep -qE '"#(1d2021|ebdbb2|3c3735|bdad93|689d69|989719|d79920|b16185|448488|cc231c)"' "$out"; then
          echo "k9s skin: an anchor still holds an upstream gruvbox value; a substitution did not match" >&2
          exit 1
        fi
      '';
in
{
  programs.k9s = {
    enable = true;

    skins.${palette.name} = skin;

    # Providing `skins` makes home-manager inject `k9s.ui.skin` pointing at the
    # first skin, which makes `settings` non-empty and therefore makes
    # config.yaml a store symlink. So the whole file has to be declared here --
    # otherwise everything not listed silently reverts to k9s defaults.
    #
    # These values are the ones k9s had already written, ported verbatim so the
    # switch changes nothing but the skin.
    #
    # CAVEAT: config.yaml is now read-only. k9s does not appear to rewrite it
    # during normal use (the live copy was untouched for a year while k9s.log
    # updated daily), but a future k9s release that wants to migrate the schema
    # will fail against a store symlink rather than silently upgrading. That
    # surfaces as a visible k9s error, and the fix is to update this attrset.
    settings.k9s = {
      liveViewAutoRefresh = false;
      screenDumpDir = "/Users/derekmitten/Library/Application Support/k9s/screen-dumps";
      refreshRate = 2;
      apiServerTimeout = "15s";
      maxConnRetry = 5;
      readOnly = false;
      noExitOnCtrlC = false;
      portForwardAddress = "localhost";
      ui = {
        enableMouse = false;
        headless = false;
        logoless = false;
        crumbsless = false;
        splashless = false;
        reactive = false;
        noIcons = false;
        defaultsToFullScreen = false;
        useFullGVRTitle = false;
        skin = palette.name;
      };
      skipLatestRevCheck = false;
      disablePodCounting = false;
      shellPod = {
        image = "busybox:1.35.0";
        namespace = "default";
        limits = {
          cpu = "100m";
          memory = "100Mi";
        };
      };
      imageScans = {
        enable = false;
        exclusions = {
          namespaces = [ ];
          labels = { };
        };
      };
      logger = {
        tail = 100;
        buffer = 5000;
        sinceSeconds = -1;
        textWrap = false;
        disableAutoscroll = false;
        showTime = false;
      };
      thresholds = {
        cpu = {
          critical = 90;
          warn = 70;
        };
        memory = {
          critical = 90;
          warn = 70;
        };
      };
      defaultView = "";
    };

    # Ported from the existing aliases.yaml. Safe to manage: k9s only reads it.
    aliases.aliases = {
      dp = "deployments";
      sec = "v1/secrets";
      jo = "jobs";
      cr = "clusterroles";
      crb = "clusterrolebindings";
      ro = "roles";
      rb = "rolebindings";
      np = "networkpolicies";
    };
  };
}
