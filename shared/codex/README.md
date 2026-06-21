# Shared Codex Automation Templates

These shared templates are sanitized from local Codex app automations and normalized
against the public examples in `../../codex/upstream/`.

They are prompt templates, not live automation files. Create live automations
through the Codex app or Codex automation tools, then paste the relevant prompt.

## Templates

| Template | Use when | Recommended environment | Reasoning |
| --- | --- | --- | --- |
| `board-hygiene.md` | Keep GitHub issues/projects current | `local` | `low` |
| `feature-implementation.md` | Ship exactly one ready issue | `worktree` | `xhigh` |
| `recent-commit-review.md` | Review recent trunk commits and fix high-confidence issues | `worktree` | `xhigh` |
| `sentry-hotfix.md` | Fix unresolved production errors safely | `worktree` | `xhigh` |
| `content-factory-maintenance.md` | Improve a recurring content/skill pipeline | `worktree` | `low` or `medium` |
| `memory.md` | Keep run memory short and dedupe-aware | n/a | n/a |

## Common Guardrails

- Scope each automation to exactly one repository or workspace.
- Name unrelated projects explicitly as out of scope.
- Use metadata-only mode for board hygiene; do not create branches or PRs.
- Use worktree mode for code changes.
- Choose exactly one unit of work per run unless the task is read-only.
- Search for duplicate issues, branches, worktrees, and PRs before creating anything.
- Stop cleanly when no safe work exists.
- Report what changed, what was skipped, validation run, and residual risk.

## Placeholder Key

- `[PROJECT]` - human-readable project name.
- `[REPO_PATH]` - absolute local path selected in the Codex automation.
- `[GITHUB_REPO]` - `owner/repo`.
- `[PROJECT_BOARD]` - GitHub project or board name/URL.
- `[TRUNK]` - `main` or `master`.
- `[BRANCH_PREFIX]` - short safe branch prefix, such as `codex/feature`.
- `[STATE_FILE]` - file or automation memory location for durable loop state.
- `[OUT_OF_SCOPE_PROJECTS]` - comma-separated project names the run must not inspect.
