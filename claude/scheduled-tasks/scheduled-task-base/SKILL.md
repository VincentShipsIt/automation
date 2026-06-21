---
name: scheduled-task-base
description: Base scheduled task wrapper for one scoped repository
---

Run the scheduled task for `[PROJECT]`.

Scope:
- Work only in `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Trunk branch: `[TRUNK]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]` or unrelated projects.

Safety:
- Read local agent instructions before acting.
- Check current git status before making changes.
- Search for duplicate branches, worktrees, issues, and PRs before creating anything.
- Use a fresh branch/worktree for code changes.
- Do not run production deploys, live migrations, destructive cleanup, or commands that write to external services unless this task explicitly allows it.
- Keep the run bounded. Stop cleanly if no safe action exists.

Output:
- Report actions taken, validation run, skipped work, blockers, and residual risk.
