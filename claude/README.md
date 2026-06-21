# Claude Routines

Examples for:

- Claude Code remote Routines
- Claude Desktop local scheduled tasks
- Claude `/loop` style scheduled prompts

## Shared Templates

Use `../shared/claude/` for sanitized shared templates derived from local scheduled tasks:

- `../shared/claude/scheduled-task-base.md`
- `../shared/claude/feature-implementation.md`
- `../shared/claude/backlog-pickup-ultracode.md`
- `../shared/claude/board-hygiene.md`
- `../shared/claude/tool-fix-pass.md`
- `../shared/claude/dry-refactor.md`
- `../shared/claude/cleanup-simplification.md`
- `../shared/claude/continuous-testing-remote.md`
- `../shared/claude/pr-quality-review.md`
- `../shared/claude/worktree-prune.md`
- `../shared/claude/docs-verification.md`
- `../shared/claude/bundle-size-watchdog.md`
- `../shared/claude/nightly-e2e-expansion.md`

## Clean Desktop Scheduled Task Templates

Use `scheduled-tasks/` for app-ready templates derived from local Claude Desktop scheduled task patterns:

```text
~/.claude/scheduled-tasks/
```

The template set includes feature implementation, backlog pickup, board hygiene, tool/security/React fix passes, refactors, cleanup, remote validation, PR review, worktree pruning, docs verification, bundle checks, e2e expansion, and repo hygiene. Schedule, enabled state, model, folder, and permission settings are app-managed and are not represented in these files.

## Included Upstreams

### `upstream/routine-templates/`

Source: https://github.com/Fisher521/routine-templates

MIT-licensed Claude Code Routine prompt templates. Useful files:

```text
upstream/routine-templates/templates/
  01-daily-reading-triage.md
  02-weekly-vault-harvest.md
  03-morning-flame-brief.md
  04-github-pr-triage.md
  05-focus-block-handoff.md
```

Best pattern to copy: `Schedule / Connectors / Delivery / Prompt / Rules / Setup`.

### `upstream/paperclip-devops-watchdog/`

Source: https://github.com/MichaelZelbel/paperclip-devops-watchdog

MIT-licensed DevOps watchdog examples. Useful files:

```text
upstream/paperclip-devops-watchdog/templates/desktop-scheduled-task-skill.example.md
upstream/paperclip-devops-watchdog/prompts/hourly-quick-repair.md
upstream/paperclip-devops-watchdog/prompts/six-hour-deep-check.md
upstream/paperclip-devops-watchdog/paperclip-devops-runbook.md
```

Best pattern to copy: scheduled task prompt delegates to a runbook and specific task prompt, with hard safety boundaries.

## Linked Examples

The linked examples are strong references but do not have explicit licenses, so they are summarized rather than copied:

- `linked-examples/aakashg-claude-routines-pm-pack.md`
- `linked-examples/ziptax-claude.md`

## Claude Storage Shapes

Remote Routines are configured in Claude's web/Desktop UI and have no portable local file format. Store their prompts and setup docs as Markdown.

Claude Desktop local scheduled task prompts live at:

```text
~/.claude/scheduled-tasks/<task-name>/SKILL.md
```

Schedule, model, folder, enabled state, and permissions are app-managed; the `SKILL.md` stores the prompt body.
