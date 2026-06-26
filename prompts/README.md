# Agent Prompts

Copy-paste prompts for agents that need to install, adapt, audit, or create routines from this repository.

Use these prompts in Codex, Claude, or another coding agent. They are written for agents first: each prompt tells the agent what to inspect, what to create, what to avoid, and how to report back.

## Prompts

- `install-in-agent.md` - install the loops library into a target project as clean, project-specific docs/templates.
- `create-codex-automation.md` - create one Codex app Automation from a template.
- `create-claude-routine.md` - create one Claude Routine or Claude Desktop scheduled task from a template.
- `discover-codebase-loops.md` - inspect a target codebase for reusable loop candidates.
- `audit-existing-routines.md` - inspect existing routines/automations and turn them into clean templates.
- `agent-memory-snippet.md` - durable instruction block to paste into `AGENTS.md`, `CLAUDE.md`, or equivalent agent memory.

## Default Install Output

When installing into another repo, prefer creating:

```text
.agents/loops/
  README.md
  codex/
  claude/
  shared/
```

If the target repo already has a different convention, follow the target repo convention instead.
