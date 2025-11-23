#!/usr/bin/env bash
# template to run a secrets detector (optional). Install detect-secrets or git-secrets externally.
if command -v detect-secrets &>/dev/null; then
  detect-secrets scan > .secrets.baseline || true
else
  echo "detect-secrets not installed; skipping secrets scan"
fi

