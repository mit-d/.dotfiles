"""Turn a live profile tree into the two committed source files.

The inverse of ffbm_model.generate, plus the metadata inference that makes
bootstrapping possible without hand-writing 22 envs.

Post-pivot leftover: `_env_entry` below still infers `client`, `vertical`,
plain `tags` and a `folder` override from the profile. Since the pivot to
cluster config as the source of truth for envs (ffbm_cluster.py), only the
`extras` this function derives are actually merged onto that cluster config
by `ffbm.cmd_export` -- the rest is computed but discarded for any env the
cluster config already knows about. Left in place (and tested) because it is
still the only source for these fields when bootstrapping an env the cluster
config doesn't cover.
"""

import collections
import copy
import re

import ffbm_model

# The normalization target. Deliberately constants rather than inferred from
# the live profile: the live URLs have drifted, and inferring would encode
# the very drift this pipeline exists to fix.
#
# Note: these url/keyword templates are no longer read by anything -- the
# exporter's harvested config is merged onto ffbm_cluster's {host}-bearing
# templates before it reaches generate(), so only this dict's *keys* still
# matter (as the CANONICAL pattern's app alternation). Kept as-is, templates
# and all, rather than stripped down, per the plan for this change.
DEFAULT_APPS = {
    "warranty": {
        "url": "https://warranty-{env}.bidboxpro.com/",
        "keyword": "{env}",
        "tag": "warranty",
    },
    "affiliate": {
        "url": "https://affiliate-{env}.bidboxpro.com/",
        "keyword": "{env}:affiliate",
        "tag": "affiliate",
    },
    "core": {
        "url": "https://core-{env}.bidboxpro.com/admin/login/?next=/admin/",
        "keyword": "{env}:core",
        "tag": "core",
    },
    "product": {
        "url": "https://product-{env}.bidboxpro.com/",
        "keyword": "{env}:product",
        "tag": "product",
    },
}

# Derived from ffbm_model.APP_NAMES, the single source of truth, so this
# module's canonical-title detection cannot silently diverge from
# ffbm_cluster's url templates.
APP_NAMES = ffbm_model.APP_NAMES
assert set(DEFAULT_APPS) == set(APP_NAMES), (
    "DEFAULT_APPS keys must match ffbm_model.APP_NAMES exactly"
)
APP_TAGS = {a["tag"] for a in DEFAULT_APPS.values()}

# Observed verticals. Anything else that is not an app tag or a c1: tag
# falls through to the env's plain `tags` list.
VERTICALS = {
    "homewarranty", "automotive", "boat", "builder",
    "firearm", "manufacture", "multi",
}

# Its children look canonical (warranty-local, ...) but localhost URLs do not
# fit the {env} template, so this folder stays static.
STATIC_DASHBOARD_FOLDERS = {"Local"}

DASHBOARDS = "Dashboards"
CANONICAL = re.compile(r"^(%s)-(.+)$" % "|".join(APP_NAMES))


def split(tree: dict, known_slugs=None) -> tuple:
    """Return (static_tree, envs_cfg).

    `known_slugs`, if given, restricts takeover to envs the cluster config
    can actually regenerate: a folder is only treated as an env folder (and
    therefore only stripped from static.json) if its derived slug is in
    `known_slugs`. A retired env absent from the cluster config is left in
    static.json, bookmarks intact, instead of being silently dropped.
    Default `None` preserves the old behaviour -- every candidate is taken.
    """
    static = copy.deepcopy(tree)
    toolbar = ffbm_model.find_root(static, "toolbarFolder")
    dashboards = next(
        (c for c in toolbar["children"] if c["title"] == DASHBOARDS), None
    )
    groups = []
    if dashboards is not None:
        _collect(dashboards, [], groups, known_slugs)
        _prune(dashboards, known_slugs)
    ffbm_model.reindex(static)
    return static, {"apps": dict(DEFAULT_APPS), "groups": groups}


