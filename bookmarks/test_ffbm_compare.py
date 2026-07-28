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
