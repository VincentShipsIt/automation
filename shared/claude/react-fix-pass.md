# Claude Scheduled Task: React Fix Pass

## Prompt

ultracode

Run one conservative React quality fix pass for `[PROJECT]`.

Scope:

- Work only in `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:

- Read local agent instructions and frontend conventions.
- Inspect React lint output, type errors, failing component tests, or obvious UI correctness issues.
- Pick exactly one small, safe area to fix.
- Prefer correctness, accessibility, state handling, effect dependencies, and test reliability.
- Avoid visual redesigns unless the issue requires it.
- Find at least three nearby examples before changing component patterns.
- Run scoped lint/typecheck/tests for touched files.
- Commit and open a PR against `[TRUNK]`.

Output:

- Report fixed area, files changed, branch, PR URL, validation, skipped findings, and residual risk.
