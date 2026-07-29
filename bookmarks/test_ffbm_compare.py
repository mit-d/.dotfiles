import ffbm_compare
import ffbm_model


def tree_with(bookmarks):
    """bookmarks: list of (folder, title, uri, keyword, tags-string)."""
    folders = {}
    for folder_name, title, uri, keyword, tags in bookmarks:
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
        folders.setdefault(folder_name, []).append(node)

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
                "children": [
                    ffbm_model.folder(ffbm_model.derive_guid(name), name, kids)
                    for name, kids in folders.items()
                ],
            }
        ],
    }


def test_flatten_keys_by_path():
    tree = tree_with([("rc", "warranty-rc", "https://w/", "rc", "prod")])
    flat = ffbm_compare.flatten(tree)
    assert "toolbar/rc/warranty-rc" in flat
    assert flat["toolbar/rc/warranty-rc"] == {
        "uri": "https://w/",
        "keyword": "rc",
        "tags": "prod",
    }


def test_diff_reports_added_removed_and_changed():
    left = tree_with(
        [
            ("rc", "warranty-rc", "https://w/", "rc", "prod"),
            ("rc", "core-rc", "https://c/", "rc:core", "prod"),
        ]
    )
    right = tree_with(
        [
            # keyword changed
            ("rc", "warranty-rc", "https://w/", "rc-new", "prod"),
            # core-rc removed, oemrc added
            ("rc", "product-rc", "https://p/", "rc:product", "prod"),
        ]
    )
    result = ffbm_compare.diff(left, right)

    assert result["added"] == ["toolbar/rc/product-rc"]
    assert result["removed"] == ["toolbar/rc/core-rc"]
    assert len(result["changed"]) == 1
    change = result["changed"][0]
    assert change["path"] == "toolbar/rc/warranty-rc"
    assert change["fields"]["keyword"] == ("rc", "rc-new")


def test_diff_ignores_guid_index_and_timestamps():
    left = tree_with([("rc", "warranty-rc", "https://w/", "rc", "prod")])
    right = tree_with([("rc", "warranty-rc", "https://w/", "rc", "prod")])
    right["children"][0]["children"][0]["children"][0]["guid"] = "different001"
    right["children"][0]["children"][0]["children"][0]["dateAdded"] = 999
    assert ffbm_compare.is_clean(ffbm_compare.diff(left, right))


def test_format_report_is_readable():
    left = tree_with([("rc", "warranty-rc", "https://w/", "rc", "prod")])
    right = tree_with([("rc", "warranty-rc", "https://w/", "other", "prod")])
    text = ffbm_compare.format_report(ffbm_compare.diff(left, right))
    assert "toolbar/rc/warranty-rc" in text
    assert "keyword" in text
    assert "1 changed" in text


def test_colliding_paths_are_disambiguated_not_dropped():
    tree = tree_with(
        [
            ("Docs", "Dup", "https://a/", "", ""),
            ("Docs", "Dup", "https://b/", "", ""),
            ("Docs", "Dup", "https://c/", "", ""),
        ]
    )
    flat = ffbm_compare.flatten(tree)
    keys = [k for k in flat if k.startswith("toolbar/Docs/Dup")]
    assert len(keys) == 3
    uris = {flat[k]["uri"] for k in keys}
    assert uris == {"https://a/", "https://b/", "https://c/"}
    for key in keys:
        assert flat[key]["uri"] in key


def test_format_report_renders_added_and_removed_lines():
    left = tree_with([("rc", "core-rc", "https://c/", "", "")])
    right = tree_with([("rc", "new-thing", "https://n/", "", "")])
    text = ffbm_compare.format_report(ffbm_compare.diff(left, right))
    assert "toolbar/rc/core-rc" in text
    assert "toolbar/rc/new-thing" in text
    assert text.index("toolbar/rc/core-rc") < text.index("toolbar/rc/new-thing")


def test_diff_reports_moved_when_uri_unchanged():
    left = tree_with([("rc", "warranty-rc", "https://w/", "", "")])
    right = tree_with([("archive", "warranty-rc", "https://w/", "", "")])
    result = ffbm_compare.diff(left, right)
    assert result["added"] == []
    assert result["removed"] == []
    assert result["moved"] == [
        {
            "reason": "uri",
            "uri": "https://w/",
            "from": "toolbar/rc/warranty-rc",
            "to": "toolbar/archive/warranty-rc",
        }
    ]
    assert not ffbm_compare.is_clean(result)


def test_is_clean_false_when_only_moved():
    left = tree_with([("rc", "warranty-rc", "https://w/", "", "")])
    right = tree_with([("archive", "warranty-rc", "https://w/", "", "")])
    result = ffbm_compare.diff(left, right)
    assert result["added"] == []
    assert result["removed"] == []
    assert result["changed"] == []
    assert result["moved"]
    assert ffbm_compare.is_clean(result) is False


