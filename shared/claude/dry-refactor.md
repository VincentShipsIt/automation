# Claude Scheduled Task: DRY Refactor

## Prompt

Find high-value, small-surface duplication in this repository and apply a safe DRY refactor.

CPU-heavy validation policy:

- Do not run CPU-intensive tests or heavy validation locally.
- Run CPU-heavy tests/checks on `[REMOTE_WORKER]` when available.
- Lightweight local checks are allowed only when clearly quick/static.

Repository policy:

- This task is scoped only to `[PROJECT]`: `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:

- Use `[TRUNK]` as the base branch.
- Scope changes conservatively to duplicated utilities, repeated component/service logic, serializers, scripts, or narrowly repeated patterns with clear existing abstractions.
- Read local agent instructions before editing.
- Prefer existing codebase patterns.
- Find nearby examples before introducing abstractions.
- Avoid broad architecture changes.
- Run focused checks/tests for touched areas.
- Commit changes with a concise message and open a pull request against `[TRUNK]`.

If no safe high-value refactor is found, report the best candidates and do not create noisy changes.