def _is_env_folder(node: dict, known_slugs=None) -> bool:
    if node.get("typeCode") != 2 or node["title"] in STATIC_DASHBOARD_FOLDERS:
        return False
    slug = _derive_slug(node, _candidate_slugs(node))
    if slug is None:
        return False
    if known_slugs is not None and slug not in known_slugs:
        return False
    title = node["title"]
    return title == slug or title.startswith(slug)


def _candidate_slugs(node: dict) -> list:
    """Slug candidates read from each canonical-looking child's title.

    The folder title itself is not trusted: an annotation like
    " (DEPRECATED)" would otherwise make every canonical child look
    non-canonical, since none of them carry the annotation.
    """
    slugs = []
    for child in node.get("children", []):
        if child.get("typeCode") != 1:
            continue
        match = CANONICAL.match(child.get("title") or "")
        if match:
            slugs.append(match.group(2))
    return slugs


def _derive_slug(node: dict, candidates: list):
    """The most common candidate slug, deterministically tie-broken.

    Ties prefer a candidate equal to the folder title (the common case),
    then fall back to alphabetically first so the result never depends on
    child order.
    """
    if not candidates:
        return None
    counts = collections.Counter(candidates)
    top = max(counts.values())
    tied = sorted(s for s, n in counts.items() if n == top)
    return node["title"] if node["title"] in tied else tied[0]


def _canonical_app(title: str, slug: str):
    """The app name if `title` is `<app>-<slug>`, else None."""
    match = CANONICAL.match(title or "")
    if match and match.group(2).lower() == slug.lower():
        return match.group(1)
    return None


def _collect(node: dict, path: list, groups: list, known_slugs=None) -> None:
    """Walk Dashboards, recording env folders grouped by their folder path."""
    envs = [c for c in node.get("children", []) if _is_env_folder(c, known_slugs)]
    if envs:
        groups.append({"path": list(path), "envs": [_env_entry(e) for e in envs]})
    for child in node.get("children", []):
        if child.get("typeCode") == 2 and not _is_env_folder(child, known_slugs):
            if child["title"] in STATIC_DASHBOARD_FOLDERS:
                continue
            _collect(child, path + [child["title"]], groups, known_slugs)


def _env_entry(folder: dict) -> dict:
    slug = _derive_slug(folder, _candidate_slugs(folder))
    entry = {"slug": slug}
    if folder["title"] != slug:
        entry["folder"] = folder["title"]

    tags, extras = set(), []
    for child in folder.get("children", []):
        if child.get("typeCode") == 1 and _canonical_app(child["title"], slug):
            tags.update(t for t in child.get("tags", "").split(",") if t)
        else:
            extras.append(_extra_entry(child))

    client = next((t[3:] for t in sorted(tags) if t.startswith("c1:")), None)
    vertical = next((t for t in sorted(tags) if t in VERTICALS), None)
    # Only the chosen vertical is stripped; any others fall through to plain
    # tags rather than being silently dropped.
    plain = sorted(
        t for t in tags
        if t not in APP_TAGS and t != vertical and not t.startswith("c1:")
    )

    if client:
        entry["client"] = client
    if vertical:
        entry["vertical"] = vertical
    if plain:
        entry["tags"] = plain
    if extras:
        entry["extras"] = extras
    return entry


def _extra_entry(node: dict) -> dict:
    extra = {"title": node.get("title", ""), "url": node.get("uri", "")}
    if node.get("keyword"):
        extra["keyword"] = node["keyword"]
    if node.get("tags"):
        extra["tags"] = [t for t in node["tags"].split(",") if t]
    return extra


def _prune(node: dict, known_slugs=None) -> None:
    """Drop env folders, then any group folder left empty by that removal."""
    kept = []
    for child in node.get("children", []):
        if _is_env_folder(child, known_slugs):
            continue
        if child.get("typeCode") == 2 and child["title"] not in STATIC_DASHBOARD_FOLDERS:
            _prune(child, known_slugs)
            if not child["children"]:
                continue
        kept.append(child)
    node["children"] = kept
