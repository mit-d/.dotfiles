{ config, pkgs, ... }:
let
  user = config.system.primaryUser;

  # AMO's "latest" endpoint per add-on slug. Policies pin the *set* of
  # extensions, not their versions, so add-ons keep auto-updating and
  # security fixes do not wait on a flake update.
  forceInstalled = slug: {
    installation_mode = "force_installed";
    install_url = "https://addons.mozilla.org/firefox/downloads/latest/${slug}/latest.xpi";
  };

  # Gruvbox Dark Hard, rolled here rather than taken from AMO: the add-on
  # previously in use was a third-party upload with ~18 daily users and no
  # updates since 2021, and its colours were not ours to change.
  palette = import ../firefox/gruvbox-dark-hard.nix;

  themeId = "gruvbox-dark-hard@dotfiles.derek";

  # A Firefox "static theme" is just a manifest -- no code, no background
  # page. Every key below is a documented theme colour; anything omitted falls
  # back to Firefox's built-in dark theme, which color_scheme selects.
  themeManifest = {
    manifest_version = 2;
    name = "Gruvbox Dark Hard (dotfiles)";
    inherit (palette) version;
    browser_specific_settings.gecko.id = themeId;

    theme = {
      colors = {
        frame = palette.bg0_hard;
        frame_inactive = palette.bg0_hard;

        tab_selected = palette.bg1;
        tab_text = palette.fg1;
        tab_background_text = palette.fg4;
        tab_line = palette.brightYellow;
        tab_loading = palette.brightBlue;

        toolbar = palette.bg0;
        toolbar_text = palette.fg1;
        toolbar_top_separator = palette.bg0_hard;
        toolbar_bottom_separator = palette.bg2;
        toolbar_vertical_separator = palette.bg2;

        toolbar_field = palette.bg1;
        toolbar_field_text = palette.fg1;
        toolbar_field_border = palette.bg3;
        toolbar_field_focus = palette.bg2;
        toolbar_field_text_focus = palette.fg0;
        toolbar_field_border_focus = palette.brightYellow;

        popup = palette.bg0;
        popup_text = palette.fg1;
        popup_border = palette.bg3;
        popup_highlight = palette.bg2;
        popup_highlight_text = palette.fg0;

        sidebar = palette.bg0;
        sidebar_text = palette.fg1;
        sidebar_border = palette.bg3;
        sidebar_highlight = palette.bg2;
        sidebar_highlight_text = palette.fg0;

        ntp_background = palette.bg0_hard;
        ntp_text = palette.fg1;

        button_background_hover = palette.bg2;
        button_background_active = palette.bg3;
        icons = palette.fg2;
        icons_attention = palette.brightYellow;
      };

      properties = {
        color_scheme = "dark";
        content_color_scheme = "dark";
      };
    };
  };

  # An .xpi is a zip. -X drops extra file attributes so the archive is
  # reproducible.
  themeXpi =
    pkgs.runCommand "firefox-gruvbox-dark-hard-${palette.version}.xpi"
      { nativeBuildInputs = [ pkgs.zip ]; }
      ''
        mkdir build
        cp ${pkgs.writeText "manifest.json" (builtins.toJSON themeManifest)} build/manifest.json
        cd build
        zip -q -X "$out" manifest.json
      '';

  # CSS custom properties generated from the same palette, so userChrome.css
  # can reference gruvbox colours without repeating hex values.
  paletteCss = ''
    /* Generated from nix/firefox/gruvbox-dark-hard.nix -- edit the palette
       there, never here. */
    :root {
      --gruv-bg0-hard: ${palette.bg0_hard};
      --gruv-bg0: ${palette.bg0};
      --gruv-bg1: ${palette.bg1};
      --gruv-bg2: ${palette.bg2};
      --gruv-bg3: ${palette.bg3};
      --gruv-fg0: ${palette.fg0};
      --gruv-fg1: ${palette.fg1};
      --gruv-fg2: ${palette.fg2};
      --gruv-gray: ${palette.gray};
      --gruv-bright-yellow: ${palette.brightYellow};
      --gruv-bright-blue: ${palette.brightBlue};
      --gruv-bright-red: ${palette.brightRed};
    }
  '';
