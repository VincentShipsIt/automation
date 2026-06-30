# Codex Automation: GitHub Board Hygiene

Recommended settings:

- Kind: cron
- Execution environment: local
- Reasoning effort: low
- Write surface: GitHub metadata only

## Prompt

Clean up this repository's canonical GitHub issue board and keep issues current without creating duplicates.

Repository policy:

- This automation is scoped only to `[PROJECT]`: `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Canonical project board: `[PROJECT_BOARD]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]` or any unrelated project.
- This automation is GitHub metadata only. Do not create local worktrees, branches, commits, pull requests, source edits, or repo file changes.

Workflow:

- Read `AGENTS.md`, `CLAUDE.md`, and relevant local memory or label guidance when present.
- Inspect open issues, labels, milestones, open and merged PRs, and GitHub project fields.
- Run read-only git/GitHub inspection only when needed for evidence.
- Do not create duplicate issues or board cards.
- Search by issue URL, title, normalized title slug, linked PRs, and branch names before adding or updating any board item.

Board hygiene tasks:

- Ensure every open issue is represented once on the canonical board.
- Remove or archive duplicate board cards, keeping the canonical issue card.
- Normalize issue type and project fields only when supported by issue text, comments, PRs, branches, or board evidence.
- Keep labels concise. Avoid labels for values already represented by project fields.
- Keep issue titles short and board-readable when the body preserves the nuance.
- Ensure PRD-style issues follow the repo's current issue-body format and flag uncertain items.
- Move active, blocked, completed, stale, and merged work to the appropriate status based on evidence.
- Move low-priority stale work to the repo's holding status unless active evidence says otherwise.

Output expectations:

- Summarize changed issues/cards.
- List duplicate cleanup.
- List field, label, title, and body changes.
- List items left uncertain and why.
- If nothing changed, report the checks performed.

