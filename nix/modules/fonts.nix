{ pkgs, ... }: {
  # Replaces the font-* casks; noto-fonts covers the Sans/Serif/Math/
  # Mono/Symbols variants that were separate casks. Installed to
  # /Library/Fonts/Nix Fonts by nix-darwin.
  fonts.packages = [
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-cjk-serif
    pkgs.noto-fonts-color-emoji
    pkgs.source-code-pro
    pkgs.nerd-fonts.sauce-code-pro
  ];
}
