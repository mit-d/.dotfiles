# Load a palette from the generated library, with local edits layered on top.
#
#   import ./load.nix "gruvbox-dark-hard"
#
# ./generated is rewritten wholesale by `nix run .#gen-palettes`, so nothing in
# it can be hand-edited and survive. Anything you want to change goes in
# ./overrides/<name>.nix, which this merges over the generated values -- see
# ./README.md.
name:
let
  index = import ./generated/_index.nix;

  base =
    if index ? ${name} then
      import index.${name}
    else
      throw (
        "palette '${name}' is not in the library. "
        + "Available names are the attributes of nix/palettes/generated/_index.nix; "
        + "regenerate with `nix run .#gen-palettes`."
      );

  overridePath = ./overrides + "/${name}.nix";

  # An override may be a plain attrset, or a function of the generated palette
  # when it wants to refer to values it is not replacing.
  raw = import overridePath;
  override =
    if builtins.pathExists overridePath then
      (if builtins.isFunction raw then raw base else raw)
    else
      { };

  # Recursive so an override can change one ANSI slot without restating the
  # other fifteen -- `//` alone would replace the whole nested attrset.
  merge =
    a: b:
    a
    // builtins.mapAttrs (
      key: value:
      if builtins.isAttrs value && builtins.isAttrs (a.${key} or null) then
        merge a.${key} value
      else
        value
    ) b;
in
merge base override
