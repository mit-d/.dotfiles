"""Compare two bookmark trees.

Shared by `ffbm diff` (build vs live profile) and `ffbm verify` (build vs a
scratch profile after Restore). Compares folder path, uri, keyword and tags.
guid / index / dateAdded / lastModified are ignored on purpose: a restored
profile differs there legitimately, and including them would bury the
signal.
"""

COMPARED_FIELDS = ("uri", "keyword", "tags")


def flatten(tree: dict) -> dict:
    """path -> {uri, keyword, tags} for every bookmark in the tree."""
    out = {}
    for child in tree.get("children", []):
        _walk(child, [], out)
    return out


def _walk(node, prefix, out) -> None:
    title = node.get("title", "")
    if node.get("typeCode") == 2:
        for child in node.get("children", []):
            _walk(child, prefix + [title], out)
        return
    path = "/".join(prefix + [title])
    out[path] = {f: node.get(f, "") for f in COMPARED_FIELDS}


def diff(left: dict, right: dict) -> dict:
    """What changes going from left to right."""
    a, b = flatten(left), flatten(right)
    added = sorted(set(b) - set(a))
    removed = sorted(set(a) - set(b))
    changed = []
    for path in sorted(set(a) & set(b)):
        fields = {f: (a[path][f], b[path][f]) for f in COMPARED_FIELDS
                  if a[path][f] != b[path][f]}
        if fields:
            changed.append({"path": path, "fields": fields})
    return {"added": added, "removed": removed, "changed": changed}


def is_clean(result: dict) -> bool:
    return not (result["added"] or result["removed"] or result["changed"])


def format_report(result: dict) -> str:
    lines = [
        f"{len(result['added'])} added, "
        f"{len(result['removed'])} removed, "
        f"{len(result['changed'])} changed",
        "",
    ]
    for path in result["added"]:
        lines.append(f"  + {path}")
    for path in result["removed"]:
        lines.append(f"  - {path}")
    for change in result["changed"]:
        lines.append(f"  ~ {change['path']}")
        for field, (old, new) in sorted(change["fields"].items()):
            lines.append(f"      {field}: {old!r} -> {new!r}")
    return "\n".join(lines)
