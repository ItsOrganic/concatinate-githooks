#!/usr/bin/env bash
# checks for files longer than N lines; default 60
MAX=${1:-60}
EXCLUDE_PATTERN=${2:-"vendor|node_modules|.git"}
echo "Checking files longer than ${MAX} lines..."
found=0
while IFS= read -r -d '' file; do
  if [[ "$file" =~ $EXCLUDE_PATTERN ]]; then
    continue
  fi
  lines=$(wc -l < "$file" | tr -d ' ')
  if [ "$lines" -gt "$MAX" ]; then
    echo "$file => $lines lines"
    found=1
  fi
done < <(find . -type f -name '*.go' -print0)
if [ "$found" -eq 1 ]; then
  echo "One or more files exceed $MAX lines. Consider refactoring."
  exit 1
fi
exit 0

