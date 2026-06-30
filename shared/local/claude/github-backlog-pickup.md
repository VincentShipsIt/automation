# Claude Scheduled Task: GitHub Backlog Pickup

Use this for a high-autonomy nightly task that claims and implements one eligible issue.

## Prompt

ultracode

Operate fully autonomously. Never pause to ask the user anything. Make reasonable decisions and document them in the issue or PR. If genuinely blocked, comment the blocker and stop.

Repository policy:

- Workspace: `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Base branch: `[TRUNK]`.
- Read repo instructions and memory before coding.
- Use the repo's package manager and conventions.
- Do not deploy, run live migrations, or touch production data.

Objective:

Pick exactly one eligible backlog issue from GitHub and implement it end-to-end using multi-agent orchestration when available.

Issue selection:

- List open issues and inspect assignees, labels, title, URL, and status.
- `claude:routine` is the Claude routine queue label.
- Prefer ready `claude:routine` issues before unlabeled/non-routine work.
- `claude:routines` is a stale plural variant, not a canonical queue label. Use `claude:routine` unless a target repo explicitly documents the plural label.
- `codex:automation` is the Codex queue label.
- `shipcode:agent:codex` and `shipcode:agent:claude` are ShipCode routing only. Do not treat either as a generic intake signal outside ShipCode-specific logic.
- Eligible issues must be unassigned or assigned to the automation owner.
- Never pick an issue assigned to someone else.
- Skip issues already in progress.
- Check open PRs, local/remote branches, and worktrees for the issue number or slug.
- Repair existing linked open PRs: if an open PR closes or links a candidate issue, ensure the PR has the issue's queue/review labels before skipping it as already covered.
- Skip human-review, production-ops, manual-secret, live-migration, deploy, or external-account work.
- Rank eligible issues in this order: queue label (`claude:routine`), milestone, target/release/start date, project Priority, then readiness (acceptance criteria, verification scope, and confidence).
- Never pick an epic issue itself; pick child tickets.
- If no eligible issue exists, say so and stop.

Claim:

- Assign the issue to the automation owner when appropriate.
- Comment that an automated session picked it up with start time.
- Create a worktree/branch off `[TRUNK]` named `issue-<number>-<short-slug>`.

Implement:

- Map relevant code with search, graph tools, or subagents.
- Use TDD where practical.
- Follow existing codebase patterns.
- Keep every changed line traceable to the issue.
- No gratuitous refactoring.
- Keep secrets out of git.
- Cap expensive validation locally; use `[REMOTE_WORKER]` for heavier checks.

Ship:

- Commit with a conventional message referencing the issue.
- Push the branch and open a PR against `[TRUNK]`.
- Link the issue with a closing keyword only when fully implemented.
- When opening a PR, mirror source issue labels onto the PR: always copy queue labels (`codex:automation`, `claude:routine`) and copy existing classification/review labels such as `code-quality`, `security`, `product`, `bug`, `enhancement`, `backend`, `frontend`, `infra`, and `e2e`.
- Do not invent labels from project fields like Priority, Status, or Area unless those labels already exist on the issue.
- If a non-ShipCode issue or PR has stale `shipcode:agent:codex` or `shipcode:agent:claude`, or any issue or PR has stale plural `claude:routines`, remove it only when the correct queue label is present or can be added with clear evidence; otherwise report it as uncertain.
- Comment on the issue with the PR link.
- Do not merge the PR.

Success criteria:

- One issue claimed.
- Implementation complete or clearly blocked.
- PR opened or draft PR opened with blocker.
- Verification listed.
