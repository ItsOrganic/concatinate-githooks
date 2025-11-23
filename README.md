# concatinate-githooks

Centralized git hooks, linters, and developer tooling for Concatinate.

This repository provides:
- language-agnostic common hooks (pre-commit, pre-push, commit-msg)
- language-specific hooks for Go, Go-service, Python, Node.js
- scripts to bootstrap developer machines
- enterprise golangci-lint rules and other configs

Usage:
1. Option A: generate repo locally (this script) and push to your private organization.
2. Option B: host this repo privately and use the provided `tools/git-conclone` to clone repos and auto-install hooks.

Requirements:
- SSH key configured for GitHub if you want `git-conclone` to fetch a private hooks repo.
- Developer machines should run `scripts/install-go-tools.sh` / `scripts/install-node-tools.sh` / `scripts/install-python-tools.sh` once.
