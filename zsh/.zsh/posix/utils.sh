# Show simplified type structure of JSON (not a valid JSON Schema)
json_types() {
  jq '
def deep_merge:
  reduce .[] as $item ({};
    . as $base | $item | to_entries | reduce .[] as $e ($base;
      if ($e.value | type) == "object" and (.[$e.key] | type) == "object" then
        .[$e.key] = ([$e.key as $k | .[$k], $e.value] | deep_merge)
      elif ($e.value | type) == "array" and (.[$e.key] | type) == "array" then
        .[$e.key] = (.[$e.key] + $e.value)
      else
        .[$e.key] = $e.value
      end
    )
  );

def collapse_and_merge:
  . as $in |
  if type == "array" and (map(type) | all(. == "object")) and length > 0 then
    [. | deep_merge | collapse_and_merge]
  elif type == "array" then
    map(collapse_and_merge)
  elif type == "object" then
    with_entries(.value |= collapse_and_merge)
  else
    .
  end;

collapse_and_merge | walk(if type == "object" or type == "array" then . else type end)
' "${1:--}"
}

# Generate valid JSON Schema from sample JSON
json_schema() {
  jq '
def deep_merge:
  reduce .[] as $item ({};
    . as $base | $item | to_entries | reduce .[] as $e ($base;
      if ($e.value | type) == "object" and (.[$e.key] | type) == "object" then
        .[$e.key] = ([$e.key as $k | .[$k], $e.value] | deep_merge)
      elif ($e.value | type) == "array" and (.[$e.key] | type) == "array" then
        .[$e.key] = (.[$e.key] + $e.value)
      else
        .[$e.key] = $e.value
      end
    )
  );

def collapse_arrays:
  if type == "array" and length > 0 and (map(type) | all(. == "object")) then
    [. | deep_merge | collapse_arrays]
  elif type == "array" then
    map(collapse_arrays)
  elif type == "object" then
    with_entries(.value |= collapse_arrays)
  else
    .
  end;

def to_schema:
  (. | type) as $t |
  if $t == "object" then
    { type: "object", properties: with_entries(.value |= to_schema) }
  elif $t == "array" then
    if length == 0 then { type: "array" }
    else { type: "array", items: (.[0] | to_schema) }
    end
  elif $t == "number" then
    if . == (. | floor) then { type: "integer" } else { type: "number" } end
  else
    { type: $t }
  end;

collapse_arrays | to_schema
' "${1:--}"
}

# Format markdown files (prettier + markdownlint)
mdfmt() {
  prettier -w --prose-wrap always --print-width 80 "$@"
  markdownlint-cli2 --fix "$@"
}
