"""Compare two bookmark trees.

Shared by `ffbm diff` (build vs live profile) and `ffbm verify` (build vs a
scratch profile after Restore). Compares folder path, uri, keyword and tags.
guid / index / dateAdded / lastModified are ignored on purpose: a restored
profile differs there legitimately, and including them would bury the
signal.
"""

import re

import ffbm_model

COMPARED_FIELDS = ("uri", "keyword", "tags")

# Only a canonical `<app>-<slug>` title is safe for the tail-correlation pass
# in `diff` below: see the comment there for why.
_CANONICAL_TITLE = re.compile(r"^(%s)-(.+)$" % "|".join(ffbm_model.APP_NAMES))


def flatten(tree: dict) -> dict:
    """path -> {uri, keyword, tags} for every bookmark in the tree.

    Titles need not be unique within a folder. When more than one
    bookmark shares a path, each is disambiguated by appending its uri
    (`f"{path}#{uri}"`) rather than one silently overwriting another;
    paths with no collision are left bare so ordinary keys stay
    readable. (A title containing "/" can still be confused with a
    folder boundary -- known, not handled here.)
    """
    pairs = []
    for child in tree.get("children", []):
        _walk(child, [], pairs)

    groups = {}
    for path, node in pairs:
        groups.setdefault(path, []).append(node)

    out = {}
    for path, nodes in groups.items():
        for node in nodes:
            key = path if len(nodes) == 1 else f"{path}#{node.get('uri', '')}"
            out[key] = {f: node.get(f, "") for f in COMPARED_FIELDS}
    return out


def _walk(node, prefix, pairs) -> None:
    type_code = node.get("typeCode")
    title = node.get("title", "")
    if type_code == 2:
        for child in node.get("children", []):
            _walk(child, prefix + [title], pairs)
        return
    if type_code != 1:
        # Not a bookmark (e.g. a separator, typeCode 3) -- skip it rather
        # than let it masquerade as a bookmark with empty uri/keyword/tags.
        return
    path = "/".join(prefix + [title])
    pairs.append((path, node))


def _tail(path: str) -> tuple:
    """The final two path segments: `<env folder>/<title>`.

    A disambiguation suffix (`#uri`, added by `flatten` for colliding
    titles) is stripped first since it can itself contain slashes and
    would otherwise corrupt the split.
    """
    bare = path.split("#", 1)[0]
    return tuple(bare.split("/")[-2:])


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

    # Correlate renames/moves: an added and a removed entry that share a
    # uri are almost certainly the same bookmark relocated, not a delete
    # plus an unrelated create. Pairing removes both from their lists so
    # `removed` only ever holds bookmarks that are genuinely gone.
    removed_by_uri = {}
    for path in removed:
        removed_by_uri.setdefault(a[path]["uri"], []).append(path)
    added_by_uri = {}
    for path in added:
        added_by_uri.setdefault(b[path]["uri"], []).append(path)

    moved = []
    for uri in sorted(set(removed_by_uri) & set(added_by_uri)):
        from_paths = sorted(removed_by_uri[uri])
        to_paths = sorted(added_by_uri[uri])
        for from_path, to_path in zip(from_paths, to_paths):
            moved.append({"reason": "uri", "uri": uri, "from": from_path, "to": to_path})
            removed.remove(from_path)
            added.remove(to_path)

    # Second pass, over whatever is left: a bookmark whose folder AND uri
    # both changed is missed by the uri pass above, but usually keeps the
    # same trailing "<env folder>/<title>" -- only an ancestor group folder
    # moved. This is a modest correlation heuristic, not a rename-detection
    # engine: it pairs at most once per tail, deterministically, and leaves
    # anything it can't match alone in added/removed.
    #
    # Restricted to canonical `<app>-<slug>` titles: for those the title
    # itself embeds the slug, so two different envs can never produce the
    # same tail -- pairing on tail alone is provably safe. `extra_bookmark`
    # titles are arbitrary human text with no slug in them, so two unrelated
    # extras filed under the same env folder could share a generic title
    # (e.g. "Portal") and get mis-paired into a single "path"-reason move,
    # masking a real deletion behind a line that reads like a relocation.
    # Non-canonical entries are left for the coarser uri-only pass above, and
    # otherwise surface honestly as an addition or a deletion.
    removed_by_tail = {}
    for path in removed:
        tail = _tail(path)
        if _CANONICAL_TITLE.match(tail[-1]):
            removed_by_tail.setdefault(tail, []).append(path)
    added_by_tail = {}
    for path in added:
        tail = _tail(path)
        if _CANONICAL_TITLE.match(tail[-1]):
            added_by_tail.setdefault(tail, []).append(path)

    for tail in sorted(set(removed_by_tail) & set(added_by_tail)):
        from_paths = sorted(removed_by_tail[tail])
        to_paths = sorted(added_by_tail[tail])
        for from_path, to_path in zip(from_paths, to_paths):
            moved.append({
                "reason": "path",
                "from": from_path,
                "to": to_path,
                "from_uri": a[from_path]["uri"],
                "to_uri": b[to_path]["uri"],
            })
            removed.remove(from_path)
            added.remove(to_path)

    moved.sort(key=lambda m: (m["from"], m["to"]))

    return {"added": added, "removed": removed, "changed": changed, "moved": moved}


def is_clean(result: dict) -> bool:
    return not (
        result["added"]
        or result["removed"]
        or result["changed"]
        or result["moved"]
    )


def format_report(result: dict) -> str:
    lines = [
        f"{len(result['added'])} added, "
        f"{len(result['removed'])} removed, "
        f"{len(result['changed'])} changed, "
        f"{len(result['moved'])} moved",
        "",
    ]

    # removed comes first and gets its own header: every entry here is a
    # bookmark a Restore would delete, so it must not be skimmed past.
    if result["removed"]:
        lines.append("REMOVED -- would be DELETED by a Restore:")
        for path in result["removed"]:
            lines.append(f"  - {path}")
        lines.append("")

    if result["moved"]:
        lines.append("MOVED:")
        for move in result["moved"]:
            if move.get("reason") == "path":
                # Same folder/title, different uri -- more scrutiny-worthy
                # than a pure relocation, so show both uris.
                lines.append(
                    f"  ~ {move['from']} -> {move['to']} "
                    f"(uri: {move['from_uri']!r} -> {move['to_uri']!r})"
                )
            else:
                lines.append(f"  ~ {move['from']} -> {move['to']}")
        lines.append("")

    if result["added"]:
        lines.append("ADDED:")
        for path in result["added"]:
            lines.append(f"  + {path}")
        lines.append("")

    if result["changed"]:
        lines.append("CHANGED:")
        for change in result["changed"]:
            lines.append(f"  ~ {change['path']}")
            for field, (old, new) in sorted(change["fields"].items()):
                lines.append(f"      {field}: {old!r} -> {new!r}")

    return "\n".join(lines)