def _bookmark(title, uri):
    return {
        "guid": ffbm_model.derive_guid(title + uri),
        "title": title,
        "index": 0,
        "dateAdded": 1,
        "lastModified": 1,
        "typeCode": 1,
        "type": ffbm_model.PLACE,
        "uri": uri,
    }


def _toolbar_tree(children):
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
                "children": children,
            }
        ],
    }


def test_diff_correlates_relocated_bookmarks_by_path():
    left = _toolbar_tree([
        ffbm_model.folder("g1", "C1 Prod", [
            ffbm_model.folder("g2", "gsa", [
                _bookmark("warranty-gsa",
                          "https://warranty-gsa.bidboxpro.com/w/bbp/auth/password"),
            ]),
        ]),
    ])
    right = _toolbar_tree([
        ffbm_model.folder("g3", "prod", [
            ffbm_model.folder("g4", "gsa", [
                _bookmark("warranty-gsa", "https://warranty-gsa.bidboxpro.com/"),
            ]),
        ]),
    ])
    result = ffbm_compare.diff(left, right)

    assert result["added"] == []
    assert result["removed"] == []
    assert len(result["moved"]) == 1
    move = result["moved"][0]
    assert move["reason"] == "path"
    assert move["from"] == "toolbar/C1 Prod/gsa/warranty-gsa"
    assert move["to"] == "toolbar/prod/gsa/warranty-gsa"
    assert move["from_uri"] == "https://warranty-gsa.bidboxpro.com/w/bbp/auth/password"
    assert move["to_uri"] == "https://warranty-gsa.bidboxpro.com/"


def test_tail_pass_does_not_pair_non_canonical_titles():
    """Two unrelated extras sharing a generic title must not be paired.

    `Portal` is not a canonical `<app>-<slug>` title, so a genuinely deleted
    one and a genuinely, unrelatedly added one -- filed under different
    ancestor groups but landing on the same env-folder leaf name -- must
    surface honestly as an addition and a deletion, not get masked behind a
    single "path"-reason move.
    """
    left = _toolbar_tree([
        ffbm_model.folder("g0", "oldgroup", [
            ffbm_model.folder("g1", "rc", [
                _bookmark("Portal", "https://old-portal.example/"),
            ]),
        ]),
    ])
    right = _toolbar_tree([
        ffbm_model.folder("g2", "newgroup", [
            ffbm_model.folder("g3", "rc", [
                _bookmark("Portal", "https://new-portal.example/"),
            ]),
        ]),
    ])
    result = ffbm_compare.diff(left, right)

    assert result["added"] == ["toolbar/newgroup/rc/Portal"]
    assert result["removed"] == ["toolbar/oldgroup/rc/Portal"]
    assert result["moved"] == []


def test_tail_pass_still_pairs_canonical_titles():
    """Canonical `<app>-<slug>` titles remain safe to pair by tail.

    Unlike a generic extra title, the slug is embedded in the title itself,
    so two different envs cannot produce a colliding tail -- this pins the
    positive case (the real-world "C1 Prod -> prod" regrouping) so a future
    change can't "fix" the blind spot above by disabling the tail pass
    entirely and keep the suite green.
    """
    left = _toolbar_tree([
        ffbm_model.folder("g0", "oldgroup", [
            ffbm_model.folder("g1", "gsa", [
                _bookmark("warranty-gsa", "https://old.example/"),
            ]),
        ]),
    ])
    right = _toolbar_tree([
        ffbm_model.folder("g2", "newgroup", [
            ffbm_model.folder("g3", "gsa", [
                _bookmark("warranty-gsa", "https://new.example/"),
            ]),
        ]),
    ])
    result = ffbm_compare.diff(left, right)

    assert result["added"] == []
    assert result["removed"] == []
    assert len(result["moved"]) == 1
    assert result["moved"][0]["reason"] == "path"
    assert result["moved"][0]["from"] == "toolbar/oldgroup/gsa/warranty-gsa"
    assert result["moved"][0]["to"] == "toolbar/newgroup/gsa/warranty-gsa"


def test_moved_reason_distinguishes_uri_from_path():
    left = _toolbar_tree([
        ffbm_model.folder("g1", "rc", [
            _bookmark("warranty-rc", "https://w/"),
        ]),
        ffbm_model.folder("g2", "C1 Prod", [
            ffbm_model.folder("g3", "gsa", [
                _bookmark("warranty-gsa", "https://old/"),
            ]),
        ]),
    ])
    right = _toolbar_tree([
        ffbm_model.folder("g4", "archive", [
            _bookmark("warranty-rc", "https://w/"),
        ]),
        ffbm_model.folder("g5", "prod", [
            ffbm_model.folder("g6", "gsa", [
                _bookmark("warranty-gsa", "https://new/"),
            ]),
        ]),
    ])
    result = ffbm_compare.diff(left, right)

    assert result["added"] == []
    assert result["removed"] == []
    reasons = {m["from"]: m["reason"] for m in result["moved"]}
    assert reasons["toolbar/rc/warranty-rc"] == "uri"
    assert reasons["toolbar/C1 Prod/gsa/warranty-gsa"] == "path"
