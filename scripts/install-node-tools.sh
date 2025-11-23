#!/usr/bin/env bash
set -e
if ! command -v npm &>/dev/null; then
  echo "npm not found. Please install Node.js and npm."
  exit 1
fi
npm install --no-audit --no-fund --save-dev prettier eslint || true
echo "Node tools installed (prettier, eslint)"

