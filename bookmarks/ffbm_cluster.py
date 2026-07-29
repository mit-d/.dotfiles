"""Read the Vanguard k8s cluster config as the source of truth for envs.

Shells out to bash to source ns_env.sh -- which sources its seven siblings --
and dumps the resolved variables. All eight files are pure exports with no
side effects, so sourcing is safe, and bash parses its own array syntax far
more reliably than a regex could.
"""

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
