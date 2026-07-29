"""Read the Vanguard k8s cluster config as the source of truth for envs.

Shells out to bash to source ns_env.sh -- which sources its seven siblings --
and dumps the resolved variables. All eight files are pure exports with no
side effects, so sourcing is safe, and bash parses its own array syntax far
more reliably than a regex could.
"""

import re
import subprocess
from pathlib import Path

CLUSTER_DIR = Path("/Users/derekmitten/Source/vanguard/cluster")
DEFAULT_HOST = "bidboxpro.com"

# Deliberately 4 apps. `portal` is in services_promote_list but is the
# servicer portal -- tokenised URLs, no landing page -- so it is not
# bookmarkable.
APPS = {
    "warranty": {
        "url": "https://warranty-{env}.{host}/",
        "keyword": "{env}",
        "tag": "warranty",
    },
    "affiliate": {
        "url": "https://affiliate-{env}.{host}/",
        "keyword": "{env}:affiliate",
        "tag": "affiliate",
    },
    "core": {
        "url": "https://core-{env}.{host}/admin/login/?next=/admin/",
        "keyword": "{env}:core",
        "tag": "core",
    },
    "product": {
        "url": "https://product-{env}.{host}/",
        "keyword": "{env}:product",
        "tag": "product",
    },
}

# Folder order, most-stable channel first. Unknown channels sort last.
CHANNEL_ORDER = ("prod", "rc", "staging", "dev")

_DUMP = r"""
source ./ns_env.sh >/dev/null 2>&1
for e in "${ns_map_all[@]}"; do
  eval "fl=\${flavor_$e:-}"
  eval "tg=\${tag_$e:-}"
  eval "ho=\${host_$e:-}"
  printf '%s\t%s\t%s\t%s\n' "$e" "$fl" "$tg" "$ho"
done
"""


def read_envs(cluster_dir=CLUSTER_DIR) -> list:
    """[{slug, vertical, channel, host}] straight from the cluster config."""
    directory = Path(cluster_dir)
    if not (directory / "ns_env.sh").exists():
        raise FileNotFoundError(f"no ns_env.sh in {directory}")
    result = subprocess.run(
        ["bash", "-c", _DUMP],
        cwd=directory,
        capture_output=True,
        text=True,
        check=True,
    )
    envs = []
    for line in result.stdout.splitlines():
        if not line.strip():
            continue
        slug, vertical, channel, host = line.split("\t")
        envs.append({
            "slug": slug,
            "vertical": vertical,
            "channel": channel,
            "host": host or DEFAULT_HOST,
        })
    return envs


def _channel_key(channel: str):
    order = CHANNEL_ORDER.index(channel) if channel in CHANNEL_ORDER else len(CHANNEL_ORDER)
    return (order, channel)


def build_config(envs: list) -> dict:
    """Group envs by release channel into the envs.json shape."""
    by_channel = {}
    for env in envs:
        by_channel.setdefault(env["channel"], []).append(env)

    groups = []
    for channel in sorted(by_channel, key=_channel_key):
        entries = []
        for env in sorted(by_channel[channel], key=lambda e: e["slug"]):
            entry = {"slug": env["slug"], "host": env["host"], "tags": [channel]}
            if env["vertical"]:
                entry["vertical"] = env["vertical"]
            entries.append(entry)
        groups.append({"path": [channel], "envs": entries})
    return {"apps": dict(APPS), "groups": groups}


_APP_ALTERNATION = "|".join(re.escape(app) for app in APPS)
_APP_SLUG = re.compile(r"^(?:%s)-(.+)$" % _APP_ALTERNATION)
_SLUG_APP = re.compile(r"^(.+)-(?:%s)$" % _APP_ALTERNATION)


def _is_canonical_duplicate(title: str, slugs: set) -> bool:
    """Whether `title` looks like `<app>-<slug>` or `<slug>-<app>`.

    `app` is any of `APPS`, `slug` any cluster-managed slug (matched
    case-insensitively, as `ffbm_export._canonical_app` does). Both
    orderings matter: `<slug>-<app>` (e.g. `oemrc-core`) is the inverted,
    copy-pasted title this pipeline exists to fix.
    """
    for pattern in (_APP_SLUG, _SLUG_APP):
        match = pattern.match(title or "")
        if match and match.group(1).lower() in slugs:
            return True
    return False


def merge_extras(config: dict, harvested: dict) -> tuple:
    """Graft profile-harvested extras onto the cluster-derived env matrix.

    The cluster config is authoritative for which envs exist and what their
    urls are; only the profile knows about one-off bookmarks a human filed
    inside an env folder. Without this they would be stripped from
    static.json and never regenerated -- silent deletion.

    `harvested` maps slug -> list of extra dicts, as gathered from
    `ffbm_export.split`. Extras for a slug absent from `config` are ignored
    -- that env isn't in the cluster config, so there is nowhere to graft
    them onto; a retired env's bookmarks are instead kept static by
    `ffbm_export.split`'s `known_slugs` parameter. Does not mutate `config`.

    Extras whose title is itself a canonical `<app>-<slug>` (or inverted
    `<slug>-<app>`) bookmark for a cluster-managed slug are stale
    copy-paste duplicates of an env the cluster config already generates,
    so they are dropped rather than grafted. Returns `(config, dropped)`
    where `dropped` is the sorted list of dropped titles -- silent removal
    is exactly the failure mode this pipeline guards against.
    """
    slugs = {env["slug"].lower() for group in config["groups"] for env in group["envs"]}
    dropped = []
    groups = []
    for group in config["groups"]:
        envs = []
        for env in group["envs"]:
            env = dict(env)
            extras = harvested.get(env["slug"]) or []
            kept = []
            for extra in extras:
                if _is_canonical_duplicate(extra.get("title"), slugs):
                    dropped.append(extra["title"])
                else:
                    kept.append(extra)
            if kept:
                env["extras"] = kept
            envs.append(env)
        groups.append({**group, "envs": envs})
    return {**config, "groups": groups}, sorted(dropped)
