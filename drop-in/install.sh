#!/usr/bin/env bash
# Install agent skills and project files into a codebase.
# Usage: ./drop-in/install.sh [target-directory]
# Run from the agentic-development repo root (or anywhere; script finds the repo).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$(cd "${1:-.}" && pwd)"

echo "Installing into: $TARGET"
echo "From skill library: $REPO_ROOT"

mkdir -p "$TARGET/.cursor/skills" "$TARGET/.agents/skills"
for skill in "$REPO_ROOT/skills"/*/; do
  name="$(basename "$skill")"
  rm -rf "$TARGET/.cursor/skills/$name" "$TARGET/.agents/skills/$name"
  cp -R "$skill" "$TARGET/.cursor/skills/$name"
  cp -R "$skill" "$TARGET/.agents/skills/$name"
  echo "  skill: $name"
done

copy_if_missing() {
  local src="$1" dest="$2"
  if [[ -f "$dest" ]]; then
    echo "  skip (exists): $(basename "$dest")"
  else
    cp "$src" "$dest"
    echo "  added: $(basename "$dest")"
  fi
}

copy_if_missing "$REPO_ROOT/INSTRUCTIONS.md" "$TARGET/INSTRUCTIONS.md"
copy_if_missing "$SCRIPT_DIR/AGENTS.md" "$TARGET/AGENTS.md"
copy_if_missing "$SCRIPT_DIR/CONTEXT.md" "$TARGET/CONTEXT.md"

mkdir -p "$TARGET/docs"
touch "$TARGET/docs/.gitkeep"

echo "Done. Open AGENTS.md in the target project and try /grill."
