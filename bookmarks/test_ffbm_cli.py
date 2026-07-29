import json
import sqlite3
import subprocess
import sys

import pytest

import ffbm
import ffbm_model
import test_ffbm_places

HERE = ffbm.HERE


def test_find_profile_picks_the_single_nightly_profile(tmp_path):
    profiles_dir = tmp_path / "Profiles"
    profile = profiles_dir / "abc123.default-nightly"
    profile.mkdir(parents=True)

    assert ffbm.find_profile(profiles_dir) == profile


def test_find_profile_errors_when_ambiguous(tmp_path):
    profiles_dir = tmp_path / "Profiles"
    (profiles_dir / "abc123.default-nightly").mkdir(parents=True)
    (profiles_dir / "def456.default-nightly").mkdir(parents=True)

    with pytest.raises(SystemExit, match="more than one"):
        ffbm.find_profile(profiles_dir)


def minimal_static():
    """A four-root tree with an empty toolbar -- no Dashboards folder yet."""
    return {
        "guid": "root________",
        "title": "",
        "index": 0,
        "dateAdded": 1,
        "lastModified": 1,
        "typeCode": 2,
        "type": ffbm_model.CONTAINER,
        "root": "placesRoot",
        "children": [
            {
                "guid": "menu________",
                "title": "menu",
                "index": 0,
                "dateAdded": 1,
                "lastModified": 1,
                "typeCode": 2,
                "type": ffbm_model.CONTAINER,
                "root": "bookmarksMenuFolder",
                "children": [],
            },
            {
                "guid": "toolbar_____",
                "title": "toolbar",
                "index": 1,
                "dateAdded": 1,
                "lastModified": 1,
                "typeCode": 2,
                "type": ffbm_model.CONTAINER,
                "root": "toolbarFolder",
                "children": [],
            },
            {
                "guid": "unfiled_____",
                "title": "unfiled",
                "index": 2,
                "dateAdded": 1,
                "lastModified": 1,
                "typeCode": 2,
                "type": ffbm_model.CONTAINER,
                "root": "unfiledBookmarksFolder",
                "children": [],
            },
            {
                "guid": "mobile______",
                "title": "mobile",
                "index": 3,
                "dateAdded": 1,
                "lastModified": 1,
                "typeCode": 2,
                "type": ffbm_model.CONTAINER,
                "root": "mobileFolder",
                "children": [],
            },
        ],
    }


def test_generate_writes_build_file(tmp_path):
    (tmp_path / "envs.json").write_text(
        ffbm_model.dumps({"apps": {}, "groups": []}), encoding="utf-8"
    )
    (tmp_path / "static.json").write_text(
        ffbm_model.dumps(minimal_static()), encoding="utf-8"
    )
    out = tmp_path / "build" / "bookmarks.json"

    ffbm.cmd_generate(tmp_path, out)

    text = out.read_text(encoding="utf-8")
    assert text.isascii()
    assert text.endswith("\n")
    assert json.loads(text)["root"] == "placesRoot"


def test_cli_help_lists_all_subcommands():
    result = subprocess.run(
        [sys.executable, str(HERE / "ffbm.py"), "--help"],
        capture_output=True,
        text=True,
    )
    assert "export" in result.stdout
    assert "generate" in result.stdout
    assert "diff" in result.stdout
    assert "verify" in result.stdout


def build_export_profile_db(path):
    """A toolbar/Dashboards with two folders: `rc` (a cluster-known env, two
    canonical bookmarks plus one extra) and `retired` (a canonical-looking
    env whose slug the cluster config does not know about).

    Reuses the SCHEMA from test_ffbm_places.py rather than redefining it.
    """
    con = sqlite3.connect(path)
    con.executescript(test_ffbm_places.SCHEMA)
    con.executemany(
        "INSERT INTO moz_places VALUES (?, ?)",
        [
            (100, "https://warranty-rc.bidboxpro.com/"),
            (101, "https://core-rc.bidboxpro.com/admin/login/"),
            (102, "https://portal.example/"),
            (103, "https://warranty-retired.bidboxpro.com/"),
        ],
    )
    rows = [
        # id, type, fk,   parent, pos, title,            added, mod, guid
        (1, 2, None, 0, 0, "", 10, 10, "root________"),
        (2, 2, None, 1, 0, "menu", 10, 10, "menu________"),
        (3, 2, None, 1, 1, "toolbar", 10, 10, "toolbar_____"),
        (4, 2, None, 1, 2, "unfiled", 10, 10, "unfiled_____"),
        (5, 2, None, 1, 3, "mobile", 10, 10, "mobile______"),
        (6, 2, None, 3, 0, "Dashboards", 10, 10, "DashFolder01"),
        (7, 2, None, 6, 0, "rc", 20, 20, "RcFolder0001"),
        (8, 2, None, 6, 1, "retired", 20, 20, "RetFolder001"),
        (9, 1, 100, 7, 0, "warranty-rc", 30, 30, "BmarkWarnRc1"),
        (10, 1, 101, 7, 1, "core-rc", 30, 30, "BmarkCoreRc1"),
        (11, 1, 102, 7, 2, "Portal", 30, 30, "BmarkPortal1"),
        (12, 1, 103, 8, 0, "warranty-retired", 30, 30, "BmarkWarnRt1"),
    ]
    con.executemany("INSERT INTO moz_bookmarks VALUES (?,?,?,?,?,?,?,?,?)", rows)
    con.commit()
    con.close()
    return path


def build_fake_cluster_dir(cluster_dir):
    """A cluster config declaring only the `rc` env -- `retired` is
    deliberately absent, so it stays static rather than being regenerated.
    """
    cluster_dir.mkdir(parents=True, exist_ok=True)
    (cluster_dir / "ns_env.sh").write_text(
        'export ns_map_all=(rc)\n'
        'export tag_rc="rc"\n'
    )
    return cluster_dir


def test_cmd_export_grafts_extras_and_preserves_retired_env(tmp_path):
    profile_dir = tmp_path / "profile"
    profile_dir.mkdir()
    build_export_profile_db(profile_dir / "places.sqlite")

    cluster_dir = build_fake_cluster_dir(tmp_path / "cluster")
    source_dir = tmp_path / "out"

    ffbm.cmd_export(profile=profile_dir, source_dir=source_dir, cluster_dir=cluster_dir)

    envs = json.loads((source_dir / "envs.json").read_text(encoding="utf-8"))
    rc_group = next(g for g in envs["groups"] if "rc" in [e["slug"] for e in g["envs"]])
    rc = next(e for e in rc_group["envs"] if e["slug"] == "rc")
    assert rc["extras"] == [{"title": "Portal", "url": "https://portal.example/"}]

    static = json.loads((source_dir / "static.json").read_text(encoding="utf-8"))
    toolbar = ffbm_model.find_root(static, "toolbarFolder")
    dashboards = next(c for c in toolbar["children"] if c["title"] == "Dashboards")

    # rc was taken over (regenerable by the cluster config); retired was not
    assert [c["title"] for c in dashboards["children"]] == ["retired"]
    retired = dashboards["children"][0]
    assert [b["title"] for b in retired["children"]] == ["warranty-retired"]
