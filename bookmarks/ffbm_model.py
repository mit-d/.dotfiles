"""The Firefox JSON-backup node shape, and the rules for generating it.

Generated nodes use a fixed timestamp rather than "now" so that
regenerating produces byte-identical output instead of churn.
"""

import base64
import copy
import hashlib
import json

# 2026-07-28T00:00:00Z in microseconds. Firefox stores usec, not sec.
GENERATED_USEC = 1785196800000000

PLACE = "text/x-moz-place"
CONTAINER = "text/x-moz-place-container"


def derive_guid(seed: str) -> str:
    """A stable 12-char base64url GUID, matching Firefox's format.

    Deterministic so that a reload presents Sync with the same items
    rather than a wave of deletes and inserts.
    """
    digest = hashlib.sha256(seed.encode("utf-8")).digest()
    return base64.urlsafe_b64encode(digest).decode("ascii")[:12]


def dumps(tree) -> str:
    """Serialize deterministically, ASCII-only, newline-terminated.

    ensure_ascii satisfies the check-unicode pre-commit hook; the trailing
    newline satisfies end-of-file-fixer. Both would otherwise rewrite the
    file on commit and show a spurious diff on the next generate.
    """
    return json.dumps(tree, indent=2, ensure_ascii=True) + "\n"


def folder(guid: str, title: str, children: list) -> dict:
    return {
        "guid": guid,
        "title": title,
        "index": 0,
        "dateAdded": GENERATED_USEC,
        "lastModified": GENERATED_USEC,
        "typeCode": 2,
        "type": CONTAINER,
        "children": children,
    }


def env_tags(app: dict, env: dict) -> list:
    """app tag, then vertical, then env tags, then the client tag."""
    tags = []
    if app.get("tag"):
        tags.append(app["tag"])
    if env.get("vertical"):
        tags.append(env["vertical"])
    tags.extend(env.get("tags", []))
    if env.get("client"):
        tags.append("c1:" + env["client"])
    seen, out = set(), []
    for tag in tags:
        if tag not in seen:
            seen.add(tag)
            out.append(tag)
    return out


def env_bookmark(app_name: str, app: dict, env: dict) -> dict:
    slug = env["slug"]
    node = {
        "guid": derive_guid(f"{slug}:{app_name}"),
        "title": f"{app_name}-{slug}",
        "index": 0,
        "dateAdded": GENERATED_USEC,
        "lastModified": GENERATED_USEC,
        "typeCode": 1,
        "type": PLACE,
        "uri": app["url"].replace("{env}", slug),
        "keyword": app["keyword"].replace("{env}", slug),
    }
    tags = env_tags(app, env)
    if tags:
        node["tags"] = ",".join(tags)
    return node


def extra_bookmark(extra: dict) -> dict:
    """A one-off bookmark kept inside an env folder, passed through as-is."""
    node = {
        "guid": derive_guid("extra:" + extra["url"]),
        "title": extra["title"],
        "index": 0,
        "dateAdded": GENERATED_USEC,
        "lastModified": GENERATED_USEC,
        "typeCode": 1,
        "type": PLACE,
        "uri": extra["url"],
    }
    if extra.get("keyword"):
        node["keyword"] = extra["keyword"]
    if extra.get("tags"):
        node["tags"] = ",".join(extra["tags"])
    return node


def env_folder(env: dict, apps: dict) -> dict:
    """One folder per env: the four generated apps, then any extras."""
    children = [env_bookmark(name, apps[name], env) for name in apps]
    children.extend(extra_bookmark(e) for e in env.get("extras", []))
    return folder(
        derive_guid("folder:" + env["slug"]),
        env.get("folder", env["slug"]),
        children,
    )


def reindex(node) -> None:
    for i, child in enumerate(node.get("children", [])):
        child["index"] = i
        reindex(child)


def find_root(tree: dict, marker: str) -> dict:
    for child in tree.get("children", []):
        if child.get("root") == marker:
            return child
    raise KeyError(f"no root {marker!r} in tree")


def ensure_child_folder(parent: dict, title: str, guid_seed: str) -> dict:
    """Get-or-create a subfolder by title.

    Get-or-create matters because group paths overlap: ["Prod"] and
    ["Prod", "Other"] must share one "Prod" folder, not create two.
    """
    for child in parent["children"]:
        if child["typeCode"] == 2 and child["title"] == title:
            return child
    node = folder(derive_guid(guid_seed), title, [])
    parent["children"].append(node)
    return node


def generate(envs_cfg: dict, static_tree: dict) -> dict:
    """static.json plus the generated env folders, spliced under Dashboards."""
    tree = copy.deepcopy(static_tree)
    toolbar = find_root(tree, "toolbarFolder")
    dashboards = ensure_child_folder(toolbar, "Dashboards", "folder:Dashboards")
    apps = envs_cfg["apps"]

    for group in envs_cfg["groups"]:
        node, prefix = dashboards, []
        for part in group["path"]:
            prefix.append(part)
            node = ensure_child_folder(node, part, "group:" + "/".join(prefix))
        for env in group["envs"]:
            node["children"].append(env_folder(env, apps))

    reindex(tree)
    return tree
