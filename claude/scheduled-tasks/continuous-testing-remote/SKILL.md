---
name: continuous-testing-remote
description: Scheduled read-only validation through a remote worker
---

ultracode

Run scheduled validation for `[PROJECT]` using `[REMOTE_WORKER]` for CPU-heavy checks.

Scope:
- Local workspace: `[REPO_PATH]`.
- Remote workspace: `[REMOTE_REPO_PATH]`.
- Command prefix: `[REMOTE_COMMAND_PREFIX]`.
- Do not inspect, validate, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.
- Do not create branches, commits, PRs, issue comments, or source edits.

Remote preflight:
- Verify the repo exists and is a git worktree.
- Stop if it has staged, unstaged, or untracked local changes.
- Use a per-repo non-overlap lock under `/tmp`; if another validation run is active, exit cleanly. If the lock is older than a reasonable threshold (e.g. 30 minutes) or its owning process or run is no longer present, treat it as stale, clear it, and proceed.
- Fetch `[TRUNK]`, switch to `[TRUNK]`, and pull with `git pull --ff-only origin [TRUNK]`.
- If `[TRUNK]` is missing or cannot fast-forward, report blocked.

Validation:
- Use the repo package manager and existing package scripts.
- Prefer scripts in this order when available: lint, type-check, test.
- Run commands sequentially.
- Avoid production writes, deploys, live migrations, destructive cleanup, and dependency updates.

Output:
- Report branch, starting and ending commit, fast-forward status, commands run, pass/fail status, and first actionable failure block.
