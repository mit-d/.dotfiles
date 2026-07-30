{ config, ... }:
let
  user = config.system.primaryUser;
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
        };
      };
    };
  };
}
