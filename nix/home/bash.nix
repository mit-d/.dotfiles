{ ... }:
{
  programs.bash = {
    enable = true;

    # From bash/.bashrc. home-manager emits its own non-interactive guard,
    # so the `[[ $- != *i* ]] && return` preamble is not reproduced here.
    initExtra = ''
      # Generated for envman. Do not edit.
      [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
    '';

    # From bash/.bash_profile. The original sourced posix/path.sh, which has
    # never existed -- the file is 00-path.sh. Fixed here rather than
    # faithfully reproducing a broken source line in generated config.
    profileExtra = ''
      # Shared POSIX path setup (cargo, local bins, etc.)
      . "$HOME/.zsh/posix/00-path.sh"
    '';

    # From bash/.bash_logout.
    logoutExtra = ''
      # Clear the screen for security's sake.
      clear
    '';
  };
}
