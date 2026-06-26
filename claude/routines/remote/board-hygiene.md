# Claude Remote Routine: GitHub Board Hygiene

Surface: Claude remote Routine
Trigger: daily or twice daily on active boards
Connectors/tools: GitHub repository and project board
State/dedupe: use `[STATE_FILE]` when available; otherwise dedupe by issue URL, project item ID, title slug, linked PR, and branch name
Safe writes: GitHub issue metadata, issue body formatting, labels, milestones, and project fields only
Forbidden actions: local filesystem access, source edits, branches, commits, PRs, merges, deploys, production writes, destructive cleanup
Manual test before enabling: run once against a small project board and verify every proposed metadata change is evidence-backed

## Prompt

Clean up `[PROJECT]` GitHub issue and project-board metadata without creating
duplicate work.

Scope:

- Work only on `[GITHUB_REPO]` and `[PROJECT_BOARD]`.
- Do not use or assume a local repository path.
- Do not inspect, summarize, or update `[OUT_OF_SCOPE_PROJECTS]`.
- Metadata-only mode: do not create source edits, branches, commits, pull requests, deploys, or production writes.

Workflow:

- Inspect open issues, labels, milestones, open and merged pull requests, and project fields.
- Search by issue URL, project item ID, title, normalized title slug, linked pull requests, and branch names before adding or updating board items.
- Do not create duplicate issues or board cards.
- Ensure every open issue is represented once on the canonical board.
- Remove or archive duplicate board cards, keeping the canonical issue card.
- Normalize project fields only when issue text, comments, labels, PRs, branches, or board evidence supports the change.
- Keep labels concise. Do not duplicate values already represented by project fields.
- Keep issue titles board-readable when the body preserves the nuance.
- Move active, blocked, completed, merged, stale, and deferred work based on evidence.
- Flag uncertain items instead of guessing.

Output:

- Changed issues/cards.
- Duplicate cleanup.
- Field, label, title, and body changes.
- Items left uncertain and why.
- If nothing changed, report the checks performed.

If no safe metadata work exists, stop cleanly and say so.
Execute this routine now.
