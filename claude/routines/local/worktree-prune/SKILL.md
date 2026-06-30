---
name: worktree-prune
description: Remove only merged clean worktrees and local branches
---

Prune merged local worktrees and branches for `[PROJECT]`.

Scope:
- Work only in `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Safety:
- Fetch and prune remotes.
- Never delete the main checkout, current branch, unmerged work, dirty worktrees, or branches with unpushed commits.
- Only remove worktrees whose branches are fully merged into `[TRUNK]` or whose PRs are merged.
- Before deleting anything, verify git status is clean for that worktree.
- Use non-destructive listing, then remove confirmed safe targets.

Output:
- Report removed worktrees, removed branches, skipped dirty/unmerged targets, and blockers.
