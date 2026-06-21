# Clean Codex Automation Templates

Project-agnostic Codex app automation templates derived from working automation patterns.

These are clean templates, not raw exports. They intentionally do not include project names, organization names, issue numbers, pull request URLs, local usernames, machine paths, hostnames, tokens, run history, or repository-specific labels.

## Templates

- `feature-implementation/automation.toml` - implement exactly one ready issue in a worktree.
- `recent-commit-review-ultracode/automation.toml` - review recent trunk commits and open safe fix PRs.
- `board-hygiene/automation.toml` - keep GitHub issues and project fields clean without duplicate work.
- `sentry-hotfix/automation.toml` - inspect unresolved Sentry errors and open safe fix PRs.
- `content-factory-maintenance/automation.toml` - improve a recurring content, docs, or skill pipeline.
- `memory-template/memory.md` - clean memory structure for Codex automation state.

## Placeholder Key

- `[AUTOMATION_ID]` - stable slug for the automation.
- `[PROJECT]` - human-readable project name.
- `[REPO_PATH]` - absolute repo path on the machine where the automation runs.
- `[GITHUB_REPO]` - `owner/repo`.
- `[PROJECT_BOARD]` - board name, URL, or project identifier.
- `[TRUNK]` - trunk branch, usually `main` or `master`.
- `[BRANCH_PREFIX]` - safe branch prefix, such as `codex/feature`.
- `[STATE_FILE]` - file or automation memory location for durable loop state.
- `[OUT_OF_SCOPE_PROJECTS]` - projects this automation must not inspect.
- `[REMOTE_VALIDATION_WORKER]` - optional remote worker for heavy checks.

## Safety Rules

- Scope each automation to one repository.
- Use worktree execution for code-writing automations.
- Use local execution for metadata-only hygiene.
- Search for duplicate issues, branches, worktrees, and PRs before creating anything.
- Stop cleanly when no safe work exists.
- Report changed work, skipped work, validation, and residual risk.
