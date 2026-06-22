# Claude Scheduled Task: Security Fix Pass

## Prompt

ultracode

Run one conservative security fix pass for `[PROJECT]`.

Scope:

- Work only in `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:

- Read local agent instructions and security guidance.
- Inspect dependency advisories, scanner output, open security issues, and recent security-related PRs.
- Pick exactly one actionable security issue that can be fixed safely.
- Skip issues requiring credentials, production secrets, live data changes, or policy decisions.
- Find at least three local examples before changing auth, validation, tenancy, or persistence patterns.
- Add focused regression tests for changed behavior.
- Run scoped validation.
- Commit and open a PR against `[TRUNK]`.
- Do not merge the PR.

Output:

- Report issue/finding handled, root cause, branch, PR URL, validation, skipped findings, and residual risk.
