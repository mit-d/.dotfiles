{ config, lib, ... }:
{
  programs.zsh = {
    enable = true;

    # Absolute path -- relative dotDir values are deprecated. Keeps the
    # existing ZDOTDIR layout, which ~/.dotfiles_wh also relies on.
    dotDir = "${config.home.homeDirectory}/.zsh";

    # Replaces both submodules. Sourced at mkOrder 1200, after the machinery
    # at 1000, which is what .zshrc's old comment required.
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 100000;
      save = 100000;
      # Preserves the existing history file rather than home-manager's
      # ~/.zsh_history default.
      path = "${config.home.homeDirectory}/.zsh/.zhistory";
      ignoreAllDups = true;
      ignoreSpace = true;
      extended = true;
      share = true;
    };

    # The repo's .zprofile cannot be linked as ~/.zsh/.zprofile: home-manager
    # generates that same file to source hm-session-vars.sh for *login* shells
    # (~/.zsh/.zshenv only sources it when the shell is not a login shell), and
    # a home.file entry for it silently wins, dropping the session variables.
    # Inlining the content here keeps both.
    profileExtra = builtins.readFile ../../zsh/.zsh/.zprofile;

    # Suppressed deliberately. completion.zsh runs its own compinit with a
    # 24-hour cache-freshness check (`~/.zcompdump(#qN.mh+24)`), which is
    # more careful than home-manager's unconditional default. Leaving this
    # unset would run compinit twice.
    completionInit = "";

    # The hand-written rc, inlined at slot 1000 (the default) rather than
    # linked out and sourced. Three reasons this beats a separate file:
    #
    #  - The repo file keeps its original `.zshrc` name. Renaming it would
    #    dangle the live stow symlink at ~/.zsh/.zshrc, and $ZDOTDIR would
    #    find a broken link and load no rc at all -- breaking every new shell
    #    before a switch ever happens. Inlining makes that class of breakage
    #    structurally impossible.
    #  - builtins.readFile reads bytes verbatim, with no Nix interpolation, so
    #    the rc's own ${BUFFER:1}, ${ZDOTDIR:-...} and friends need no escaping.
    #  - One generated file instead of a file that sources another file.
    #
    # Safe to inline because the rc locates its siblings via a hardcoded
    # ZSH_DIR="$HOME/.zsh", not from $0 -- so it does not care where it lives.
    #
    # Ordering: this lands at 1000 and plugins at 1200, which preserves the
    # requirement that zsh-syntax-highlighting load after all custom ZLE
    # widgets are defined. The ~/.dotfiles_wh overlay source also stays at its
    # original position *within* this content, before the named-dir block that
    # depends on the WH_VANGUARD_PROJECT_DIR it sets.
    initContent = lib.mkOrder 1000 (builtins.readFile ../../zsh/.zsh/.zshrc);
  };

  # Machinery linked individually, never as a directory: ~/.dotfiles_wh
  # stows vg.zsh into ~/.zsh and _vg into ~/.zsh/completions, and a
  # whole-directory store symlink would leave them nowhere to go.
  home.file = {
    # No entry for the rc itself -- its content is inlined into the generated
    # ~/.zsh/.zshrc via initContent above.
    ".zsh/abbr.zsh".source = ../../zsh/.zsh/abbr.zsh;
    ".zsh/completion.zsh".source = ../../zsh/.zsh/completion.zsh;
    ".zsh/prompt.zsh".source = ../../zsh/.zsh/prompt.zsh;
    ".zsh/interactive.zsh".source = ../../zsh/.zsh/interactive.zsh;
    ".zsh/.zsh_abbr_user".source = ../../zsh/.zsh/.zsh_abbr_user;
    # .zprofile is deliberately absent -- see programs.zsh.profileExtra above.
    ".zsh/.zlogin".source = ../../zsh/.zsh/.zlogin;
    ".zsh/.zlogout".source = ../../zsh/.zsh/.zlogout;

    # Same reasoning one level down: ~/.dotfiles_wh stows _vg into
    # ~/.zsh/completions, so link the single file, not the directory.
    ".zsh/completions/_task".source = ../../zsh/.zsh/completions/_task;

    ".zsh/posix/00-path.sh".source = ../../zsh/.zsh/posix/00-path.sh;
    ".zsh/posix/alias.sh".source = ../../zsh/.zsh/posix/alias.sh;
    ".zsh/posix/git.sh".source = ../../zsh/.zsh/posix/git.sh;
    ".zsh/posix/git_update_mr.sh".source = ../../zsh/.zsh/posix/git_update_mr.sh;
    ".zsh/posix/ipsum.sh".source = ../../zsh/.zsh/posix/ipsum.sh;
    ".zsh/posix/utils.sh".source = ../../zsh/.zsh/posix/utils.sh;

    ".local/bin/check-deps".source = ../../zsh/.local/bin/check-deps;
    ".local/bin/git_update_mr.sh".source = ../../zsh/.local/bin/git_update_mr.sh;
  };
}
