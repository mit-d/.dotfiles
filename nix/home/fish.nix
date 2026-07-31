{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

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
      gblackchanged = "black $(git diff --name-only \"$(git merge-base HEAD origin/main)\"...HEAD | grep -E \"\\.py$\")";
      gblacknew = "black $(git diff --name-only --diff-filter=A \"$(git merge-base HEAD origin/main)\"...HEAD | grep -E \"\\.py$\")";
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
}
