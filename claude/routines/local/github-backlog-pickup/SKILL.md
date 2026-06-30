---
name: github-backlog-pickup
description: Fully autonomous pickup of one eligible backlog issue
---

ultracode

Operate fully autonomously: do not pause for input. Make reasonable decisions, document them in the issue or PR, and stop cleanly if blocked.

Objective:
- Pick exactly one eligible backlog issue in `[GITHUB_REPO]`.
- Implement it end to end in `[REPO_PATH]`.
- Open a pull request against `[TRUNK]`.

Eligibility:
- `claude:routine` is the Claude routine queue label.
- Prefer ready `claude:routine` issues before unlabeled/non-routine work.
- `claude:routines` is a stale plural variant, not a canonical queue label. Use `claude:routine` unless a target repo explicitly documents the plural label.
- `codex:automation` is the Codex queue label.
- `shipcode:agent:codex` and `shipcode:agent:claude` are ShipCode routing only. Do not treat either as a generic intake signal outside ShipCode-specific logic.
- Issue is unassigned or assigned to `[AUTOMATION_ASSIGNEE]`.
- Issue is not already represented by an open PR, active branch, worktree, or in-progress label/status.
- Issue does not require production deployment, live data migration, credentials, external account setup, or a human-only product decision.
- Issue is not an epic unless the task explicitly says to implement the epic itself.
- Rank eligible issues in this order: queue label (`claude:routine`), milestone, target/release/start date, project Priority, then readiness (acceptance criteria, verification scope, and confidence).

Workflow:
- Read local agent instructions and memory.
- List open issues and open PRs.
- Check branches and worktrees for duplicate work.
- Repair existing linked open PRs: if an open PR closes or links a candidate issue, ensure the PR has the issue's queue/review labels before skipping it as already covered.
- Claim the selected issue when supported.
- Create a fresh branch/worktree from `[TRUNK]`.
- Implement with focused tests where practical.
- Use existing codebase patterns and at least three examples before introducing new structure.
- Run scoped validation only.
- Push, open a PR, and comment with the PR link when supported.
- When opening a PR, mirror source issue labels onto the PR: always copy queue labels (`codex:automation`, `claude:routine`) and copy existing classification/review labels such as `code-quality`, `security`, `product`, `bug`, `enhancement`, `backend`, `frontend`, `infra`, and `e2e`.
- Do not invent labels from project fields like Priority, Status, or Area unless those labels already exist on the issue.
- If a non-ShipCode issue or PR has stale `shipcode:agent:codex` or `shipcode:agent:claude`, or any issue or PR has stale plural `claude:routines`, remove it only when the correct queue label is present or can be added with clear evidence; otherwise report it as uncertain.
- Do not merge the PR.

Resource limits:
- Do not run full test suites, full builds, dev servers, docker, or watch mode locally.
- Use `[REMOTE_WORKER]` for heavy validation when needed.
- Keep shell-executing subagents or parallel tasks bounded.

Output:
- Report selected issue, branch, PR URL, validation, blockers, and residual risk.
