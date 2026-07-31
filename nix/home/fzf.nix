{ ... }:
let
  palette = import ../palettes/active.nix;
in
{
  # Fully palette-driven: fzf takes colours as an option string, so unlike bat and
  # btop there is no builtin-theme limitation here.
  #
  # enableZshIntegration replaces the hand-rolled `source <(fzf --zsh)` that used
  # to sit in zsh/.zsh/.zshrc -- leaving both would source the integration twice.
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    colors = {
      "bg" = palette.surface;
      "bg+" = palette.surfaceContainer;
      "fg" = palette.onSurface;
      "fg+" = palette.onSurfaceStrong;
      "hl" = palette.primary;
      "hl+" = palette.primary;
      "info" = palette.onSurfaceVariant;
      "border" = palette.outline;
      "prompt" = palette.ansi.brightBlue;
      "pointer" = palette.error;
      "marker" = palette.ansi.brightGreen;
      "spinner" = palette.ansi.brightMagenta;
      "header" = palette.ansi.brightCyan;
    };
  };
}
