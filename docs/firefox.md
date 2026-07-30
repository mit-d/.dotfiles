# Firefox

Firefox Nightly is installed as the `firefox@nightly` Homebrew cask (see
`nix/modules/homebrew.nix`). The binary is not from nix: nixpkgs' `firefox`
does not build usefully on darwin, and Nightly is not in nixpkgs at all.

The *configuration* is declarative, in `nix/modules/firefox.nix`, split
across two delivery channels.

## Channel 1 -- profile files, via home-manager

`programs.firefox` runs with `package = null`, so home-manager manages
config without installing a browser. It writes these as symlinks into
`/nix/store`, under
`~/Library/Application Support/Firefox/Profiles/hszus8yz.default-nightly/`:

| File | Declared as |
| -- | -- |
| `user.js` | `profiles.default-nightly.settings` |
| `containers.json` | `profiles.default-nightly.containers` |
| `search.json.mozlz4` | `profiles.default-nightly.search` |
| `chrome/userChrome.css` | `nix/firefox/userChrome.css` |
| `../../profiles.ini` | derived from the `profiles` attrset |

To change a preference, edit `settings` and
`sudo darwin-rebuild switch --flake ~/.dotfiles`. Quit Firefox first -- the
switch replaces files underneath it.

`user.js` is **additive**. It re-asserts declared prefs at every launch, but
does not remove the several hundred unmanaged entries already in `prefs.js`.

### Profile identity

`profiles.default-nightly.path` must stay `hszus8yz.default-nightly`, matching
the on-disk directory. The option defaults to the attribute name, which would
point Firefox at a directory that does not exist. home-manager prepends
`Profiles/` itself on darwin.

home-manager's generated `profiles.ini` omits the `[Install<hash>]` section.
That is safe: Firefox resolves the per-install default from `installs.ini`,
which home-manager does not manage.

`storeId` also emits a `toolkit.profiles.storeID` pref into `user.js`
automatically -- that is home-manager, not a stray setting.

## Channel 2 -- enterprise policies, via nix-darwin

`system.defaults.CustomUserPreferences."org.mozilla.nightly"` carries the
policies: force-installed extensions, telemetry and Pocket off, and Firefox's
password manager off in favour of 1Password.

On macOS Firefox reads policies through CFPreferences from its bundle-id
domain, so a per-key `defaults write` is enough -- no MDM profile, no writable
app bundle.

**Why not home-manager's `policies` option?** Its darwin implementation runs
`defaults import`, which *replaces* the whole domain and would wipe Nightly's
own Cocoa window state on every switch. `darwinDefaultsId` is therefore set to
`null`, and nix-darwin writes the keys one at a time instead. Verify with
`defaults read org.mozilla.nightly` and `about:policies#active`.

## What is not managed here

- **Bookmarks** -- owned by the `ffbm` toolchain in `bookmarks/`. See
  `bookmarks/ffbm.py`. home-manager's `bookmarks` option is intentionally
  left off.
- **Extension versions** -- the *set* is declared, but they auto-update from
  AMO, so security fixes do not wait on `nix flake update`.
- **Stateful data** -- history, cookies, logins, certificates.

## Adding an extension

Find its extension ID (`about:debugging#/runtime/this-firefox`) and its AMO
URL slug, then add to `ExtensionSettings`:

```nix
"addon-id@example.com" = forceInstalled "amo-url-slug";
```

Confirm the slug resolves before switching, or the install fails silently at
runtime:

```bash
curl -sIL -o /dev/null -w '%{http_code} %{content_type}\n' \
  https://addons.mozilla.org/firefox/downloads/latest/<slug>/latest.xpi
```

Expect `200 application/x-xpinstall`.

## Known rough edges

- **`containers.json` format version.** home-manager emits `version: 5` with
  the internal thumbnail identity at `4294967294`; Firefox Nightly writes
  `version: 6` with it at `5`. The four real containers are read correctly
  either way, but Firefox may attempt a format migration and find the file is
  a read-only store symlink. If containers misbehave, drop `containers` and
  `containersForce` and let Firefox own the file -- containers change rarely.
- **`nix fmt` with no arguments fails** in this repo (nixfmt 1.4 does not
  recurse directories, so it reads empty stdin). Pass paths explicitly, or
  rely on `nix flake check`, which runs `nixfmt --check` across the tree.
