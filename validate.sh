#!/usr/bin/env bash
# validate.sh - lint the loops template library.
# Checks: SKILL.md frontmatter + name==dir, ultracode trigger on the code/review/validation set,
# codex automation.toml required keys, and that every placeholder used is documented in a README.
set -uo pipefail
cd "$(dirname "$0")"
fail=0
err(){ echo "FAIL: $*"; fail=1; }

# Code review + build + remote validation tasks that MUST emit the bare ultracode trigger.
ULTRA="feature-implementation backlog-pickup-ultracode recent-commit-review-ultracode pr-quality-review tool-fix-pass security-fix-pass react-fix-pass dry-refactor cleanup-simplification nightly-e2e-expansion docs-verification bundle-size-watchdog continuous-testing-remote"

# 1) Claude scheduled-task SKILL.md
for f in claude/scheduled-tasks/*/SKILL.md; do
  [ -e "$f" ] || continue
  dir=$(basename "$(dirname "$f")")
  grep -q '^name:' "$f" || err "$f: missing 'name:' frontmatter"
  grep -q '^description:' "$f" || err "$f: missing 'description:' frontmatter"
  name=$(awk -F': ' '/^name:/{sub(/^name: */,""); print; exit}' "$f" | tr -d '\r')
  [ "$name" = "$dir" ] || err "$f: name '$name' != dir '$dir'"
  body_first=$(awk '/^---$/{d++; next} d>=2 && NF {print; exit}' "$f")
  case " $ULTRA " in
    *" $dir "*) [ "$body_first" = "ultracode" ] || err "$f: ultracode-set task but first body line is '$body_first' (want bare 'ultracode')" ;;
  esac
done

# 2) Codex automation.toml required keys
for f in codex/automations/*/automation.toml; do
  [ -e "$f" ] || continue
  for k in version id kind name prompt status rrule; do
    grep -qE "^$k[[:space:]]*=" "$f" || err "$f: missing required key '$k'"
  done
done

# 3) Placeholder documentation coverage (authored files only; upstream excluded)
tmp_used=$(mktemp); tmp_doc=$(mktemp)
grep -rhoE '\[[A-Z0-9_]+\]' README.md AGENTS.md claude/scheduled-tasks shared codex/automations prompts skills 2>/dev/null \
  | grep -vE '\[(PLACEHOLDER|[A-Z])\]$' | sort -u > "$tmp_used"
grep -rhoE '\[[A-Z0-9_]+\]' README.md AGENTS.md ./*/README.md ./*/*/README.md skills/loop-writer/SKILL.md 2>/dev/null \
  | sort -u > "$tmp_doc"
while read -r tok; do
  [ -z "$tok" ] && continue
  grep -qxF "$tok" "$tmp_doc" || err "placeholder $tok is used but not documented in any README/key"
done < "$tmp_used"
rm -f "$tmp_used" "$tmp_doc"

if [ "$fail" -eq 0 ]; then echo "OK: all checks passed"; fi
exit $fail
