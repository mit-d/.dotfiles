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

  # The theme is rolled here rather than taken from AMO: the add-on previously in
  # use was a third-party upload with ~18 daily users and no updates since 2021,
  # and its colours were not ours to change.
  palette = import ../palettes/active.nix;

  # One extension id per palette.
  #
  # A single shared id looks tidier but cannot work, because Firefox refuses to
  # *downgrade* an extension. Each palette carries its own independent version,
  # so swapping gruvbox (2.1.0) for nord (1.0.0) asked Firefox to go backwards and
  # it simply kept the old theme -- the policy pointed at the nord xpi while the
  # browser still rendered gruvbox. Per-palette ids sidestep version ordering
  # entirely: a swap is a fresh install of a different extension.
  #
  # The non-active palettes are then blocked below so exactly one theme exists at
  # a time, rather than accumulating one per palette ever tried.
  idFor = paletteName: "${paletteName}@dotfiles.derek";
  themeId = idFor palette.name;

  # Every palette in nix/palettes/, discovered rather than listed, so adding a
  # palette does not also require remembering to register its id here.
  allPaletteNames = map (f: (import (../palettes + "/${f}")).name) (
    builtins.filter (f: f != "active.nix" && f != "README.md" && builtins.match ".*\\.nix" f != null) (
      builtins.attrNames (builtins.readDir ../palettes)
    )
  );

  # Ids to force off: every palette that is not active, plus the short-lived
  # shared id this replaced. Safe to drop "theme@dotfiles.derek" once every
  # machine that had it has switched past this commit.
  staleThemeIds = [
    "theme@dotfiles.derek"
  ]
  ++ map idFor (builtins.filter (n: n != palette.name) allPaletteNames);

  # A Firefox "static theme" is just a manifest -- no code, no background
  # page. Every key below is a documented theme colour; anything omitted falls
  # back to Firefox's built-in dark theme, which color_scheme selects.
  themeManifest = {
    manifest_version = 2;
    name = "${palette.name} (dotfiles)";
    inherit (palette) version;
    browser_specific_settings.gecko.id = themeId;

    theme = {
      # All 39 colour keys the WebExtension theme API accepts, per
      # https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/theme
      #
      # Every key is set deliberately. An omitted key does not inherit a
      # neighbouring colour -- Firefox substitutes its own default, which is
      # chosen for its built-in light/dark themes and lands arbitrarily against a
      # custom palette. Six were previously omitted, and ntp_card_background was
      # why the new tab page kept dark tiles and a dark search field on a pale
      # background.
      #
      # Roles follow Material 3 semantics rather than picking whatever looked
      # close:
      #
      #   surface / surfaceContainer*  backgrounds, by elevation
      #   onSurface / onSurfaceVariant text and icons, primary vs secondary
      #   outline / outlineVariant     borders and dividers
      #   primary / onPrimary          active indicators, focus, selection
      #   primaryContainer            filled selection backgrounds
      #   error                       attention states
      #
      # Nothing here reads palette.ansi.*. Those 16 slots are terminal indices,
      # and in solarized the "bright" half are base *tones*, not brighter
      # accents -- brightYellow is #657b83, a grey. Using them for UI accents is
      # why the active-tab line and focus ring turned grey under solarized.
      colors = {
        # Window frame. The titlebar area behind the tabs.
        frame = palette.surface;
        frame_inactive = palette.surfaceDim;

        # Tabs. The selected tab is a raised container; unselected labels are
        # secondary text, not the faintest step, or they read as disabled.
        tab_selected = palette.surfaceContainer;
        tab_text = palette.onSurface;
        tab_background_text = palette.onSurfaceVariant;
        tab_background_separator = palette.outlineVariant;
        tab_line = palette.primary;
        tab_loading = palette.primary;

        # Toolbar. One elevation step above the frame.
        toolbar = palette.surfaceContainerLow;
        toolbar_text = palette.onSurface;
        bookmark_text = palette.onSurface;
        toolbar_top_separator = palette.outlineVariant;
        toolbar_bottom_separator = palette.outlineVariant;
        toolbar_vertical_separator = palette.outlineVariant;

        # Address bar. Focus uses primary, matching M3's focus indicator; the
        # highlight pair is the filled-selection role.
        toolbar_field = palette.surfaceContainer;
        toolbar_field_text = palette.onSurface;
        toolbar_field_border = palette.outline;
        toolbar_field_focus = palette.surfaceContainerHigh;
        toolbar_field_text_focus = palette.onSurfaceStrong;
        toolbar_field_border_focus = palette.primary;
        toolbar_field_highlight = palette.primaryContainer;
        toolbar_field_highlight_text = palette.onPrimaryContainer;
        toolbar_field_separator = palette.outlineVariant;

        # Menus and panels.
        popup = palette.surfaceContainerLow;
        popup_text = palette.onSurface;
        popup_border = palette.outline;
        popup_highlight = palette.primaryContainer;
        popup_highlight_text = palette.onPrimaryContainer;

        sidebar = palette.surfaceContainerLow;
        sidebar_text = palette.onSurface;
        sidebar_border = palette.outline;
        sidebar_highlight = palette.primaryContainer;
        sidebar_highlight_text = palette.onPrimaryContainer;

        # New tab page. ntp_card_background covers the shortcut tiles and the
        # search field, which is why omitting it left them dark.
        ntp_background = palette.surface;
        ntp_card_background = palette.surfaceContainerLow;
        ntp_text = palette.onSurface;

        # Buttons and icons. Toolbar icons are primary affordances, so onSurface
        # rather than a muted step -- onSurfaceMuted here was a real contributor
        # to the washed-out look.
        button_background_hover = palette.surfaceContainerHigh;
        button_background_active = palette.surfaceContainerHighest;
        icons = palette.onSurface;
        icons_attention = palette.error;
      };

      # These two decide how Firefox renders everything the theme does *not*
      # explicitly colour -- chrome text it derives itself, icon fills, form
      # controls, and in-content pages that respect prefers-color-scheme. Getting
      # them wrong is what makes a light theme look washed out: Firefox picks
      # foregrounds suited to a dark frame and paints them on a pale one.
      #
      # They were hardcoded "dark", so they had to follow palette.variant. The
      # accepted values are "light" | "dark" | "auto" | "system", which the
      # variant vocabulary already matches.
      properties = {
        color_scheme = palette.variant;
        content_color_scheme = palette.variant;
      };
    };
  };

  # An .xpi is a zip. -X drops extra file attributes so the archive is
  # reproducible.
  themeXpi =
    pkgs.runCommand "firefox-${palette.name}-${palette.version}.xpi"
      { nativeBuildInputs = [ pkgs.zip ]; }
      ''
        mkdir build
        cp ${pkgs.writeText "manifest.json" (builtins.toJSON themeManifest)} build/manifest.json
        cd build
        zip -q -X "$out" manifest.json
      '';

  # CSS custom properties generated from the same palette, so userChrome.css
