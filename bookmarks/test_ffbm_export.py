import ffbm_export
import ffbm_model


def bookmark(title, uri, keyword=None, tags=None):
    node = {
        "guid": ffbm_model.derive_guid(title),
        "title": title,
        "index": 0,
        "dateAdded": 1,
        "lastModified": 1,
        "typeCode": 1,
        "type": ffbm_model.PLACE,
        "uri": uri,
    }
    if keyword:
        node["keyword"] = keyword
    if tags:
        node["tags"] = tags
    return node


def profile_tree():
    """Toolbar/Dashboards with a static Local, a Prod/rc env, and a C1 env."""
    rc = ffbm_model.folder("g1", "rc", [
        bookmark("warranty-rc", "https://warranty-rc.bidboxpro.com/",
                 "rc", "warranty,multi,prod"),
        bookmark("core-rc", "https://core-rc.bidboxpro.com/admin/login/",
                 "rc:core", "core,multi,prod"),
        bookmark("Portal", "https://portal.example/", None, "prod"),
    ])
    acclhw = ffbm_model.folder("g2", "acclhw", [
        bookmark("warranty-acclhw", "https://warranty-acclhw.bidboxpro.com/",
                 "acclhw", "warranty,homewarranty,prod,c1:acclaimed"),
    ])
    local = ffbm_model.folder("g3", "Local", [
        bookmark("warranty-local", "http://localhost:4200/", "warranty", None),
    ])
    dash = ffbm_model.folder("g4", "Dashboards", [
        local,
        ffbm_model.folder("g5", "Prod", [rc]),
        ffbm_model.folder("g6", "C1 Prod", [acclhw]),
    ])
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
                "guid": "toolbar_____",
                "title": "toolbar",
                "index": 0,
                "dateAdded": 1,
                "lastModified": 1,
                "typeCode": 2,
                "type": ffbm_model.CONTAINER,
                "root": "toolbarFolder",
                "children": [dash, bookmark("Jira", "https://jira/", "jira", None)],
            }
        ],
    }


def test_bootstrap_finds_envs_and_groups():
    static, envs = ffbm_export.split(profile_tree())

    paths = [g["path"] for g in envs["groups"]]
    assert ["Prod"] in paths
    assert ["C1 Prod"] in paths

    prod = next(g for g in envs["groups"] if g["path"] == ["Prod"])
    assert [e["slug"] for e in prod["envs"]] == ["rc"]


def test_bootstrap_derives_metadata_from_existing_tags():
    _static, envs = ffbm_export.split(profile_tree())
    c1 = next(g for g in envs["groups"] if g["path"] == ["C1 Prod"])
    acclhw = c1["envs"][0]

    assert acclhw["slug"] == "acclhw"
    assert acclhw["client"] == "acclaimed"      # from c1:acclaimed
    assert acclhw["vertical"] == "homewarranty"  # from the vertical whitelist
    assert acclhw["tags"] == ["prod"]            # app tags stripped


def test_noncanonical_bookmarks_become_extras():
    _static, envs = ffbm_export.split(profile_tree())
    rc = next(g for g in envs["groups"] if g["path"] == ["Prod"])["envs"][0]
    assert [e["title"] for e in rc["extras"]] == ["Portal"]
    assert rc["extras"][0]["url"] == "https://portal.example/"
    assert rc["extras"][0]["tags"] == ["prod"]


def test_env_folders_removed_from_static_but_local_kept():
    static, _envs = ffbm_export.split(profile_tree())
    toolbar = ffbm_model.find_root(static, "toolbarFolder")
    dash = next(c for c in toolbar["children"] if c["title"] == "Dashboards")

    # Local survives; the group folders that only held envs are gone
    assert [c["title"] for c in dash["children"]] == ["Local"]
    # loose toolbar bookmarks survive
    assert any(c["title"] == "Jira" for c in toolbar["children"])


def test_export_writes_app_templates():
    _static, envs = ffbm_export.split(profile_tree())
    assert set(envs["apps"]) == {"warranty", "affiliate", "core", "product"}
    assert envs["apps"]["core"]["url"].endswith("/admin/login/?next=/admin/")
    assert envs["apps"]["warranty"]["keyword"] == "{env}"
