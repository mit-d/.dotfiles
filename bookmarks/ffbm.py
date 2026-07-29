#!/usr/bin/env python3
"""Manage Firefox bookmarks as committed JSON.

    ffbm.py export    profile + cluster config -> envs.json + static.json
    ffbm.py generate  envs.json + static.json -> build/bookmarks.json
    ffbm.py diff      build/bookmarks.json vs the live profile
    ffbm.py verify    build/bookmarks.json vs a named profile

Loading is manual and deliberate: Firefox -> Manage Bookmarks -> Import and
Backup -> Restore -> build/bookmarks.json. Restore replaces the whole tree
and propagates through Firefox Sync, so read `diff` first.
"""

import argparse
import json
import sys
import tempfile
from pathlib import Path

import ffbm_cluster
import ffbm_compare
import ffbm_export
import ffbm_model
import ffbm_places

HERE = Path(__file__).resolve().parent
DEFAULT_PROFILES = (
    Path.home() / "Library" / "Application Support" / "Firefox" / "Profiles"
)


def find_profile(profiles_dir: Path = DEFAULT_PROFILES) -> Path:
    matches = sorted(Path(profiles_dir).glob("*.default-nightly"))
    if not matches:
        raise SystemExit(f"no *.default-nightly profile under {profiles_dir}")
    if len(matches) > 1:
        raise SystemExit(
            f"more than one *.default-nightly profile: "
            f"{[m.name for m in matches]}; pass --profile"
        )
    return matches[0]


def read_json(path: Path):
    return json.loads(Path(path).read_text(encoding="utf-8"))


def write_json(path: Path, data) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(ffbm_model.dumps(data), encoding="utf-8")


def profile_tree(profile: Path) -> dict:
    """Snapshot then read, so the live profile is never opened directly."""
    with tempfile.TemporaryDirectory() as tmp:
        return ffbm_places.read_tree(ffbm_places.snapshot(profile, Path(tmp)))


def cmd_export(profile: Path, source_dir: Path, cluster_dir: Path) -> int:
    config = ffbm_cluster.build_config(ffbm_cluster.read_envs(cluster_dir))
    slugs = {e["slug"] for g in config["groups"] for e in g["envs"]}
    static, harvested = ffbm_export.split(profile_tree(profile), known_slugs=slugs)
    extras = {
        e["slug"]: e["extras"]
        for g in harvested["groups"]
        for e in g["envs"]
        if e.get("extras")
    }
    config, dropped = ffbm_cluster.merge_extras(config, extras)

    write_json(Path(source_dir) / "envs.json", config)
    write_json(Path(source_dir) / "static.json", static)
    print(f"wrote envs.json ({len(slugs)} envs from {cluster_dir}) and static.json")
    for title in dropped:
        print(f"  dropped extra duplicating a managed env: {title}")
    return 0


def cmd_generate(source_dir: Path, out: Path) -> int:
    tree = ffbm_model.generate(
        read_json(Path(source_dir) / "envs.json"),
        read_json(Path(source_dir) / "static.json"),
    )
    write_json(out, tree)
    print(f"wrote {out} ({len(ffbm_compare.flatten(tree))} bookmarks)")
    return 0


def cmd_diff(profile: Path, build: Path) -> int:
    result = ffbm_compare.diff(profile_tree(profile), read_json(build))
    print("live profile -> build/bookmarks.json\n")
    print(ffbm_compare.format_report(result))
    return 0


def cmd_verify(profile: Path, build: Path) -> int:
    result = ffbm_compare.diff(read_json(build), profile_tree(profile))
    if ffbm_compare.is_clean(result):
        print(f"PASS: {profile} matches {build}")
        return 0
    print(f"FAIL: {profile} differs from {build}\n")
    print(ffbm_compare.format_report(result))
    return 1


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--source-dir", type=Path, default=HERE)
    sub = parser.add_subparsers(dest="command", required=True)

    p = sub.add_parser("export", help="profile + cluster -> envs.json + static.json")
    p.add_argument("--profile", type=Path)
    p.add_argument("--cluster-dir", type=Path, default=ffbm_cluster.CLUSTER_DIR)

    p = sub.add_parser("generate", help="sources -> build/bookmarks.json")
    p.add_argument("-o", "--out", type=Path)

    p = sub.add_parser("diff", help="compare the live profile to the build")
    p.add_argument("--profile", type=Path)
    p.add_argument("--build", type=Path)

    p = sub.add_parser("verify", help="assert a profile matches the build")
    p.add_argument("--profile", type=Path, required=True)
    p.add_argument("--build", type=Path)

    args = parser.parse_args(argv)
    build = getattr(args, "build", None) or args.source_dir / "build" / "bookmarks.json"

    if args.command == "export":
        return cmd_export(args.profile or find_profile(), args.source_dir, args.cluster_dir)
    if args.command == "generate":
        return cmd_generate(args.source_dir, args.out or build)
    if args.command == "diff":
        return cmd_diff(args.profile or find_profile(), build)
    return cmd_verify(args.profile, build)


if __name__ == "__main__":
    sys.exit(main())
