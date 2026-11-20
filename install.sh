#!/usr/bin/env sh
# Motion Style Picker installer
# Copies the skill into every agent skills folder it finds (or all, with --all).
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/eminoart/motion-style-picker/main/install.sh | sh
#   curl -fsSL https://raw.githubusercontent.com/eminoart/motion-style-picker/main/install.sh | sh -s -- --all
#   sh install.sh --project      # install into ./.claude/skills, ./.agents/skills, ./.cursor/skills of the current project
set -eu

REPO="eminoart/motion-style-picker"
NAME="motion-style-picker"
MODE="auto"
for a in "$@"; do
  case "$a" in
    --all) MODE="all" ;;
    --project) MODE="project" ;;
    -h|--help) sed -n '2,8p' "$0"; exit 0 ;;
  esac
done

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

SCRIPT_DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd || echo "")"
if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/skills/$NAME/SKILL.md" ]; then
  SRC="$SCRIPT_DIR/skills/$NAME"
else
  echo "Downloading $REPO ..."
  curl -fsSL "https://codeload.github.com/$REPO/tar.gz/refs/heads/main" | tar -xz -C "$TMP"
  SRC="$(find "$TMP" -type d -path "*/skills/$NAME" | head -1)"
fi
[ -f "$SRC/SKILL.md" ] || { echo "SKILL.md not found"; exit 1; }

if [ "$MODE" = "project" ]; then
  TARGETS="./.claude/skills ./.agents/skills ./.cursor/skills"
else
  # Claude Code, Codex (new + legacy), Cursor, Gemini CLI, generic agents
  ALL="$HOME/.claude/skills $HOME/.agents/skills $HOME/.codex/skills $HOME/.cursor/skills $HOME/.gemini/skills"
  TARGETS=""
  for d in $ALL; do
    parent="$(dirname "$d")"
    if [ "$MODE" = "all" ] || [ -d "$parent" ]; then TARGETS="$TARGETS $d"; fi
  done
  [ -n "$TARGETS" ] || TARGETS="$HOME/.claude/skills $HOME/.agents/skills"
fi

for d in $TARGETS; do
  mkdir -p "$d"
  rm -rf "$d/$NAME"
  cp -R "$SRC" "$d/$NAME"
  echo "Installed -> $d/$NAME"
done
echo ""
echo "Done. Restart your agent, then say: \"모션 스타일 골라줘\" / \"help me pick a motion graphics style\""
