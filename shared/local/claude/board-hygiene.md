# Claude Routine: GitHub Board Hygiene

Use for Claude Desktop scheduled tasks with GitHub access.

## Prompt

Clean up this repository's GitHub issue board and keep issues current without creating duplicates.

Repository policy:

- This task is scoped only to `[PROJECT]`: `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Canonical board: `[PROJECT_BOARD]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]` or unrelated projects.
- Metadata-only mode: do not create source edits, branches, commits, or PRs.
- Queue labels are `codex:automation` for Codex automation work and `claude:routine` for Claude routine work.
- `claude:routines` is a stale plural variant, not a canonical queue label. Use `claude:routine` unless a target repo explicitly documents the plural label.
- `shipcode:agent:codex` and `shipcode:agent:claude` are ShipCode routing only. Do not treat either as a generic intake signal outside ShipCode-specific logic.

Workflow:

- Read local/project agent instructions and issue label guidance.
- Inspect open issues, labels, milestones, open/merged PRs, and project fields.
- Use read-only git inspection only when needed for evidence.
- Search by issue URL, title, normalized title slug, PR links, and branch names before adding or updating board items.
- Do not create duplicate issues or board cards.

Tasks:

- Ensure every open issue is represented once on the canonical board.
- Remove/archive duplicate board cards.
- Normalize fields only when supported by evidence.
- Repair existing linked open PRs: if an open PR closes or links an issue, ensure the PR has the issue's queue/review labels.
- Always copy queue labels (`codex:automation`, `claude:routine`) from linked issues to PRs, and copy existing classification/review labels such as `code-quality`, `security`, `product`, `bug`, `enhancement`, `backend`, `frontend`, `infra`, and `e2e`.
- Do not invent labels from project fields like Priority, Status, or Area unless those labels already exist on the issue.
- If a non-ShipCode issue or PR has stale `shipcode:agent:codex` or `shipcode:agent:claude`, or any issue or PR has stale plural `claude:routines`, remove it only when the correct queue label is present or can be added with clear evidence; otherwise report it as uncertain.
- Keep labels concise.
- Keep titles board-readable.
- Repair issue bodies that should follow the repo PRD format.
- Move stale or low-priority items to the repo's holding status when evidence supports it.
- Move active, blocked, completed, and merged work based on evidence.

Output:

- Changed issues/cards.
- Duplicate cleanup.
- Field/label/title/body changes.
- Items left uncertain.
