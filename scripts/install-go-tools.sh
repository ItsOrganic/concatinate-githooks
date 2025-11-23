#!/usr/bin/env bash
set -e
# installs golangci-lint, goimports, gofumpt if missing
GOBIN=${GOBIN:-$(go env GOPATH 2>/dev/null)/bin}
mkdir -p "$GOBIN"
export PATH="$GOBIN:$PATH"

if ! command -v golangci-lint &>/dev/null; then
  echo "Installing golangci-lint..."
  curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$GOBIN" v1.55.2
fi

if ! command -v goimports &>/dev/null; then
  echo "Installing goimports..."
  go install golang.org/x/tools/cmd/goimports@latest
fi

if ! command -v gofumpt &>/dev/null; then
  echo "Installing gofumpt..."
  go install mvdan.cc/gofumpt@latest
fi

echo "Go tools installed: golangci-lint, goimports, gofumpt"

