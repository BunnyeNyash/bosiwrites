#!/usr/bin/env bash
# Fetches real per-page view counts from GoatCounter's public counter
# endpoint and writes them to data/popular.json, sorted highest-first.
# Hugo reads that file at build time to rank the "Most Popular" section.
#
# Requires the GOATCOUNTER_CODE environment variable, the GoatCounter site code.
# If it's not set, this exits quietly and Hugo falls back to manually-flagged or recent posts instead,
# the site never breaks because of this.

set -euo pipefail

mkdir -p data

if [ -z "${GOATCOUNTER_CODE:-}" ]; then
  echo "GOATCOUNTER_CODE not set. Skipping popularity fetch. Hugo will use its fallback."
  echo "[]" > data/popular.json
  exit 0
fi

results="[]"

shopt -s nullglob
for file in content/posts/*.md; do
  slug=$(basename "$file" .md)
  path="/posts/${slug}"

  url="https://${GOATCOUNTER_CODE}.goatcounter.com/counter${path}.json"
  response=$(curl -sf "$url" || echo '{"count":"0"}')
  count=$(echo "$response" | jq -r '.count // "0"' | tr -d ',')

  # Guard against unexpected/non-numeric responses.
  if ! [[ "$count" =~ ^[0-9]+$ ]]; then
    count=0
  fi

  results=$(echo "$results" | jq --arg path "$path" --argjson count "$count" \
    '. + [{"path": $path, "count": $count}]')
done

echo "$results" | jq 'sort_by(-.count)' > data/popular.json
echo "Wrote $(jq length data/popular.json) entries to data/popular.json"
