# Shared Automation Templates

Shared templates are sanitized source prompts for recurring app-level work. They are distilled from local Codex Automations, local Claude scheduled tasks, and public routine examples.

Use these files as the durable source of truth before pasting into Codex Automations, Claude Routines, Claude Desktop scheduled tasks, or `/loop` prompts.

## Layout

```text
shared/
  codex/
    README.md
    board-hygiene.md
    feature-implementation.md
    sentry-hotfix.md
    content-factory-maintenance.md
    memory.md
  claude/
    README.md
    scheduled-task-base.md
    feature-implementation.md
    backlog-pickup-ultracode.md
    board-hygiene.md
    tool-fix-pass.md
    dry-refactor.md
    cleanup-simplification.md
    continuous-testing-remote.md
    pr-quality-review.md
    worktree-prune.md
    docs-verification.md
    bundle-size-watchdog.md
    nightly-e2e-expansion.md
```

## Common Guardrails

- Scope each routine or automation to one repository, project, or workspace.
- Explicitly name out-of-scope projects when nearby repos share the same account.
- Search for duplicate issues, branches, worktrees, PRs, and existing automation output before creating anything.
- Use read-only mode for triage and board hygiene unless the prompt says otherwise.
- Use a dedicated worktree or isolated checkout for code-writing runs.
- Pick exactly one writable unit of work per run unless the task is purely read-only.
- Stop cleanly when no safe work exists.
- Report changes made, validation run, skipped work, and residual risk.

## Platform Split

- `codex/` templates are shaped for Codex app Automations, including `automation.toml` plus optional `memory.md` live storage.
- `claude/` templates are shaped for Claude Routines, Claude Desktop scheduled tasks, and `/loop` prompts.

Keep implementation-specific setup in the platform folders. Keep reusable prompt bodies here.
