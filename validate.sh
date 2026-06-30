#!/usr/bin/env bash
# validate.sh - lint the loops template library.
# Checks: SKILL.md frontmatter + name==dir, ultracode trigger on the code/review/validation set,
# codex automation.toml required keys, and that every placeholder used is documented in a README.
set -uo pipefail
cd "$(dirname "$0")"
fail=0
err(){ echo "FAIL: $*"; fail=1; }
contains(){ grep -qF -- "$2" "$1" || err "$1: missing required text: $2"; }

# Code review + build + validation tasks that MUST emit the bare ultracode trigger.
ULTRA="github-issue-implementation github-backlog-pickup recent-commit-review sentry-hotfix pr-review tool-fix-pass dry-repo nightly-e2e-expansion docs-verification bundle-size-watchdog local-validation memory-review"

# 1) Claude scheduled-task SKILL.md
for f in claude/routines/local/*/SKILL.md; do
  [ -e "$f" ] || continue
  dir=$(basename "$(dirname "$f")")
  grep -q '^name:' "$f" || err "$f: missing 'name:' frontmatter"
  grep -q '^description:' "$f" || err "$f: missing 'description:' frontmatter"
  name=$(awk -F': ' '/^name:/{sub(/^name: */,""); print; exit}' "$f" | tr -d '\r')
  [ "$name" = "$dir" ] || err "$f: name '$name' != dir '$dir'"
  body_first=$(awk '/^---$/{d++; next} d>=2 && NF {print; exit}' "$f")
  case " $ULTRA " in
    *" $dir "*) [ "$body_first" = "ultracode" ] || err "$f: ultracode-set task but first body line is '$body_first' (want bare 'ultracode')" ;;
    *) [ "$body_first" = "ultracode" ] && err "$f: non-ultracode-set task '$dir' must NOT start with bare 'ultracode'" ;;
  esac
done

# 1b) Skill SKILL.md frontmatter + name==dir
for f in skills/*/SKILL.md; do
  [ -e "$f" ] || continue
  dir=$(basename "$(dirname "$f")")
  grep -q '^name:' "$f" || err "$f: missing 'name:' frontmatter"
  grep -q '^description:' "$f" || err "$f: missing 'description:' frontmatter"
  name=$(awk -F': ' '/^name:/{sub(/^name: */,""); print; exit}' "$f" | tr -d '\r')
  [ "$name" = "$dir" ] || err "$f: name '$name' != dir '$dir'"
done

