#!/usr/bin/env bash
set -euo pipefail

# Rename project to match the workspace directory name
PROJECT_NAME=$(basename "$(pwd)")
CURRENT_NAME=$(node -p "require('./package.json').name")

if [ "$PROJECT_NAME" != "$CURRENT_NAME" ]; then
  echo "==> Renaming project: $CURRENT_NAME → $PROJECT_NAME"
  sed -i "s/\"name\": \"$CURRENT_NAME\"/\"name\": \"$PROJECT_NAME\"/" package.json
fi
