# Forward Future Loop Library Notes

Sources:

- https://signals.forwardfuture.ai/loop-library/
- https://www.skills.sh/forward-future/loop-library/loop-library

Forward Future's Loop Library is a live catalog of repeatable AI-agent workflows. Use it as reference material for loop structure, not as automatic permission to run a loop.

## Patterns Worth Using

- Explicit verification: every loop should name what evidence proves success.
- Authority boundaries: prompts should say what the agent may read, write, deploy, delete, or publish.
- Stop conditions: distinguish success, no-op, blocker, approval needed, exhausted budget, and stalled progress.
- One bounded improvement at a time: keep changes reviewable and rollback-friendly.
- Fresh-state checks: reread current state before consequential actions.
- Evidence-backed output: finish with the source revision, checks run, changes made, skipped work, and remaining risk.

## Strong Ideas To Adapt

- Production error sweep: trace actionable errors to root cause, verify the fix, open a PR, and stop cleanly when no action exists.
- Loop Harness verification loop: ship scheduled repository work only after an independent verification pass.
- Recent-feedback sweep: turn recent corrections into failure patterns, fix confirmed matches, and rerun the audit.
- Clodex adversarial-review loop: use an independent reviewer and iterate only on blocking findings.
- Codex completion-contract loop: define required evidence before a long-running agent reports done.
- Groundtruth loop: audit from current code and configuration rather than framework assumptions.

## Fit For This Repo

The most useful addition from the library is not a wholesale copy. It is the stricter loop contract used by the recent commit review templates: baseline, current head, bounded review window, verified findings, safe fix PR, and baseline update only after a completed review cycle.
