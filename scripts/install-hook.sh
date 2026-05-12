#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-light}"

if [[ "$MODE" != "full" && "$MODE" != "light" && "$MODE" != "off" ]]; then
  echo "Error: mode must be 'full', 'light', or 'off' (got: $MODE)" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CLAUDE_DIR="$SCRIPT_DIR/.claude"
SETTINGS_FILE="$CLAUDE_DIR/settings.local.json"

mkdir -p "$CLAUDE_DIR"

# Build the hook script content based on mode
if [[ "$MODE" == "off" ]]; then
  HOOK_SCRIPT=""
  echo "[prompt-architect] Installing hook in OFF mode (no transformation)"
elif [[ "$MODE" == "full" ]]; then
  HOOK_SCRIPT='echo "[prompt-architect] FULL mode active"'
  echo "[prompt-architect] Installing hook in FULL mode"
else
  HOOK_SCRIPT='echo "[prompt-architect] LIGHT mode active"'
  echo "[prompt-architect] Installing hook in LIGHT mode"
fi

# Write settings file
ESCAPED_SCRIPT=$(printf '%s\n' "$HOOK_SCRIPT" | sed 's/["\]/\\&/g')
printf '{\n  "hooks": {\n    "UserPromptSubmit": {\n      "scope": "project",\n      "script": "%s"\n    }\n  }\n}\n' "$ESCAPED_SCRIPT" > "$SETTINGS_FILE"

echo "[prompt-architect] Hook installed to $SETTINGS_FILE"
echo "[prompt-architect] Mode: $MODE"
echo ""
echo "Next steps:"
echo "  1. Add '# prompt-architect-mode: $MODE' to your CLAUDE.md"
echo "  2. Override per-request with [full], [light], or [off] prefix"
echo "  3. Invoke the skill explicitly with: /prompt-architect <your request>"
