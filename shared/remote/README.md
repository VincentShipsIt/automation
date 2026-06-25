# Shared Remote Templates

Reusable prompt bodies for connector/API routines that do not need local
filesystem access.

## Folders

- `claude/` - Claude remote Routine prompt bodies.
- `codex/` - reserved for future Codex remote prompt bodies.

Remote templates should be read-only or metadata-only by default. Do not put
code execution, local validation, branch creation, or PR-fixing loops here unless
the template defines a project-specific worker contract.