in
{
  # home-manager's nix-darwin integration resolves the home directory from
  # users.users.<name>.home, which this flake has never declared. Declaring
  # `home` alone does not make nix-darwin manage or create the account --
  # that requires listing the user in users.knownUsers.
  users.users.${user}.home = "/Users/${user}";

  home-manager = {
    # Stay on the flake's nixpkgs rather than home-manager's own.
    useGlobalPkgs = true;

    # Move pre-existing real files aside instead of aborting activation.
    # Firefox owns several of the files this module will take over.
    backupFileExtension = "hm-bak";

    users.${user} = {
      home.stateVersion = "26.05";

      # Firefox rewrites profiles.ini *in place* at startup, so it cannot be
      # a read-only store symlink: doing so makes startup fail outright with
      # "Your Firefox profile cannot be loaded. It may be missing or
      # inaccessible." Verified the hard way. Firefox keeps ownership of this
      # file, and nix has nothing to add to it anyway -- the profile already
      # exists, and installs.ini (which home-manager never manages) is what
      # pins this install to it.
      #
      # The other managed files are fine: Firefox never writes user.js or
      # userChrome.css, and for containers.json and search.json.mozlz4 it
      # *replaces* the symlink rather than writing through it, which is what
      # the `force` options below are for.
      home.file."Library/Application Support/Firefox/profiles.ini".enable = false;

      programs.firefox = {
        enable = true;

        # Nightly comes from the homebrew cask. nixpkgs' firefox does not
        # build usefully on darwin, and Nightly is not in nixpkgs at all;
        # package = null makes this module manage config only.
        package = null;

        # Policies are delivered by system.defaults.CustomUserPreferences
        # instead (see the bottom of this file). Leaving this set would make
        # home-manager run `defaults import`, which replaces the entire
        # domain and would drop Nightly's own Cocoa window state on every
        # switch.
        darwinDefaultsId = null;

        # The live profiles.ini is Version=2; home-manager defaults this to
        # null on darwin, which omits the line entirely.
        profileVersion = 2;

        profiles.default-nightly = {
          id = 0;
          isDefault = true;

          # Must match the on-disk directory. This option defaults to the
          # attribute name ("default-nightly"), which would point Firefox at
          # a directory that does not exist. home-manager prepends
          # "Profiles/" itself on darwin, so it must not appear here.
          path = "hszus8yz.default-nightly";

          storeId = "489c2007";

          settings = {
            # AI and ML surfaces off. "blocked" is the browser.ai.control
            # vocabulary; these are not booleans.
            "browser.ai.control.default" = "blocked";
            "browser.ai.control.linkPreviewKeyPoints" = "blocked";
            "browser.ai.control.pdfjsAltText" = "blocked";
            "browser.ai.control.sidebarChatbot" = "blocked";
            "browser.ai.control.smartTabGroups" = "blocked";
            "browser.ai.control.smartWindow" = "blocked";
            "browser.ai.control.translations" = "blocked";
            "browser.ml.chat.enabled" = false;
            "browser.ml.chat.page" = false;
            "browser.ml.linkPreview.enabled" = false;

            # Telemetry.
            "app.shield.optoutstudies.enabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;

            # New-tab and urlbar noise.
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.showWeather" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.search.suggest.enabled" = false;

            # Hardening. Set the contentblocking *category* rather than the
            # individual privacy.trackingprotection.* prefs: Firefox derives
            # those from the category, so setting them directly flips the
            # category to "custom" and matches no UI radio button.
            "browser.contentblocking.category" = "strict";
            "dom.security.https_only_mode" = true;
            "network.dns.disablePrefetch" = true;
            "network.trr.mode" = 3;
            "network.trr.uri" = "https://firefox.dns.nextdns.io/";
            "privacy.donottrackheader.enabled" = true;
            "privacy.globalprivacycontrol.enabled" = true;

            # UI. legacyUserProfileCustomizations is what makes userChrome.css
            # load at all.
            "browser.uidensity" = 1;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

            # Theme. Installing a theme does not select it, so the active one
            # is pinned here or a fresh profile would sit on Firefox's
            # default.
            "extensions.activeThemeID" = themeId;

            # The theme is built here and therefore unsigned. This pref is
            # honoured on Nightly (and Developer Edition) and ignored on
            # Release/Beta, so this whole approach is channel-dependent.
            "xpinstall.signatures.required" = false;

            # Bookmarks behaviour. The tree itself stays owned by ffbm.
            "browser.bookmarks.defaultLocation" = "toolbar_____";
            "browser.bookmarks.restore_default_bookmarks" = false;
            "browser.bookmarks.showMobileBookmarks" = false;

            # Nix owns preferences; Sync keeps bookmarks, tabs, and
            # addresses. The passwords engine is off for coherence with the
            # PasswordManagerEnabled policy.
            "services.sync.engine.prefs" = false;
            "services.sync.engine.passwords" = false;
          };

          # containers.json already exists, so writing it needs force.
          containersForce = true;

          # The ids are the live userContextIds. Preserving them preserves
          # each container's existing cookie jar and sessions. These were
          # built-in localized entries, so the labels become fixed English
          # strings -- cosmetic, and the only visible change.
          containers = {
            Personal = {
              id = 1;
              icon = "fingerprint";
              color = "blue";
            };
            Work = {
              id = 2;
              icon = "briefcase";
              color = "orange";
            };
            Banking = {
              id = 3;
              icon = "dollar";
              color = "green";
            };
            Shopping = {
              id = 4;
              icon = "cart";
              color = "pink";
            };
          };

          search = {
            # search.json.mozlz4 already exists, and Firefox rewrites it on
            # every launch, so taking it over requires force.
            force = true;

            # Preserves the current default. This is an engine id, not a
            # display name.
            default = "ddg";

            # Keyword engines: the urlbar becomes a launcher, complementing
            # the bookmark keywords ffbm already generates.
            engines = {
              nix-packages = {
                name = "Nix Packages";
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "type";
                        value = "packages";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                definedAliases = [ "@np" ];
              };

              nix-options = {
                name = "Nix Options";
                urls = [
                  {
                    template = "https://search.nixos.org/options";
                    params = [
                      {
                        name = "channel";
                        value = "unstable";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                definedAliases = [ "@no" ];
              };

              noogle = {
                name = "Noogle";
                urls = [ { template = "https://noogle.dev/q?term={searchTerms}"; } ];
                definedAliases = [ "@noogle" ];
              };

              mdn = {
                name = "MDN";
                urls = [
                  { template = "https://developer.mozilla.org/en-US/search?q={searchTerms}"; }
                ];
                definedAliases = [ "@mdn" ];
              };

              github = {
                name = "GitHub";
                urls = [ { template = "https://github.com/search?q={searchTerms}"; } ];
                definedAliases = [ "@gh" ];
              };
            };
          };

          # Palette vars first, then the hand-written rules. The CSS stays a
          # real .css file so editors treat it as CSS; only the generated
          # custom properties are spliced in front of it.
          userChrome = paletteCss + builtins.readFile ../firefox/userChrome.css;
        };
      };
    };
  };

  # On macOS, Firefox reads enterprise policies through CFPreferences from
  # its own bundle-id domain, so a per-key `defaults write` is sufficient --
  # no MDM configuration profile and no writable app bundle needed. This is
  # what makes the cask-installed Nightly policy-configurable from nix.
  #
  # nix-darwin emits one `defaults write` per key. home-manager's equivalent
  # (darwinDefaultsId, disabled above) uses `defaults import`, which replaces
  # the whole domain and would wipe Nightly's own Cocoa state every switch.
  system.defaults.CustomUserPreferences."org.mozilla.nightly" = {
    EnterprisePoliciesEnabled = true;

    ExtensionSettings = {
      "uBlock0@raymondhill.net" = forceInstalled "ublock-origin";
      "@testpilot-containers" = forceInstalled "multi-account-containers";

      # Firefox's own password manager is disabled below, so without this
      # there is no autofill at all.
      "{d634138d-c276-4fc8-924b-40a0ea21d284}" = forceInstalled "1password-x-password-manager";

      # Clips pages into the vault that obsidian-sync.nix already feeds.
      # Note the official add-on is the one with this id -- AMO also carries
      # an unofficial clone under a similar name.
      "clipper@obsidian.md" = forceInstalled "web-clipper-obsidian";

      # Keyboard-driven browsing. Expect to tune its exclusion list before it
      # stops fighting Firefox's own shortcuts.
      "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = forceInstalled "vimium-ff";

      # The locally built theme, installed from the store rather than AMO.
      "${themeId}" = {
        installation_mode = "force_installed";
        install_url = "file://${themeXpi}";
      };
    };

    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    DisablePocket = true;

    # 1Password owns credentials. Firefox Accounts stays enabled on purpose:
    # Sync still carries bookmarks, tabs, and addresses.
    PasswordManagerEnabled = false;
    OfferToSaveLogins = false;
    DisableFormHistory = true;
  };
}
