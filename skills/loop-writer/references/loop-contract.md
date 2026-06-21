# Loop Contract

Use this checklist when drafting or auditing a loop.

## Minimum Bar

- Outcome: the loop has one clear job.
- Trigger: schedule, webhook/API event, manual run, or handoff condition.
- Scope: one repo, board, connector set, project, or workspace.
- Authority: exact read/write boundaries.
- State: durable baseline, cursor, marker, or memory file when repeat runs are possible.
- Dedupe: checks for existing issues, branches, PRs, worktrees, comments, records, and prior run state.
- Verification: specific evidence that proves success.
- Stop conditions: success, no-op, blocker, approval needed, exhausted budget, or stalled progress.
- Output: concise report with source revision, actions, validation, skipped work, and residual risk.

## Code-Writing Loop Requirements

- Work from a fetched current base.
- Use a worktree or disposable checkout.
- Never edit the source checkout directly when a worktree surface exists.
- Make one minimal coherent change.
- Add or update tests when behavior changes.
- Push a branch and open a PR; do not merge.
- Update the state cursor only after review and handoff are complete.

## Red Flags

- "Keep improving" without a measurable stop.
- "Fix everything" without ranking or budget.
- No stale-state or duplicate-work check.
- No explicit forbidden actions.
- Verification that depends on model confidence instead of commands, evidence, or repeatable checks.
- A prompt copied from another project with names, URLs, hostnames, issue numbers, or raw run logs intact.

