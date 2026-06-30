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
- Queue labels are `codex:automation` for Codex automation work and `claude:routine` for Claude routine work.
- `claude:routines` is a stale plural variant, not a canonical queue label. Use `claude:routine` unless a target repo explicitly documents the plural label.
- `shipcode:agent:codex` and `shipcode:agent:claude` are ShipCode routing only. Do not treat either as a generic intake signal outside ShipCode-specific logic.

Workflow:

- Read `AGENTS.md`, `CLAUDE.md`, and relevant local memory or label guidance when present.
- Inspect open issues, labels, milestones, open and merged PRs, and GitHub project fields.
- Run read-only git/GitHub inspection only when needed for evidence, such as branch lists, PR state, or worktree inventory.
- Do not create duplicate issues or board cards.
- Search by issue URL, title, normalized title slug, linked PRs, and branch names before adding or updating any board item.

Board hygiene tasks:

- Ensure every open issue is represented once on the canonical board.
- Remove or archive duplicate board cards, keeping the canonical issue card.
- Normalize issue type and project fields only when supported by issue text, comments, PRs, branches, or board evidence.
- Repair existing linked open PRs: if an open PR closes or links an issue, ensure the PR has the issue's queue/review labels.
- Always copy queue labels (`codex:automation`, `claude:routine`) from linked issues to PRs, and copy existing classification/review labels such as `code-quality`, `security`, `product`, `bug`, `enhancement`, `backend`, `frontend`, `infra`, and `e2e`.
- Do not invent labels from project fields like Priority, Status, or Area unless those labels already exist on the issue.
- If a non-ShipCode issue or PR has stale `shipcode:agent:codex` or `shipcode:agent:claude`, or any issue or PR has stale plural `claude:routines`, remove it only when the correct queue label is present or can be added with clear evidence; otherwise report it as uncertain.
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
