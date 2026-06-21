# Clean Claude Scheduled Task Templates

Project-agnostic Claude Desktop scheduled task templates derived from working routine patterns.

These are clean templates, not raw exports. They intentionally do not include project names, organization names, issue numbers, pull request URLs, local usernames, machine paths, hostnames, tokens, run history, or repository-specific labels.

Each directory contains a `SKILL.md` prompt body. Claude Desktop manages schedule, enabled state, model, folder, and permissions in the app.

`ultracode` in a scheduled task name means Claude Opus 4.8-level effort.

## Templates

- `scheduled-task-base/`
- `feature-implementation/`
- `recent-commit-review-ultracode/`
- `backlog-pickup-ultracode/`
- `board-hygiene/`
- `tool-fix-pass/`
- `security-fix-pass/`
- `react-fix-pass/`
- `dry-refactor/`
- `cleanup-simplification/`
- `continuous-testing-remote/`
- `pr-quality-review/`
- `worktree-prune/`
- `docs-verification/`
- `bundle-size-watchdog/`
- `nightly-e2e-expansion/`
- `repo-hygiene-cleanup/`

## Placeholder Key

- `[PROJECT]` - human-readable project name.
- `[REPO_PATH]` - local repository path.
- `[GITHUB_REPO]` - `owner/repo`.
- `[TRUNK]` - trunk branch, usually `main` or `master`.
- `[BRANCH_PREFIX]` - safe branch prefix.
- `[STATE_FILE]` - file or scheduled task memory location for durable loop state.
- `[OUT_OF_SCOPE_PROJECTS]` - projects this task must not inspect.
- `[REMOTE_WORKER]` - optional remote worker name.
- `[REMOTE_REPO_PATH]` - repository path on the remote worker.
- `[REMOTE_COMMAND_PREFIX]` - command prefix such as `ssh [REMOTE_WORKER]`.
