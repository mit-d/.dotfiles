import json
import subprocess
import sys

import pytest

import ffbm
import ffbm_model

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
