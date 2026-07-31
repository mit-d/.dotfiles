{ ... }:
{
  # Moved here from ~/.dotfiles_wh/zsh/.zshrc, so it is declared once in nix
  # rather than hand-rolled in the work overlay.
  #
  # Note this is not a speed win: home-manager emits the same
  # `eval "$(zoxide init ...)"` and still forks once per interactive startup.
  # What it buys is a single declarative source of truth and an absolute store
  # path instead of a PATH lookup.
  #
  # --cmd=cd is deliberate and load-bearing: it makes zoxide *replace* `cd`
  # rather than adding a separate `z`. Dropping it would silently change how
  # every `cd` behaves.
  programs.zoxide = {
    enable = true;
    options = [ "--cmd=cd" ];
  };
}
