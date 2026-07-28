{ config, lib, ... }:
let
  user = config.system.primaryUser;
  home = "/Users/${user}";

  # The nix system PATH, with the $HOME placeholder expanded. launchd env
  # vars are literal strings, so this mirrors the same replaceStrings dance
  # core.nix does for launchd.user.envVariables.PATH -- repeated per-agent
  # rather than relying on that global, because it carries a TODO doubting
  # whether it still applies, and these jobs break silently without a PATH.
  syncPath = lib.replaceStrings [ "$HOME" ] [ home ] config.environment.systemPath;

  # launchd matches a calendar entry only when *every* field in it matches,
  # so "Mon-Fri at these hours" cannot be written as two independent fields
  # the way cron's `0 8-18 * * 1-5` can -- it has to be enumerated.
  onWeekdaysAt =
    hours:
    lib.concatMap (
      Weekday:
      map (Hour: {
        inherit Weekday Hour;
        Minute = 0;
      }) hours
    ) (lib.range 1 5);

  # Both jobs are the same shape: source an optional env file, then run a
  # stowed python script out of ~/.local/bin under the real nix PATH.
  syncAgent =
    {
      pyScript,
      hours,
      logName,
      envFile ? null,
    }:
    {
      # These scripts resolve `glab` / `linear-cli` with shutil.which(), so
      # PATH is load-bearing. This is why the jobs moved off cron: cron runs
      # them with /usr/gnu/bin:/usr/local/bin:/bin:/usr/bin, which contains
      # no nix profile, so resolution failed once glab came from nix instead
      # of homebrew. Both tools are in environment.systemPackages, so
      # systemPath covers them. HOME is explicit because linear-cli reads its
      # API key from ~/.config/linear/credentials.toml.
      environment = {
        PATH = syncPath;
        HOME = home;
      };

      # Secrets deliberately stay out of the nix store (it is world-readable)
      # -- the env file is sourced from ~/.config at runtime instead.
      script = ''
        set -eu
      ''
      + lib.optionalString (envFile != null) ''
        . ${home}/.config/${envFile}
      ''
      + ''
        exec ${home}/.venv/bin/python ${home}/.local/bin/${pyScript}
      '';

      serviceConfig = {
        StartCalendarInterval = onWeekdaysAt hours;
        StandardOutPath = "/tmp/${logName}.log";
        StandardErrorPath = "/tmp/${logName}.log";
      };
    };
in
{
  # GitLab MRs -> Obsidian vault, hourly through the workday.
  launchd.user.agents.glab-sync-obsidian = syncAgent {
    pyScript = "glab_sync_obsidian.py";
    envFile = "glab-sync.env";
    hours = lib.range 8 18;
    logName = "glab-sync";
  };

  # Linear issues -> Obsidian vault. No env file: the script reads no
  # environment variables, and linear-cli authenticates from its own config
  # under ~/.config/linear. (The old crontab sourced jira-cli.env, which has
  # been vestigial since the script migrated from Jira to Linear.)
  launchd.user.agents.linear-sync-obsidian = syncAgent {
    pyScript = "jira-sync-obsidian.py";
    hours = [
      8
      10
      12
      15
      17
    ];
    logName = "jira-sync";
  };
}