# 2) Codex automation.toml required keys + ultracode prohibition
for f in codex/automations/local/*/automation.toml; do
  [ -e "$f" ] || continue
  for k in version id kind name prompt status rrule; do
    grep -qE "^$k[[:space:]]*=" "$f" || err "$f: missing required key '$k'"
  done
  dir=$(basename "$(dirname "$f")")
  case "$dir" in *ultracode*) err "$f: 'ultracode' must not appear in a Codex automation directory name" ;; esac
  grep -qiE '^(id|name|kind)[[:space:]]*=.*ultracode' "$f" && err "$f: 'ultracode' must not appear in Codex id/name/kind"
done

# 3) Placeholder documentation coverage (authored files only; upstream excluded)
tmp_used=$(mktemp); tmp_doc=$(mktemp); tmp_used_files=$(mktemp); tmp_doc_files=$(mktemp)
printf '%s\n' README.md AGENTS.md prompts/*.md skills/loop-writer/SKILL.md > "$tmp_used_files"
find codex/automations claude/routines shared -path '*/upstream/*' -prune -o -type f \( -name '*.md' -o -name '*.toml' \) -print >> "$tmp_used_files" 2>/dev/null
grep -rhoE '\[[A-Z0-9_]+\]' $(cat "$tmp_used_files") 2>/dev/null \
  | grep -vE '\[(PLACEHOLDER|[A-Z])\]$' | sort -u > "$tmp_used"

printf '%s\n' README.md AGENTS.md skills/loop-writer/SKILL.md > "$tmp_doc_files"
find codex claude shared prompts -path '*/upstream/*' -prune -o -name README.md -type f -print >> "$tmp_doc_files" 2>/dev/null
grep -rhoE '\[[A-Z0-9_]+\]' $(cat "$tmp_doc_files") 2>/dev/null \
  | sort -u > "$tmp_doc"
while read -r tok; do
  [ -z "$tok" ] && continue
  grep -qxF "$tok" "$tmp_doc" || err "placeholder $tok is used but not documented in any README/key"
done < "$tmp_used"
rm -f "$tmp_used" "$tmp_doc" "$tmp_used_files" "$tmp_doc_files"

# 4) GitHub queue label policy checks
codex_issue_files="codex/automations/local/github-issue-implementation/automation.toml shared/local/codex/github-issue-implementation.md"
for f in $codex_issue_files; do
  contains "$f" "Rank eligible issues in this order: queue label (\`codex:automation\`), milestone, target/release/start date, project Priority, then readiness (acceptance criteria, verification scope, and confidence)."
  contains "$f" "Prefer ready \`codex:automation\` issues before unlabeled/non-automation work."
done

claude_issue_files="claude/routines/local/github-issue-implementation/SKILL.md shared/local/claude/github-issue-implementation.md claude/routines/local/github-backlog-pickup/SKILL.md shared/local/claude/github-backlog-pickup.md"
for f in $claude_issue_files; do
  contains "$f" "Rank eligible issues in this order: queue label (\`claude:routine\`), milestone, target/release/start date, project Priority, then readiness (acceptance criteria, verification scope, and confidence)."
  contains "$f" "Prefer ready \`claude:routine\` issues before unlabeled/non-routine work."
  contains "$f" "\`claude:routines\` is a stale plural variant, not a canonical queue label."
done

pr_label_files="$codex_issue_files $claude_issue_files"
for f in $pr_label_files; do
  contains "$f" "When opening a PR, mirror source issue labels onto the PR: always copy queue labels (\`codex:automation\`, \`claude:routine\`)"
  contains "$f" "Do not invent labels from project fields like Priority, Status, or Area unless those labels already exist on the issue."
  contains "$f" "stale plural \`claude:routines\`"
done

repair_files="codex/automations/local/board-hygiene/automation.toml shared/local/codex/board-hygiene.md claude/routines/local/board-hygiene/SKILL.md shared/local/claude/board-hygiene.md claude/routines/remote/board-hygiene.md shared/remote/claude/board-hygiene.md"
for f in $repair_files; do
  contains "$f" "Repair existing linked open PRs: if an open PR closes or links an issue, ensure the PR has the issue's queue/review labels."
  contains "$f" "Always copy queue labels (\`codex:automation\`, \`claude:routine\`) from linked issues to PRs"
  contains "$f" "Do not invent labels from project fields like Priority, Status, or Area unless those labels already exist on the issue."
  contains "$f" "\`claude:routines\` is a stale plural variant, not a canonical queue label."
  contains "$f" "stale plural \`claude:routines\`"
done

shipcode_lines=$(grep -rnE "shipcode:agent:(codex|claude)" README.md AGENTS.md claude/routines shared codex/automations prompts skills 2>/dev/null || true)
if [ -n "$shipcode_lines" ]; then
  while IFS= read -r line; do
    [ -z "$line" ] && continue
    case "$line" in
      *ShipCode*) ;;
      *) err "shipcode:agent:* labels must only appear in ShipCode-specific guidance: $line" ;;
    esac
  done <<< "$shipcode_lines"
fi

claude_plural_lines=$(grep -rn "claude:routines" README.md AGENTS.md claude/routines shared codex/automations prompts skills 2>/dev/null || true)
if [ -n "$claude_plural_lines" ]; then
  while IFS= read -r line; do
    [ -z "$line" ] && continue
    case "$line" in
      *stale*|*plural*|*legacy*) ;;
      *) err "claude:routines must only appear as stale/plural/legacy guidance: $line" ;;
    esac
  done <<< "$claude_plural_lines"
fi

# 5) Leaked-data scan (authored files only; upstream/linked-examples excluded by the path set)
leak=$(grep -rnE '/Users/|/home/[a-z]|ghp_[A-Za-z0-9]{20,}|gho_[A-Za-z0-9]{20,}|sk-[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}|xox[baprs]-[A-Za-z0-9-]{10,}|AIza[0-9A-Za-z_-]{30,}|-----BEGIN [A-Z ]*PRIVATE KEY-----' \
  README.md AGENTS.md claude/routines shared codex/automations prompts skills 2>/dev/null || true)
if [ -n "$leak" ]; then
  while IFS= read -r line; do err "leaked absolute path or secret-shaped string: $line"; done <<< "$leak"
fi

if [ "$fail" -eq 0 ]; then echo "OK: all checks passed"; fi
exit $fail
