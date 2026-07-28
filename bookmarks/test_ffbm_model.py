import json
import re

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


def test_serialize_is_ascii_and_newline_terminated():
    tree = {"title": "Framework – Sourcery"}
    text = ffbm_model.dumps(tree)
    assert text.endswith("\n")
    assert text.isascii()
    assert "\\u2013" in text
    assert json.loads(text)["title"] == "Framework – Sourcery"
