---
name: github-issue-implementation
description: Ship one ready GitHub issue to a pull request
---

ultracode

Implement one ready, high-value GitHub issue in `[PROJECT]` without creating duplicate work.

CPU-heavy validation policy:
- Do not run CPU-intensive tests or heavy validation locally.
- Run CPU-heavy checks on `[REMOTE_WORKER]` when available.
- Lightweight local checks are allowed only when clearly quick/static.
- If unsure whether a command is CPU-heavy, run it remotely or skip it with a clear note.

Repository policy:
- Work only in `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.
- `codex:automation` is the Codex queue label; `claude:routine` is the Claude routine queue label.
- `claude:routines` is a stale plural variant, not a canonical queue label. Use `claude:routine` unless a target repo explicitly documents the plural label.
- `shipcode:agent:codex` and `shipcode:agent:claude` are ShipCode routing only. Do not treat either as a generic intake signal outside ShipCode-specific logic.

Workflow:
- Read local agent instructions and project memory before editing.
- Inspect open issues, open PRs, branches, and worktrees before choosing work.
- Use `[TRUNK]` as the base branch.
- Choose exactly one ready issue not covered by active work.
- Rank eligible issues in this order: queue label (`claude:routine`), milestone, target/release/start date, project Priority, then readiness (acceptance criteria, verification scope, and confidence).
- Prefer ready `claude:routine` issues before unlabeled/non-routine work.
- Do not give `shipcode:agent:codex` or `shipcode:agent:claude` any selection weight unless this run is explicitly scoped to ShipCode.
- Do not give stale `claude:routines` any selection weight unless target repo policy explicitly documents that plural label.
- Prefer small, shippable tasks with clear acceptance criteria.
- Repair existing linked open PRs: if an open PR closes or links a candidate issue, ensure the PR has the issue's queue/review labels before skipping it as already covered.
- Run `git fetch --all --prune`.
- Create a fresh timestamped branch `[BRANCH_PREFIX]-YYYYMMDD-HHMMSS` from `origin/[TRUNK]`.
- Follow existing codebase patterns; find at least three examples before introducing a new pattern.
- Add focused tests or validation for changed behavior.
- Commit and open a pull request against `[TRUNK]`.
- When opening a PR, mirror source issue labels onto the PR: always copy queue labels (`codex:automation`, `claude:routine`) and copy existing classification/review labels such as `code-quality`, `security`, `product`, `bug`, `enhancement`, `backend`, `frontend`, `infra`, and `e2e`.
- Do not invent labels from project fields like Priority, Status, or Area unless those labels already exist on the issue.
- If a non-ShipCode issue or PR has stale `shipcode:agent:codex` or `shipcode:agent:claude`, or any issue or PR has stale plural `claude:routines`, remove it only when the correct queue label is present or can be added with clear evidence; otherwise report it as uncertain.
- Do not merge the PR.

If no safe ready issue is available, report why and stop.

Output:
- Selected issue (number and title).
- Branch name and base commit.
- Commit SHA.
- PR URL.
- Validation run (commands executed, pass/fail).
- Skipped work (issues considered but not chosen, and why).
- Residual risk (anything that could not be verified locally).