in
{
  home-manager.users.${user} = {
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
          "browser.uidensity" = 1.2;
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
        # userChrome.css is layout only -- tab-strip height, hiding a lone tab,
        # hiding the Pocket button. Every colour comes from the static theme
        # manifest above, so no palette CSS is prepended: a generator here
        # previously emitted 12 --gruv-* custom properties that the stylesheet
        # never referenced.
        userChrome = builtins.readFile ../firefox/userChrome.css;
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
      # "clipper@obsidian.md" = forceInstalled "web-clipper-obsidian";

      # Keyboard-driven browsing. Expect to tune its exclusion list before it
      # stops fighting Firefox's own shortcuts.
      # "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = forceInstalled "vimium-ff";

      # The locally built theme, installed from the store rather than AMO.
      "${themeId}" = {
        installation_mode = "force_installed";
        install_url = "file://${themeXpi}";
      };
    }
    # Force off every theme id this config has ever used other than the active
    # one. Policy does not clean up ids it stops listing, so without this a
    # previously-tried palette stays installed -- and, being a theme, can stay
    # *selected*, which is how gruvbox kept rendering after the palette changed.
    // builtins.listToAttrs (
      map (id: {
        name = id;
        value.installation_mode = "blocked";
      }) staleThemeIds
    );

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
