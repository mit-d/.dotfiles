import pytest

import ffbm_cluster as K

FAKE_NS_ENV = """
export ns_map_all=(zeta alpha beta gamma delta)

export flavor_alpha="homewarranty"
export flavor_beta="automotive"
export flavor_zeta="homewarranty"
# gamma and delta have no flavor set

export tag_alpha="prod"
export tag_zeta="prod"
export tag_beta="rc"
export tag_gamma="staging"
export tag_delta="dev"

export host_beta="bidboxpro.dev"
# alpha, gamma, delta, zeta have no host set -> default bidboxpro.com
"""


@pytest.fixture
def fake_cluster_dir(tmp_path):
    (tmp_path / "ns_env.sh").write_text(FAKE_NS_ENV)
    return tmp_path


def test_read_envs_parses_slug_vertical_channel_host(fake_cluster_dir):
    envs = K.read_envs(fake_cluster_dir)
    by_slug = {e["slug"]: e for e in envs}

    assert by_slug["alpha"]["vertical"] == "homewarranty"
    assert by_slug["alpha"]["channel"] == "prod"
    assert by_slug["alpha"]["host"] == "bidboxpro.com"

    assert by_slug["beta"]["vertical"] == "automotive"
    assert by_slug["beta"]["channel"] == "rc"
    assert by_slug["beta"]["host"] == "bidboxpro.dev"


def test_read_envs_defaults_missing_host(fake_cluster_dir):
    envs = K.read_envs(fake_cluster_dir)
    by_slug = {e["slug"]: e for e in envs}
    assert by_slug["gamma"]["host"] == "bidboxpro.com"
    assert by_slug["delta"]["host"] == "bidboxpro.com"


def test_build_config_groups_by_channel_in_order(fake_cluster_dir):
    envs = K.read_envs(fake_cluster_dir)
    cfg = K.build_config(envs)

    assert [g["path"] for g in cfg["groups"]] == [
        ["prod"], ["rc"], ["staging"], ["dev"],
    ]

    prod_group = next(g for g in cfg["groups"] if g["path"] == ["prod"])
    assert [e["slug"] for e in prod_group["envs"]] == ["alpha", "zeta"]

    assert set(cfg["apps"]) == {"warranty", "affiliate", "core", "product"}
    assert "portal" not in cfg["apps"]


def test_read_envs_raises_when_cluster_dir_missing(tmp_path):
    empty_dir = tmp_path / "no_ns_env_here"
    empty_dir.mkdir()
    with pytest.raises(FileNotFoundError):
        K.read_envs(empty_dir)


def test_merge_extras_grafts_onto_matching_slug(fake_cluster_dir):
    envs = K.read_envs(fake_cluster_dir)
    config = K.build_config(envs)
    before = K.build_config(envs)

    harvested = {
        "alpha": [{"title": "Portal", "url": "https://portal.example/"}],
        "nonexistent": [{"title": "Ghost", "url": "https://ghost.example/"}],
    }
    merged = K.merge_extras(config, harvested)

    prod_group = next(g for g in merged["groups"] if g["path"] == ["prod"])
    alpha = next(e for e in prod_group["envs"] if e["slug"] == "alpha")
    zeta = next(e for e in prod_group["envs"] if e["slug"] == "zeta")

    assert alpha["extras"] == [{"title": "Portal", "url": "https://portal.example/"}]
    assert "extras" not in zeta
    assert not any(
        "extras" in e
        for g in merged["groups"]
        for e in g["envs"]
        if e["slug"] not in ("alpha",)
    )
    # input config untouched
    assert config == before
