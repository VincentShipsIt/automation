# Codex Automations

Codex automation templates are split by execution surface.

## Folders

- `local/` - app-ready `automation.toml` templates for local/worktree execution.
- `remote/` - reserved for future connector-safe Codex remote templates.

Keep the live Codex install shape unchanged:

```text
~/.codex/automations/<automation-id>/
  automation.toml
  memory.md
```

Use `../../shared/local/codex/` for local reusable prompt source material.
Use `../../shared/remote/` only for connector-safe prompt source material.
