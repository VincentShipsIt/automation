# Codex Automation: Bundle Size Watchdog

Recommended settings:

- Kind: cron
- Execution environment: local
- Reasoning effort: medium
- Write surface: read-only report

## Prompt

Run a read-only bundle and dependency size check for `[PROJECT]` at `[REPO_PATH]`.

Scope:

- Work only in `[REPO_PATH]` and `[GITHUB_REPO]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.
- Do not run builds, install dependencies, edit files, create branches, commit, push, open PRs, deploy, or run live migrations.

Metrics:

- Check configured build artifact sizes: `[ARTIFACT_PATH_1]`, `[ARTIFACT_PATH_2]`.
- Check dependency directory size: `[DEPENDENCY_DIR]`.
- Count top-level dependency packages when useful.
- Inspect recent dependency lockfile/package manifest changes.

Thresholds:

- Flag if `[DEPENDENCY_DIR]` exceeds `[MAX_DEPENDENCY_SIZE]`.
- Flag if package count exceeds `[MAX_PACKAGE_COUNT]`.
- Flag if an artifact exceeds `[MAX_ARTIFACT_SIZE]`.

Output:

- Report dependency directory size, package count, artifact sizes, recent dependency changes, threshold violations, skipped files, blockers, and residual risk.
