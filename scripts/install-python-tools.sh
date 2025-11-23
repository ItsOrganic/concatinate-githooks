#!/usr/bin/env bash
set -e
if ! command -v pip &>/dev/null; then
  echo "pip not found. Please install Python and pip."
  exit 1
fi
pip install --user black flake8 || true
echo "Python tools installed (black, flake8)"

