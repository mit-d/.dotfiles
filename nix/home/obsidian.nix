{ lib, pkgs, ... }:
let
  palette = import ../palettes/active.nix;
  colors = import ../palettes/lib.nix;

  # Obsidian builds --color-accent, --color-accent-1 and --color-accent-2 from
  # these three, so handing it HSL gets the hover and active variants derived by
  # Obsidian's own rules instead of invented here.
  accent = colors.hexToHsl palette.primary;

  # Vaults to write the theme into. Guarded at activation time, so listing a
  # vault that does not exist on this machine is harmless.
  vaults = [ "Documents/Obsidian/Notes" ];

  themeName = "dotfiles";

  # Obsidian resolves a theme by the `name` in its manifest, so this has to match
  # both the directory and what appearance.json's cssTheme is set to.
  manifest = pkgs.writeText "obsidian-manifest.json" (
    builtins.toJSON {
      name = themeName;
      inherit (palette) version;
      minAppVersion = "1.0.0";
      author = "generated from nix/palettes";
    }
  );

  theme = pkgs.writeText "obsidian-${palette.name}.css" ''
    /* ${palette.displayName or palette.name}, generated from nix/palettes by
       nix/home/obsidian.nix. Do not edit: rewritten on every switch.

       This is a colour-only theme, which is a complete one: Obsidian's app.css
       supplies the whole layout and derives its visuals from the variables
       below, so replacing them is all a theme has to do.

       It is a theme rather than a CSS snippet on purpose. A snippet layers over
       whichever community theme is active, which means it has to out-specify a
       third party to be correct, and cannot win at all against a theme that
       paints literal hex outside any variable -- Minimal has 436 such values,
       Things 32. Owning the whole colour surface is deterministic instead.

       Both base colour schemes get identical values, so it does not matter which
       one Obsidian is set to: the palette has exactly one variant. Specificity
       matches app.css's own `.theme-dark`, and this file loads after it. */

    .theme-dark,
    .theme-light {
      /* --- Neutral ramp -----------------------------------------------------
         Obsidian's base scale runs from the primary background at 00 to the
         strongest text at 100. Community themes that only touch the primitives
         keep working, restyled: Things reads these and never sets
         --background-primary itself. */
      --color-base-00: ${palette.surface};
      --color-base-05: ${palette.surfaceContainerLow};
      --color-base-10: ${palette.surfaceContainer};
      --color-base-20: ${palette.surfaceContainerHigh};
      --color-base-25: ${palette.surfaceContainerHighest};
      --color-base-30: ${palette.surfaceBright};
      --color-base-35: ${palette.outlineVariant};
      --color-base-40: ${palette.outline};
      --color-base-50: ${palette.onSurfaceFaint};
      --color-base-60: ${palette.onSurfaceVariant};
      --color-base-70: ${palette.onSurfaceMuted};
      --color-base-100: ${palette.onSurface};

      /* --- Accent -----------------------------------------------------------
         Given as components so Obsidian derives --color-accent-1 and -2. */
      --accent-h: ${toString accent.h};
      --accent-s: ${toString accent.s}%;
      --accent-l: ${toString accent.l}%;

      /* --- Extended colours -------------------------------------------------
         Obsidian's eight families, from the ANSI slots. It has no aqua, so
         `purple` and `pink` take magenta and the brighter magenta. */
      --color-red: ${palette.ansi.red};
      --color-orange: ${palette.orange};
      --color-yellow: ${palette.ansi.yellow};
      --color-green: ${palette.ansi.green};
      --color-cyan: ${palette.ansi.cyan};
      --color-blue: ${palette.ansi.blue};
      --color-purple: ${palette.ansi.magenta};
      --color-pink: ${palette.ansi.brightMagenta};

      /* --- Semantic roles --------------------------------------------------
         Set explicitly rather than left to Obsidian's derivations from the ramp
         above. The mapping from base-NN to each semantic variable is not part of
         the documented API, so relying on it would make this snippet's
         correctness depend on an implementation detail. */
      --background-primary: ${palette.surface};
      --background-primary-alt: ${palette.surfaceContainerLow};
      --background-secondary: ${palette.surfaceContainer};
      --background-secondary-alt: ${palette.surfaceContainerHigh};
      --background-modifier-hover: ${palette.surfaceContainerHigh};
      --background-modifier-active-hover: ${palette.surfaceContainerHighest};
      --background-modifier-border: ${palette.outlineVariant};
      --background-modifier-border-hover: ${palette.outline};
      --background-modifier-border-focus: ${palette.primary};
      --background-modifier-error: ${palette.error};
      --background-modifier-error-hover: ${palette.error};
      --background-modifier-success: ${palette.ansi.green};
      --background-modifier-message: ${palette.surfaceContainerHigh};
      --background-modifier-form-field: ${palette.surfaceContainerLowest};

      --interactive-normal: ${palette.surfaceContainer};
      --interactive-hover: ${palette.surfaceContainerHigh};
      --interactive-accent: ${palette.primary};
      --interactive-accent-hover: var(--color-accent-1);

      --text-normal: ${palette.onSurface};
      --text-muted: ${palette.onSurfaceVariant};
      --text-faint: ${palette.onSurfaceFaint};
      --text-on-accent: ${palette.onPrimary};
      --text-on-accent-inverted: ${palette.surface};
      --text-success: ${palette.ansi.green};
      --text-warning: ${palette.ansi.yellow};
      --text-error: ${palette.error};
      --text-accent: ${palette.primary};
      --text-accent-hover: var(--color-accent-1);

      --text-selection: ${palette.surfaceContainerHighest};
      --text-highlight-bg: ${palette.primaryContainer};
      --caret-color: ${palette.cursor};

      /* Titlebar and ribbon, so the window frame matches the note surface. */
      --titlebar-background: ${palette.surface};
      --titlebar-background-focused: ${palette.surfaceContainer};
      --titlebar-text-color: ${palette.onSurfaceVariant};
      --ribbon-background: ${palette.surfaceContainer};
      --divider-color: ${palette.outlineVariant};
    }
  '';
