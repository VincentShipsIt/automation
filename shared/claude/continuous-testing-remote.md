# Claude Scheduled Task: Continuous Testing Via Remote Worker

## Prompt

ultracode

Run scheduled validation for `[PROJECT]` using `[REMOTE_WORKER]` as the remote worker for CPU-heavy checks.

Remote target and CPU policy:

- This task is scoped only to `[PROJECT]`.
- Local workspace: `[REPO_PATH]`.
- Remote workspace: `[REMOTE_REPO_PATH]`.
- Use `[REMOTE_COMMAND_PREFIX]` for CPU-heavy commands.
- Do not run CPU-intensive tests or heavy validation locally.
- Lightweight local checks are allowed only for inspecting scripts, reading config, or preparing remote commands.
- Do not inspect, validate, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.
- Do not create branches, commits, PRs, issue comments, or source edits.

Remote preflight:

- Verify the repo exists and is a git worktree.
- Stop if it has staged, unstaged, or untracked local changes.
- Use a per-repo non-overlap lock under `/tmp`; skip if another validation run is active.
- Fetch `[TRUNK]` from origin, switch to `[TRUNK]`, and pull with `git pull --ff-only origin [TRUNK]`.
- If `[TRUNK]` is missing or cannot fast-forward, report blocked.

Validation policy:

- Use the repo's package manager and existing package scripts.
- Run lightweight standard validation only: lint/check, type-check, and focused tests when exposed by normal scripts.
- Prefer commands in this order when scripts exist: `lint`, `type-check`, `test`.
- Run commands sequentially.
- Do not run production writes, deploys, live migrations, destructive cleanup, or dependency update commands.

Output:

- Report branch, starting and ending commit, whether it fast-forwarded, commands run, pass/fail status, and the first actionable failure block for any failed command.

