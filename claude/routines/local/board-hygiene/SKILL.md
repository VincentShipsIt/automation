---
name: board-hygiene
description: Keep GitHub issues and project board fields clean
---

Clean up `[PROJECT]` issue and board metadata without creating duplicate work.

Scope:
- Work only on `[GITHUB_REPO]` and `[PROJECT_BOARD]`.
- Local repository path: `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:
- Read local agent instructions and label/issue guidance.
- Inspect open issues, labels, milestones, open/merged PRs, branches, worktrees, and project fields.
- Search by issue URL, title, normalized title, branch name, and PR references before adding or updating anything.
- Ensure every open issue is represented once on the canonical board.
- Remove or archive duplicate board cards.
- Normalize type, status, priority, milestone, and labels only when evidence supports the change.
- Keep labels concise and avoid duplicating project fields with labels.
- Keep titles board-readable while preserving nuance in the body.
- Move active, blocked, completed, merged, and deferred work based on evidence.
- Flag uncertain items instead of guessing.

Do not create branches, commits, or PRs unless the board cleanup explicitly requires repository edits.

Output:
- Summarize changed issues/cards, duplicate cleanup, field changes, status moves, uncertain items, and skipped work.
