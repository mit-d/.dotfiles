{ lib, pkgs, ... }:
let
  palette = import ../palettes/active.nix;
  colors = import ../palettes/lib.nix;

  # Obsidian builds --color-accent, --color-accent-1 and --color-accent-2 from
  # these three, so handing it HSL gets the hover and active variants derived by
  # Obsidian's own rules instead of invented here.
  accent = colors.hexToHsl palette.primary;

  # Vaults to write the snippet into. Guarded at activation time, so listing a
  # vault that does not exist on this machine is harmless.
  vaults = [ "Documents/Obsidian/Notes" ];

  snippet = pkgs.writeText "obsidian-${palette.name}.css" ''
    /* ${palette.displayName or palette.name}, generated from nix/palettes by
       nix/home/obsidian.nix. Do not edit: rewritten on every switch.

       Enable once in Settings -> Appearance -> CSS snippets. Obsidian records
       that in .obsidian/appearance.json, which it rewrites itself and this
       config therefore leaves alone.

       Selector notes: the same values are set for both base colour schemes, so
       it does not matter which one Obsidian is in -- the palette has exactly one
       variant. `body.theme-dark` rather than `.theme-dark` because community
       themes set the primitives at that specificity (the Things theme sets
       --color-base-* under `.theme-dark`), and a bare `body` would lose. */

    body.theme-dark,
    body.theme-light {
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
      snippets="$HOME/${vault}/.obsidian/snippets"
      if [ -d "$HOME/${vault}/.obsidian" ]; then
        run mkdir -p "$snippets"
        run install -m 644 ${snippet} "$snippets/palette.css"
      fi
    '') vaults
  );
}
