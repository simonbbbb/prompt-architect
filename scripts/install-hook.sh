#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-light}"

if [[ "$MODE" != "full" && "$MODE" != "light" && "$MODE" != "off" ]]; then
  echo "Error: mode must be 'full', 'light', or 'off' (got: $MODE)" >&2
  exit 1
fi

# Install to the CURRENT working directory's .claude/, not the package dir
CLAUDE_DIR="$(pwd)/.claude"
SETTINGS_FILE="$CLAUDE_DIR/settings.local.json"
mkdir -p "$CLAUDE_DIR"

if [[ "$MODE" == "off" ]]; then
  HOOK_SCRIPT="cat"
  echo "[prompt-architect] Installing hook in OFF mode (clean pass-through)"
elif [[ "$MODE" == "full" ]]; then
  read -r -d '' HOOK_SCRIPT <<'HOOK' || true
INPUT=$(cat)
printf '%s\n' "$INPUT"
printf '\nApply the 5-pillar prompt engineering framework to this request before responding:\n1. CLARITY: One task per turn. Define format. Set constraints.\n2. CONTEXT: Provide relevant background. Know your audience. State success criteria.\n3. STRUCTURE: Use XML tags. Break into steps. Provide examples.\n4. ADVANCED: Think step-by-step. Self-critique. Use persona.\n5. ITERATION: Present options first. Gate steps. Ask for approval.\n'
HOOK
  echo "[prompt-architect] Installing hook in FULL mode"
else
  read -r -d '' HOOK_SCRIPT <<'HOOK' || true
INPUT=$(cat)
printf '%s\n' "$INPUT"
printf '\nBefore responding: one task per turn, explicit output format, self-review against constraints.\n'
HOOK
  echo "[prompt-architect] Installing hook in LIGHT mode"
fi

# Escape the hook script for JSON (escape backslashes, quotes, newlines)
ESCAPED_SCRIPT=$(printf '%s' "$HOOK_SCRIPT" | python3 -c 'import sys,json; print(json.dumps(sys.stdin.read()))')

printf '{\n  "hooks": {\n    "UserPromptSubmit": {\n      "scope": "project",\n      "script": %s\n    }\n  }\n}\n' "$ESCAPED_SCRIPT" > "$SETTINGS_FILE"

echo "[prompt-architect] Hook installed to $SETTINGS_FILE"
echo "[prompt-architect] Mode: $MODE"
echo ""
echo "Next steps:"
echo "  1. Add '# prompt-architect-mode: $MODE' to your CLAUDE.md"
echo "  2. Override per-request with [full], [light], or [off] prefix"
echo "  3. Invoke the skill explicitly with: /prompt-architect <your request>"
