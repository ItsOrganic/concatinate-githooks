#!/usr/bin/env bash
set -e
TOP=$(git rev-parse --show-toplevel)

if ! command -v golangci-lint &>/dev/null; then
  echo "golangci-lint not installed. Run: scripts/install-go-tools.sh"
  exit 1
fi

echo "-> Running golangci-lint (enterprise rules)"
# point to rules/golangci.yml in repo root if present
if [ -f "$TOP/rules/golangci.yml" ]; then
  golangci-lint run --config "$TOP/rules/golangci.yml"
else
  golangci-lint run
fi

