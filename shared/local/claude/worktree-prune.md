# Claude Scheduled Task: Prune Merged Worktrees

## Prompt

Clean up local worktrees and local branches in this repository that are already merged into `[TRUNK]`.

Repository policy:

- This task is scoped only to `[PROJECT]`: `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.
- Clean local git worktrees and local branches only.
- Do not delete remote branches, push anything, deploy, run live migrations, or write production data.
- Always preserve these branch names exactly: `[TRUNK]`.
- Also preserve the currently checked-out branch in every worktree, unless that worktree is safely removed.

Preflight:

- Read local agent instructions if present.
- Run `git fetch --all --prune`.
- Verify local `[TRUNK]` exists.
- If `origin/[TRUNK]` exists, use both local and remote trunk as safety references.
- Record `git worktree list --porcelain`, local branches, remote branches, and current branch for each worktree before changing anything.

Dirty-work guard:

- For every worktree, run `git status --porcelain=v1 --untracked-files=all`.
- If a worktree has staged, unstaged, untracked, conflicted, or ignored-required local work, do not remove that worktree and do not delete its branch.
- Never use `git clean`, `git reset`, `git checkout --`, `git branch -D`, or `git worktree remove --force`.

Merged-work verification:

- Do not trust commit ancestry alone.
- A branch/worktree is eligible only when all are true:
  - branch is not `[TRUNK]`
  - branch has no dirty worktree attached
  - branch tip is merged into local `[TRUNK]`
  - if `origin/[TRUNK]` exists, branch tip is also merged into it
  - file-level verification shows the branch contributes no file content absent from trunk
- Prefer false negatives over false positives.

Cleanup actions:

- Remove eligible clean worktrees with `git worktree remove` without force.
- Delete eligible local branches with `git branch -d` only.
- Run `git worktree prune` after successful removals.
- If no worktrees or branches are eligible, report no-op with the candidate count and stop.

Output:

- Report removed branches/worktrees, skipped branches/worktrees, and exact reason for each skip.
- Explicitly call out dirty worktrees.

