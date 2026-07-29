import json
import re

import pytest

import ffbm_model

APPS = {
    "warranty": {
        "url": "https://warranty-{env}.bidboxpro.com/",
        "keyword": "{env}",
        "tag": "warranty",
    },
    "core": {
        "url": "https://core-{env}.bidboxpro.com/admin/login/?next=/admin/",
        "keyword": "{env}:core",
        "tag": "core",
    },
}


def test_derive_guid_is_deterministic_and_valid():
    a = ffbm_model.derive_guid("rc:warranty")
    b = ffbm_model.derive_guid("rc:warranty")
    assert a == b
    assert len(a) == 12
    assert re.fullmatch(r"[A-Za-z0-9_-]{12}", a)
    assert a != ffbm_model.derive_guid("rc:core")


def test_env_bookmark_url_keyword_and_tags():
    env = {
        "slug": "acclhw",
        "client": "acclaimed",
        "vertical": "homewarranty",
        "tags": ["prod"],
    }
    node = ffbm_model.env_bookmark("core", APPS["core"], env)

    assert node["title"] == "core-acclhw"
    assert node["uri"] == (
        "https://core-acclhw.bidboxpro.com/admin/login/?next=/admin/"
    )
    assert node["keyword"] == "acclhw:core"
    assert node["tags"] == "core,homewarranty,prod,c1:acclaimed"
    assert node["typeCode"] == 1
    assert node["dateAdded"] == ffbm_model.GENERATED_USEC


def test_app_without_tag_key_omits_app_tag():
    apps = {"warranty": dict(APPS["warranty"])}
    del apps["warranty"]["tag"]
    node = ffbm_model.env_bookmark("warranty", apps["warranty"], {"slug": "rc"})
    assert "tags" not in node


def test_env_bookmark_substitutes_host():
    app = {
        "url": "https://warranty-{env}.{host}/",
        "keyword": "{env}",
        "tag": "warranty",
    }
    env = {"slug": "devlag", "host": "bidboxpro.dev"}
    node = ffbm_model.env_bookmark("warranty", app, env)
    assert node["uri"] == "https://warranty-devlag.bidboxpro.dev/"


def test_env_bookmark_without_host_raises():
    app = {
        "url": "https://warranty-{env}.{host}/",
        "keyword": "{env}",
        "tag": "warranty",
    }
    env = {"slug": "devlag"}
    with pytest.raises(ValueError, match="devlag"):
        ffbm_model.env_bookmark("warranty", app, env)


def test_extra_bookmark_passes_keyword_and_tags_through():
    node = ffbm_model.extra_bookmark(
        {
            "title": "Portal",
            "url": "https://portal.example/",
            "keyword": "portal",
            "tags": ["prod", "homewarranty"],
        }
    )
    assert node["title"] == "Portal"
    assert node["keyword"] == "portal"
    assert node["tags"] == "prod,homewarranty"


def test_tag_containing_comma_is_rejected():
    env = {"slug": "rc", "tags": ["prod, staging"]}
    with pytest.raises(ValueError, match=re.escape("prod, staging")):
        ffbm_model.env_bookmark("warranty", APPS["warranty"], env)


def test_env_tags_dedups_preserving_first_occurrence():
    env = {"slug": "rc", "vertical": "homewarranty", "tags": ["homewarranty", "prod"]}
    tags = ffbm_model.env_tags(APPS["warranty"], env)
    assert tags == ["warranty", "homewarranty", "prod"]


def test_serialize_is_ascii_and_newline_terminated():
    tree = {"title": "Framework – Sourcery"}
    text = ffbm_model.dumps(tree)
    assert text.endswith("\n")
    assert text.isascii()
    assert "\\u2013" in text
    assert json.loads(text)["title"] == "Framework – Sourcery"


def minimal_static():
    """A four-root tree whose Dashboards folder holds only static Local."""
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
                "children": [
                    ffbm_model.folder("DashGuid0001", "Dashboards", [
                        ffbm_model.folder("LocalGuid001", "Local", []),
                    ]),
                ],
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


ENVS_CFG = {
    "apps": APPS,
    "groups": [
        {"path": ["Prod"], "envs": [{"slug": "rc", "tags": ["prod"]}]},
        {"path": ["Prod", "Other"], "envs": [{"slug": "devlag"}]},
        {"path": ["C1 Prod"], "envs": [{"slug": "gsa", "client": "gsa"}]},
    ],
}


def dashboards_of(tree):
    toolbar = ffbm_model.find_root(tree, "toolbarFolder")
    return next(c for c in toolbar["children"] if c["title"] == "Dashboards")


def test_generate_merges_overlapping_group_paths():
    tree = ffbm_model.generate(ENVS_CFG, minimal_static())
    dash = dashboards_of(tree)

    titles = [c["title"] for c in dash["children"]]
    # one Prod folder, not two, and static Local is preserved
    assert titles == ["Local", "Prod", "C1 Prod"]

    prod = next(c for c in dash["children"] if c["title"] == "Prod")
    assert [c["title"] for c in prod["children"]] == ["rc", "Other"]

    other = next(c for c in prod["children"] if c["title"] == "Other")
    assert [c["title"] for c in other["children"]] == ["devlag"]


def test_generate_emits_one_bookmark_per_app():
    tree = ffbm_model.generate(ENVS_CFG, minimal_static())
    dash = dashboards_of(tree)
    prod = next(c for c in dash["children"] if c["title"] == "Prod")
    rc = next(c for c in prod["children"] if c["title"] == "rc")

    assert [c["title"] for c in rc["children"]] == ["warranty-rc", "core-rc"]
    assert [c["keyword"] for c in rc["children"]] == ["rc", "rc:core"]
    assert [c["index"] for c in rc["children"]] == [0, 1]


def test_generate_does_not_mutate_static_input():
    static = minimal_static()
    before = ffbm_model.dumps(static)
    ffbm_model.generate(ENVS_CFG, static)
    assert ffbm_model.dumps(static) == before


def test_generate_is_byte_identical_across_runs():
    first = ffbm_model.dumps(ffbm_model.generate(ENVS_CFG, minimal_static()))
    second = ffbm_model.dumps(ffbm_model.generate(ENVS_CFG, minimal_static()))
    assert first == second


def test_generate_rejects_duplicate_slugs():
    cfg = {
        "apps": APPS,
        "groups": [
            {"path": ["Prod"], "envs": [{"slug": "rc"}]},
            {"path": ["C1 Prod"], "envs": [{"slug": "rc"}]},
        ],
    }
    duplicate_guid = ffbm_model.derive_guid("folder:rc")
    with pytest.raises(ValueError, match=re.escape(duplicate_guid)):
        ffbm_model.generate(cfg, minimal_static())
