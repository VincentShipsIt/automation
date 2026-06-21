# Claude Scheduled Task: Tool Fix Pass

Use this for recurring scanner tools such as security scanners, React doctors,
safe auto-patch tools, dead-code detectors, or lint/code-quality agents.

## Prompt

Run `[TOOL_NAME]` in this repository and apply only safe, reviewable fixes.

CPU-heavy validation policy:

- Do not run CPU-intensive tests or heavy validation locally.
- Run CPU-heavy tests/checks on `[REMOTE_WORKER]` when available.
- Lightweight local checks are allowed only when clearly quick/static.
- If unsure whether a command is heavy, run it remotely or skip it with a clear note.

Repository policy:

- This task is scoped only to `[PROJECT]`: `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:

- Read local agent instructions before editing.
- Run `git fetch --all --prune` before creating any branch/worktree.
- Use `origin/[TRUNK]` as the base branch.
- Create a fresh timestamped branch/worktree based directly on `origin/[TRUNK]`, formatted like `[BRANCH_PREFIX]-YYYYMMDD-HHMMSS`.
- Before editing, inspect local branches/worktrees and open PRs for similar `[TOOL_NAME]` work.
- If equivalent active work exists, update it only when it is clearly this automation's branch and safe to continue. Otherwise skip and report.
- Verify the work branch is based directly on `origin/[TRUNK]` before editing.
- Run `[TOOL_NAME]`.
- Fix only clear, actionable findings with small, reviewable changes.
- Prefer existing codebase patterns.
- Run focused checks/tests for touched areas.
- Commit changes and open a pull request against `[TRUNK]`.
- If there are no actionable findings, report the result without creating noisy changes.

Output:

- Tool run summary.
- Findings fixed/skipped.
- Branch/commit/PR.
- Validation.
- Residual risk.

