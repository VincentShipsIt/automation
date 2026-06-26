# Claude Scheduled Task: DRY Repo

## Prompt

ultracode

Make one small behavior-preserving simplification in `[PROJECT]` without deleting features.

CPU-heavy validation policy:

- Do not run CPU-intensive tests or heavy validation locally.
- Run CPU-heavy tests/checks on `[REMOTE_WORKER]` when available.
- Lightweight local checks are allowed only when clearly quick/static.

Scope:

- Work only in `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.
- Do not deploy, run live migrations, delete production data, or remove product behavior.

Workflow:

- Read local agent instructions.
- Run `git fetch --all --prune`.
- Use `origin/[TRUNK]` as the base branch.
- Search for one clear low-risk simplification target: duplicated logic, redundant branches, unnecessary indirection, stale comments, duplicate config, or obvious unreachable code.
- Skip if equivalent cleanup/refactor work is already active.
- Prefer targets with focused tests or cheap validation.
- Preserve behavior exactly.
- Do not remove features, public APIs, migrations, compatibility code, or uncertain behavior.
- Find at least three local examples before introducing or changing an abstraction.
- Run focused validation for touched areas.
- Commit and open a PR against `[TRUNK]`.

Output:

- Report simplification target, evidence it was safe, files changed, branch, PR URL, validation, skipped candidates, and residual risk.
