{ ... }:
{
  programs.git = {
    enable = true;

    # Work identity and any machine-local overrides, from ~/.dotfiles_wh, which
    # stays on stow. This must keep winning: `includes` is emitted with
    # lib.mkAfter, so [include] lands last in the generated config and its
    # values override everything declared below.
    #
    # Note `includes` is deliberately NOT part of `settings` -- it is still its
    # own option and was not renamed.
    includes = [ { path = "~/.gitconfig_overrides"; } ];

    # One structured attrset for the whole gitconfig. The older split options
    # (userName, userEmail, aliases, extraConfig) still work via renames but
    # emit deprecation warnings on every evaluation, so they are consolidated
    # here: user.* and alias.* are just ordinary sections.
    settings = {
      user = {
        name = "mit-d";
        email = "derekmttn@gmail.com";
      };

      alias = {
        co = "checkout";
        sw = "switch";
        br = "branch";
        ci = "commit";
        st = "status";
        config-override = "!git config --file ~/.gitconfig_overrides";
        cb = "rev-parse --abbrev-ref HEAD";
        ri = "!git rebase -i origin/$(git rev-parse --abbrev-ref HEAD)";
        ocb = "!echo origin/$(git rev-parse --abbrev-ref HEAD)";
        ocm = "!echo origin/$(git remote show origin | sed -n \"s/.*HEAD branch: //p\")";
      };

      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      core = {
        # These files stay hand-written; see xdg.configFile below.
        excludesFile = "~/.config/git/ignore";
        attributesFile = "~/.config/git/attributes";
        fsmonitor = true;
        untrackedCache = true;
        autocrlf = false;
      };
      init.defaultBranch = "main";
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
        tool = "nvimdiff";
      };
      "difftool \"nvimdiff\"".cmd = "nvim -d \"$LOCAL\" \"$REMOTE\"";
      fetch = {
        prune = true;
        all = true;
      };
      help.autocorrect = "prompt";
      commit.verbose = true;
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
      merge.conflictstyle = "diff3";
      pull.rebase = true;
      pager.status = true;
    };
  };

  # Kept as files rather than programs.git's `ignores`/`attributes` lists:
  # `ignore` is ~150 lines organised into commented sections, which a Nix
  # list of strings would flatten and obscure.
  xdg.configFile."git/ignore".source = ../../git/.config/git/ignore;
  xdg.configFile."git/attributes".source = ../../git/.config/git/attributes;
}
