import sqlite3
from pathlib import Path

import ffbm_places

SCHEMA = """
CREATE TABLE moz_places (id INTEGER PRIMARY KEY, url TEXT);
CREATE TABLE moz_bookmarks (
    id INTEGER PRIMARY KEY, type INTEGER, fk INTEGER, parent INTEGER,
    position INTEGER, title TEXT, dateAdded INTEGER, lastModified INTEGER,
    guid TEXT);
CREATE TABLE moz_keywords (
    id INTEGER PRIMARY KEY, keyword TEXT, place_id INTEGER, post_data TEXT);
"""


def build_db(path: Path) -> Path:
    """A profile with one toolbar folder, one tagged+keyworded bookmark."""
    con = sqlite3.connect(path)
    con.executescript(SCHEMA)
    con.execute("INSERT INTO moz_places VALUES (100, 'https://w-rc.example/')")
    rows = [
        # id, type, fk,   parent, pos, title,      added, mod,  guid
        (1, 2, None, 0, 0, "", 10, 10, "root________"),
        (2, 2, None, 1, 0, "menu", 10, 10, "menu________"),
        (3, 2, None, 1, 1, "toolbar", 10, 10, "toolbar_____"),
        (4, 2, None, 1, 2, "tags", 10, 10, "tags________"),
        (5, 2, None, 1, 3, "unfiled", 10, 10, "unfiled_____"),
        (6, 2, None, 1, 4, "mobile", 10, 10, "mobile______"),
        (7, 2, None, 3, 0, "rc", 20, 20, "FolderRc0001"),
        (8, 1, 100, 7, 0, "warranty-rc", 30, 40, "BmarkRc00001"),
        # tag folder "prod" with a child pointing at the same place
        (9, 2, None, 4, 0, "prod", 10, 10, "TagProd00001"),
        (10, 1, 100, 9, 0, None, 10, 10, "TagRefProd01"),
    ]
    con.executemany("INSERT INTO moz_bookmarks VALUES (?,?,?,?,?,?,?,?,?)", rows)
    con.execute("INSERT INTO moz_keywords VALUES (1, 'rc', 100, NULL)")
    con.commit()
    con.close()
    return path


def test_read_tree_shape_and_metadata(tmp_path):
    db = build_db(tmp_path / "places.sqlite")
    tree = ffbm_places.read_tree(db)

    assert tree["guid"] == "root________"
    assert tree["root"] == "placesRoot"
    # exactly four roots, tags folder excluded
    assert [c["root"] for c in tree["children"]] == [
        "bookmarksMenuFolder",
        "toolbarFolder",
        "unfiledBookmarksFolder",
        "mobileFolder",
    ]

    toolbar = tree["children"][1]
    folder = toolbar["children"][0]
    assert folder["title"] == "rc"
    assert folder["typeCode"] == 2
    assert folder["type"] == "text/x-moz-place-container"

    bookmark = folder["children"][0]
    assert bookmark["title"] == "warranty-rc"
    assert bookmark["typeCode"] == 1
    assert bookmark["uri"] == "https://w-rc.example/"
    assert bookmark["keyword"] == "rc"
    assert bookmark["tags"] == "prod"
    assert bookmark["dateAdded"] == 30


def test_snapshot_copies_wal_and_leaves_original(tmp_path):
    profile = tmp_path / "profile"
    profile.mkdir()
    build_db(profile / "places.sqlite")
    (profile / "places.sqlite-wal").write_bytes(b"walbytes")
    dest = tmp_path / "dest"
    dest.mkdir()

    copied = ffbm_places.snapshot(profile, dest)

    assert copied == dest / "places.sqlite"
    assert (dest / "places.sqlite-wal").read_bytes() == b"walbytes"
    assert (profile / "places.sqlite").exists()
