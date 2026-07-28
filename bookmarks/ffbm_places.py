"""Read-only access to a Firefox profile's places.sqlite.

Produces the same tree shape ffbm_model generates, so the two are
directly comparable. Nothing outside this module knows sqlite.
"""

import shutil
import sqlite3
from pathlib import Path

# guid -> the "root" marker Firefox's JSON backup uses. Order matters: it is
# the order the roots appear in a real backup.
ROOTS = [
    ("menu________", "bookmarksMenuFolder"),
    ("toolbar_____", "toolbarFolder"),
    ("unfiled_____", "unfiledBookmarksFolder"),
    ("mobile______", "mobileFolder"),
]
TAGS_ROOT_GUID = "tags________"
PLACES_ROOT_GUID = "root________"


def snapshot(profile: Path, dest: Path) -> Path:
    """Copy places.sqlite and its WAL sidecars into dest; return the copy.

    Firefox holds the originals open in WAL mode, so the -wal file must come
    along or recent writes are invisible. The originals are only ever read.

    Sidecars are copied BEFORE the base file, not after. Firefox can
    checkpoint between our two copies, flushing WAL frames into the base
    file and resetting the live WAL. Copy base-then-wal and a checkpoint in
    that window silently drops committed pages: gone from the base copy
    (predates the flush) and gone from the wal copy (postdates the reset).
    Copy wal-then-base instead and the same checkpoint just makes the base
    copy already contain what the wal copy has -- replaying those frames
    over it is a no-op, since they're identical page images. Worst case is
    staleness (missing frames written after our wal copy), never loss.
    """
    src = Path(profile) / "places.sqlite"
    if not src.exists():
        raise FileNotFoundError(f"no places.sqlite in {profile}")
    out = Path(dest) / "places.sqlite"
    for suffix in ("-wal", "-shm"):
        sidecar = src.with_name(src.name + suffix)
        if sidecar.exists():
            shutil.copy2(sidecar, out.with_name(out.name + suffix))
    shutil.copy2(src, out)
    return out


def read_tree(db: Path) -> dict:
    """Return the four-root places tree in Firefox JSON-backup shape."""
    con = sqlite3.connect(f"file:{Path(db)}?mode=ro", uri=True)
    try:
        keywords = _read_keywords(con)
        tags = _read_tags(con)
        rows = con.execute(
            """
            SELECT id, type, fk, parent, position, title,
                   COALESCE(dateAdded, 0), COALESCE(lastModified, 0), guid
            FROM moz_bookmarks ORDER BY parent, position
            """
        ).fetchall()
        urls = dict(con.execute("SELECT id, url FROM moz_places"))
    finally:
        con.close()

    by_guid = {r[8]: r for r in rows}
    children_of = {}
    for row in rows:
        children_of.setdefault(row[3], []).append(row)

    root_row = by_guid[PLACES_ROOT_GUID]
    tree = _folder_node(root_row, [])
    tree["root"] = "placesRoot"

    for guid, marker in ROOTS:
        row = by_guid.get(guid)
        if row is None:
            continue
        node = _folder_node(row, _build_children(row[0], children_of, urls, keywords, tags))
        node["root"] = marker
        tree["children"].append(node)
    _reindex(tree)
    return tree


def _read_keywords(con) -> dict:
    """place_id -> keyword. min() keeps it deterministic if a place has two."""
    out = {}
    for place_id, keyword in con.execute(
        "SELECT place_id, keyword FROM moz_keywords WHERE place_id IS NOT NULL"
    ):
        if place_id not in out or keyword < out[place_id]:
            out[place_id] = keyword
    return out


def _read_tags(con) -> dict:
    """place_id -> sorted tag names.

    A tag is a folder under the tags root; a tagged URL is a child of that
    folder sharing the bookmark's fk (place id).
    """
    row = con.execute(
        "SELECT id FROM moz_bookmarks WHERE guid = ?", (TAGS_ROOT_GUID,)
    ).fetchone()
    if row is None:
        return {}
    out = {}
    for title, place_id in con.execute(
        """
        SELECT t.title, c.fk FROM moz_bookmarks t
        JOIN moz_bookmarks c ON c.parent = t.id
        WHERE t.parent = ? AND c.fk IS NOT NULL
        """,
        (row[0],),
    ):
        out.setdefault(place_id, set()).add(title)
    return {k: sorted(v) for k, v in out.items()}


def _build_children(parent_id, children_of, urls, keywords, tags) -> list:
    out = []
    for row in children_of.get(parent_id, []):
        _id, btype, fk, _parent, _pos, _title, _added, _mod, guid = row
        if guid == TAGS_ROOT_GUID:
            continue
        if btype == 2:
            out.append(
                _folder_node(row, _build_children(_id, children_of, urls, keywords, tags))
            )
        elif btype == 1:
            out.append(_place_node(row, urls, keywords, tags))
        # type 3 (separators) are dropped; this profile has none
    return out


def _folder_node(row, children) -> dict:
    _id, _btype, _fk, _parent, pos, title, added, mod, guid = row
    return {
        "guid": guid,
        "title": title or "",
        "index": pos,
        "dateAdded": added,
        "lastModified": mod,
        "typeCode": 2,
        "type": "text/x-moz-place-container",
        "children": children,
    }


def _place_node(row, urls, keywords, tags) -> dict:
    _id, _btype, fk, _parent, pos, title, added, mod, guid = row
    node = {
        "guid": guid,
        "title": title or "",
        "index": pos,
        "dateAdded": added,
        "lastModified": mod,
        "typeCode": 1,
        "type": "text/x-moz-place",
        "uri": urls.get(fk, ""),
    }
    if fk in keywords:
        node["keyword"] = keywords[fk]
    if fk in tags:
        node["tags"] = ",".join(tags[fk])
    return node


def _reindex(node) -> None:
    for i, child in enumerate(node.get("children", [])):
        child["index"] = i
        _reindex(child)
