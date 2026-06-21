# Claude Scheduled Task: Cleanup And Simplification

## Prompt

Do one task in this repository to minimize LOC without deleting features.

CPU-heavy validation policy:

- Do not run CPU-intensive tests or heavy validation locally.
- Run CPU-heavy tests/checks on `[REMOTE_WORKER]` when available.
- Lightweight local checks are allowed only when clearly quick/static.

Repository policy:

- This task is scoped only to `[PROJECT]`: `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:

- Read local agent instructions before editing.
- Run `git fetch --all --prune`.
- Use `origin/[TRUNK]` as the base branch.
- Create a fresh timestamped branch/worktree based directly on `origin/[TRUNK]`, formatted like `[BRANCH_PREFIX]-cleanup-YYYYMMDD-HHMMSS`.
- Inspect local branches/worktrees and open PRs for similar cleanup work.
- Skip if equivalent active work exists and is not clearly safe to continue.
- Verify the new branch is based directly on `origin/[TRUNK]`.
- Remove duplication.
- Simplify code.
- Flag dead code rather than deleting uncertain behavior.
- Do not delete features.
- Remove obvious AI slop when behavior-preserving.
- Keep scope small and prefer existing patterns.
- Run focused checks/tests.
- Commit and open a pull request against `[TRUNK]`.

If no safe cleanup is found, report without creating noisy changes.

