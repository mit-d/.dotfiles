# mpv-cut is not in nixpkgs' mpvScripts, so it is built from the same commit
# the git submodule pinned. Packaging it here is what retires that submodule.
{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "mpv-cut";
  version = "0-unstable-3b18f11";

  src = fetchFromGitHub {
    owner = "familyfriendlymikey";
    repo = "mpv-cut";
    rev = "3b18f1161ffb2ff822c88cb97e099772d4b3c26d";
    sha256 = "13ay6r22nddk0bkahd122v6q027ms961jcnarz0paybarlj4g0vk";
  };

  dontBuild = true;

  # mpv loads a multi-file script from a directory containing main.lua.
  # `utils` is upstream's companion bash helper, not a directory.
  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/mpv/scripts/mpv-cut"
    cp -r main.lua utils "$out/share/mpv/scripts/mpv-cut/"
    runHook postInstall
  '';

  passthru.scriptName = "mpv-cut";

  meta = {
    description = "Cut videos in mpv";
    homepage = "https://github.com/familyfriendlymikey/mpv-cut";
    platforms = lib.platforms.all;
  };
}