in
{
  # Written as a real file rather than linked, unlike the rest of this config.
  #
  # The vault is a git repository that tracks .obsidian, and it syncs to iOS.
  # A /nix/store symlink would be committed as a symlink and then dangle on
  # every other device, so the bytes have to actually be there.
  home.activation.obsidianPalette = lib.hm.dag.entryAfter [ "writeBoundary" ] (
    lib.concatMapStrings (vault: ''
      obsidian="$HOME/${vault}/.obsidian"
      if [ -d "$obsidian" ]; then
        run mkdir -p "$obsidian/themes/${themeName}"
        run install -m 644 ${theme} "$obsidian/themes/${themeName}/theme.css"
        run install -m 644 ${manifest} "$obsidian/themes/${themeName}/manifest.json"

        # Select it, and drop the CSS snippet an earlier version of this module
        # used instead. Both applying at once would be two mechanisms setting the
        # same variables.
        #
        # appearance.json is Obsidian's to rewrite, so it is patched in place
        # rather than managed as a read-only symlink -- through a temp file and a
        # move, so a running Obsidian never reads a half-written config.
        #
        # cssTheme is set on every switch, not just when unset. That does mean
        # picking a different theme in Obsidian's UI is reverted on the next
        # switch, which is the same bargain as the rest of this config: the
        # declared value wins. Comment out this module to choose in the UI.
        appearance="$obsidian/appearance.json"
        if [ -f "$appearance" ]; then
          tmp=$(mktemp)
          if ${pkgs.jq}/bin/jq \
               --arg theme "${themeName}" \
               '.cssTheme = $theme
                | if has("enabledCssSnippets")
                  then .enabledCssSnippets -= ["palette"]
                  else . end' \
               "$appearance" >"$tmp"; then
            if ! ${pkgs.jq}/bin/jq -e --arg t "${themeName}" '.cssTheme == $t' \
                 "$appearance" >/dev/null; then
              echo "obsidian: cssTheme -> ${themeName} (restart Obsidian to load it)"
            fi
            run mv "$tmp" "$appearance"
          else
            rm -f "$tmp"
            echo "obsidian: could not patch $appearance; set the theme to" \
                 "'${themeName}' in Settings -> Appearance" >&2
          fi
        fi
        run rm -f "$obsidian/snippets/palette.css"
      fi
    '') vaults
  );
}
