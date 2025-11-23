#!/usr/bin/env bash
set -e
TOOLS_DIR=${HOME}/concatinate-githooks
if [ ! -d "$TOOLS_DIR" ]; then
  echo "Cloning centralized hooks to $TOOLS_DIR..."
  git clone git@github.com:concatinate/concatinate-githooks.git "$TOOLS_DIR" || true
else
  echo "Updating centralized hooks at $TOOLS_DIR..."
  (cd "$TOOLS_DIR" && git pull) || true
fi

mkdir -p .githooks
cp -r "$TOOLS_DIR/lang/common/.githooks/"* .githooks/ 2>/dev/null || true

# if props exists inside repo (manual), use that; else detect by files
LANG=""
if [ -f .githooks/props ]; then
  LANG=$(sed -n 's/lang=\(.*\)/\1/p' .githooks/props | tr -d '\n')
fi

# auto-detect language if not set
if [ -z "$LANG" ]; then
  if [ -f go.mod ]; then
    LANG=go
  elif [ -f package.json ]; then
    LANG=nodejs
  elif [ -f pyproject.toml ] || [ -f requirements.txt ]; then
    LANG=python
  fi
fi

if [ -n "$LANG" ]; then
  cp -r "$TOOLS_DIR/lang/$LANG/.githooks/"* .githooks/ 2>/dev/null || true
  echo "lang=$LANG" > .githooks/props
fi

git config core.hooksPath .githooks || true
chmod -R +x .githooks/* || true
echo "Bootstrap complete. Hooks installed (lang=$LANG)"

