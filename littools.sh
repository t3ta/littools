#!/bin/bash

IFS=',' read -ra EXCLUDE <<<"${LITTOOLS_EXCLUDE:-}"

jq_filter='
  if (.result?.tools? | type == "array") then
    .result.tools |= map(select(.name as $n | $exclude | index($n) | not))
  else
    .
  end
'

"$@" | while read -r line; do
  if echo "$line" | grep -q '"result":.*"tools"'; then
    echo "$line" | jq -c --argjson exclude "$(printf '["%s"]\n' "${EXCLUDE[@]}" | jq -cs 'add')" "$jq_filter"
  else
    echo "$line"
  fi
done
