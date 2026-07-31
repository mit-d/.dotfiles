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

    initContent = lib.mkMerge [
      # Slot 1000 (the default). Everything the hand-written rc did, in its
      # original order -- including the ~/.dotfiles_wh overlay source, which
      # must stay inside this file because the named-dir block at the end
      # depends on WH_VANGUARD_PROJECT_DIR that the overlay sets.
      (lib.mkOrder 1000 ''
        source "${config.home.homeDirectory}/.zsh/rc.zsh"
      '')
    ];
  };

  # Machinery linked individually, never as a directory: ~/.dotfiles_wh
  # stows vg.zsh into ~/.zsh and _vg into ~/.zsh/completions, and a
  # whole-directory store symlink would leave them nowhere to go.
  home.file = {
    ".zsh/rc.zsh".source = ../../zsh/.zsh/rc.zsh;
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
    ".zsh/posix/nvm.sh".source = ../../zsh/.zsh/posix/nvm.sh;
    ".zsh/posix/utils.sh".source = ../../zsh/.zsh/posix/utils.sh;

    ".local/bin/check-deps".source = ../../zsh/.local/bin/check-deps;
    ".local/bin/git_update_mr.sh".source = ../../zsh/.local/bin/git_update_mr.sh;
  };
}
