# Claude Routine: GitHub Board Hygiene

Use for Claude Desktop scheduled tasks with GitHub access.

## Prompt

Clean up this repository's GitHub issue board and keep issues current.

Repository policy:

- This task is scoped only to `[PROJECT]`: `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Canonical board: `[PROJECT_BOARD]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]` or unrelated projects.
- Metadata-only mode: do not create source edits, branches, commits, or PRs.

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
