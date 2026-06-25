# Claude Routines

Claude routine templates are split by execution surface.

## Folders

- `local/` - local `SKILL.md` prompts for Claude Desktop scheduled tasks and local `/loop` runs.
- `remote/` - paste-ready Claude remote Routine prompts for connector/API workflows.

Claude Desktop stores scheduled task prompt bodies under:

```text
~/.claude/scheduled-tasks/<task-name>/SKILL.md
```

This repo still calls them `routines/local` because the reusable intent is a
routine; `scheduled-tasks` is only Claude Desktop's live storage shape.

Use `../../shared/local/claude/` for local reusable prompt source material.
Use `../../shared/remote/claude/` for remote Routine source material.
