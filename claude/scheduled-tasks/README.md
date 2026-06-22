# Clean Claude Scheduled Task Templates

Project-agnostic Claude Desktop scheduled task templates derived from working routine patterns.

These are clean templates, not raw exports. They intentionally do not include project names, organization names, issue numbers, pull request URLs, local usernames, machine paths, hostnames, tokens, run history, or repository-specific labels.

Each directory contains a `SKILL.md` prompt body. Claude Desktop manages schedule, enabled state, model, folder, and permissions in the app.

## Ultracode Trigger

`ultracode` requests Claude Opus 4.8-level effort. The trigger is a **bare `ultracode` token on the first
line of the prompt body**, immediately after the frontmatter — NOT the task name. Naming a task
`*-ultracode` is a human-readable label only; the scheduler acts on the body token, not the name.

Correct shape:

```text
---
name: recent-commit-review
description: Review recent trunk commits and open a fix PR
---

ultracode

Review new commits on `[GITHUB_REPO]` ...
```

Also set the task's model to **Claude Opus 4.8** in the app. The app model selection and the body token
work together: the token drives the high-effort run.

Templates that carry the trigger (code review + code building + remote validation):
feature-implementation, backlog-pickup-ultracode, recent-commit-review-ultracode, pr-quality-review,
tool-fix-pass, security-fix-pass, react-fix-pass, dry-refactor, cleanup-simplification,
nightly-e2e-expansion, docs-verification, bundle-size-watchdog, continuous-testing-remote.
Pure hygiene tasks (board-hygiene, worktree-prune, repo-hygiene-cleanup) intentionally omit it.

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
- `[PROJECT_BOARD]` - canonical issue/project board (e.g. a GitHub Projects board).
- `[REVIEW_MARKER]` - hidden marker string this routine writes into its own review comments so it can
  detect already-reviewed PRs (e.g. an HTML comment like `<!-- routine:pr-quality-review -->`).
- `[TOOL_COMMAND]` - command this routine runs (linter/scanner/test script), e.g. `bun run lint`.
- `[AUTOMATION_ASSIGNEE]` - issue assignee that marks an issue as owned by this routine.
- `[ALLOW_SAFE_DELETES]` - boolean gate; when true the routine may delete provably-merged, clean
  targets, otherwise it only reports candidates.
- `[REPO_PATH_1]`, `[REPO_PATH_2]` - local repo paths for multi-repo routines (repo-hygiene-cleanup).
- `[GITHUB_REPO_1]`, `[GITHUB_REPO_2]` - `owner/repo` for multi-repo routines.
