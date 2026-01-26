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
