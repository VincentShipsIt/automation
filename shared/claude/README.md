# Shared Claude Routine Templates

These shared templates are sanitized from local Claude Desktop scheduled tasks and
normalized against the public Claude routine examples in `../../claude/upstream/`.

Use them as copy-paste starting points for:

- Claude Desktop local scheduled tasks
- Claude Code remote Routines
- Claude `/loop` maintenance prompts

## Templates

| Template | Best surface | Use when |
| --- | --- | --- |
| `scheduled-task-base.md` | Desktop scheduled task | You need a safe local task wrapper |
| `feature-implementation.md` | Desktop scheduled task | Ship one ready issue to PR |
| `recent-commit-review-ultracode.md` | Desktop scheduled task | Review recent trunk commits and PR high-confidence fixes |
| `backlog-pickup-ultracode.md` | Desktop scheduled task | Fully autonomous issue pickup |
| `board-hygiene.md` | Desktop or remote Routine | Keep GitHub boards clean |
| `tool-fix-pass.md` | Desktop scheduled task | Run a scanner/tool and PR safe fixes |
| `dry-refactor.md` | Desktop scheduled task | Dedupe one small area |
| `cleanup-simplification.md` | Desktop scheduled task | Reduce LOC without feature deletion |
| `continuous-testing-remote.md` | Desktop scheduled task | Run periodic validation on a remote worker |
| `pr-quality-review.md` | Desktop or remote Routine | Review one open PR strictly |
| `worktree-prune.md` | Desktop scheduled task | Remove only merged clean worktrees |
| `docs-verification.md` | Desktop scheduled task | Verify docs against source |
| `bundle-size-watchdog.md` | Desktop scheduled task | Monitor dependency/build artifact size |
| `nightly-e2e-expansion.md` | Desktop scheduled task | Add exactly one nightly e2e spec |

## Common Claude Prompt Rules

- Define the surface: remote Routine, Desktop scheduled task, or `/loop`.
- Include setup, connectors/tools, prompt, hard rules, output, and failure modes.
- Remove unused connectors from remote Routines.
- Run manually once before scheduling.
- For Desktop tasks, keep prompt in `~/.claude/scheduled-tasks/<task>/SKILL.md`.
- For remote Routines, keep a Markdown source-of-truth because there is no portable routine file format.
- End autonomous remote Routine prompts with a direct execution instruction.
