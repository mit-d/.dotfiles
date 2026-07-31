{ pkgs, ... }:
{
  # home-manager's fish module sets `programs.man.generateCaches = mkDefault
  # true`, because fish builds its completions from man pages. But
  # programs.man.package defaults to null on darwin once home.stateVersion is
  # >= 26.05 -- deliberately, since macOS ships its own man and home-manager
  # declines to shadow it with GNU man-db. That darwin check comes first in the
  # option's if-chain, so enabling man-db would not change it either.
  #
  # The result is a contradiction home-manager correctly warns about: caches
  # requested, no man package to build them from. Turning it off resolves the
  # warning without changing behaviour, since it was already a no-op.
  programs.man.generateCaches = false;

  programs.fish = {
    enable = true;

    # Key bindings and colour theme, declared here rather than left in the
    # conf.d/fish_frozen_*.fish files fish generated when it upgraded to 4.3.
    # Those files exist only to migrate these variables from universal to
    # global scope, and their own comments recommend moving the settings into
    # config.fish -- which is what this is. Declaring them natively also avoids
    # linking a file that `fish_config` expects to rewrite, which it could not
    # do through a read-only store symlink.
    #
    # `set --erase --universal fish_key_bindings` from the original is not
    # reproduced: it was one-time migration tidying, and global already takes
    # precedence over universal in fish's lookup order.
    interactiveShellInit = ''
      set --global fish_key_bindings fish_vi_key_bindings

      set --global fish_color_autosuggestion 555 brblack
      set --global fish_color_cancel -r
      set --global fish_color_command 005fd7
      set --global fish_color_comment 990000
      set --global fish_color_cwd green
      set --global fish_color_cwd_root red
      set --global fish_color_end 009900
      set --global fish_color_error ff0000
      set --global fish_color_escape 00a6b2
      set --global fish_color_history_current --bold
      set --global fish_color_host normal
      set --global fish_color_host_remote yellow
      set --global fish_color_match --background=brblue
      set --global fish_color_normal normal
      set --global fish_color_operator 00a6b2
      set --global fish_color_param 00afff
      set --global fish_color_quote 999900
      set --global fish_color_redirection 00afff
      set --global fish_color_search_match bryellow --background=brblack
      set --global fish_color_selection white --bold --background=brblack
      set --global fish_color_status red
      set --global fish_color_user brgreen
      set --global fish_color_valid_path --underline

      # Intentionally empty, matching the original.
      set --global fish_pager_color_completion
      set --global fish_pager_color_description B3A06D yellow
      set --global fish_pager_color_prefix white --bold --underline
      set --global fish_pager_color_progress brwhite --background=cyan
      set --global fish_pager_color_selected_background -r
    '';

    # Replaces the 48 vendored functions/_pure_*.fish files. fisher is not
    # in nixpkgs and is no longer needed -- home-manager manages plugins.
    plugins = [
      {
        name = "pure";
        src = pkgs.fishPlugins.pure.src;
      }
    ];

    # Translated from fish/.config/fish/config.fish, which wrapped these in
    # `if status is-interactive` -- home-manager emits shellAbbrs into the
    # interactive path already.
    shellAbbrs = {
      _C = "| pbcopy";
      _G = "| grep -ni";
      _L = "| less";
      _NULL = "&>/dev/null";
      _T = "| tee -a";
      _Z = "| fzf";
      act = "source .venv/bin/activate";
      curlh = "curl -I";
      dco = "docker compose";
      dcou = "docker compose up -d --remove-orphans";
      dcr = {
        setCursor = true;
        expansion = "docker compose run -it % --rm";
      };
      deact = "deactivate";
      dfh = "df -h";
      digs = "dig +short";
      dk = "docker";
      dkbd = "docker build .";
      dkbt = {
        setCursor = true;
        expansion = "docker build -t % .";
      };
      dke = {
        setCursor = true;
        expansion = "docker exec -it % /bin/bash";
      };
      dki = "docker images";
      dkig = {
        setCursor = true;
        expansion = "docker images | grep % | awk '{print $3}'";
      };
      dkpa = "docker system prune -a";
      dkr = "docker run -it";
      drid = "docker rmi -f $(docker images -q -f \"dangling=true\")";
      eof = "<<EOF";
      freeze = "uv pip freeze > requirements.txt";
      gb = "git branch";
      # NOTE: `.py$` is unescaped here on purpose, matching what the fish
      # abbreviation actually expanded to before the migration. `\.py$` would be
      # the better regex -- `.py$` also matches e.g. "apy" -- but changing it
      # here would be a silent behaviour change smuggled in under a migration,
      # and would leave a permanent diff that future verification could not
      # distinguish from a real error. Tighten it as its own deliberate commit.
      gblackchanged = "black $(git diff --name-only \"$(git merge-base HEAD origin/main)\"...HEAD | grep -E \".py$\")";
      gblacknew = "black $(git diff --name-only --diff-filter=A \"$(git merge-base HEAD origin/main)\"...HEAD | grep -E \".py$\")";
      gc = "git commit";
      gchanged = "git diff --name-only \"$(git merge-base HEAD origin/main)\"...HEAD";
      gd = "git diff";
      gf = "git fetch --prune --tags";
      gl = "git log";
      glg = "git log --graph --oneline";
      glgl = "git log --graph --oneline --all";
      gr = "git reset --mixed";
      grh = "git reset --hard";
      grs = "git reset --soft";
      gs = "git status -s";
      gss = "git status";
      hz = "history 1 | fzf";
      k = "kubectl";
      kctx = "kubectl config use-context";
      kdp = "kubectl describe pod";
      kex = "kubectl exec -it";
      kga = "kubectl get all";
      kgn = "kubectl get nodes";
      kgp = "kubectl get pods";
      kl = "kubectl logs";
      kns = "kubectl config set-context --current --namespace";
      lock = "uv lock";
      manz = {
        setCursor = true;
        expansion = "apropos % | fzf | cut -f1,2 -d' ' | xargs man";
      };
      nslook = "nslookup";
      ping5 = "ping -c 5";
      psa = "ps aux";
      req = "uv pip install -r requirements.txt";
      sync = "uv sync";
      tracer = "traceroute";
      unstage = "git restore --staged";
      upt = "uptime";
      uvadd = "uv add";
      uvi = "uv pip install";
      uvl = "uv pip list";
      uvr = "uv pip uninstall";
      venv = "uv venv";
      wgetr = "wget -r";
      whoa = "who -a";
      db = {
        setCursor = true;
        expansion = "echo \"export DB_NAME=%\" >~/.db-env && source ~/.db-env";
      };
      t = {
        setCursor = true;
        expansion = "task %";
      };
    };
  };

  # nx completion is hand-written and has no upstream package.
  xdg.configFile."fish/completions/nx.fish".source = ../../fish/.config/fish/completions/nx.fish;

  # No links for conf.d/fish_frozen_key_bindings.fish or
  # conf.d/fish_frozen_theme.fish -- their settings are declared natively in
  # programs.fish.interactiveShellInit above and the files are retired. See the
  # comment there for the reasoning.
}
