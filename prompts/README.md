# Agent Prompts

Copy-paste prompts for agents that need to install, adapt, audit, or create routines from this repository.

Use these prompts in Codex, Claude, or another coding agent. They are written for agents first: each prompt tells the agent what to inspect, what to create, what to avoid, and how to report back.

## Prompts

- `install-in-agent.md` - canonical shared install prompt for Codex, Claude, or another coding agent.
- `create-codex-automation.md` - create one Codex app Automation from a template.
- `create-claude-routine.md` - create one Claude Routine or Claude Desktop scheduled task from a template.
- `audit-existing-routines.md` - inspect existing routines/automations and turn them into clean templates.
- `agent-memory-snippet.md` - durable instruction block to paste into `AGENTS.md`, `CLAUDE.md`, or equivalent agent memory.

## Default Install Output

When installing into another repo, prefer creating:

```text
.agents/loops/
  README.md
  shared/
    local/
    remote/
  codex/
    automations/
      local/
      remote/
  claude/
    routines/
      local/
      remote/
```

If the target repo already has a different convention, follow the target repo convention instead.

## Prompt Policy

Use the same agent prompt for install/adapt/audit work across Codex and Claude.
The intent contract should match across platforms: trigger, tools/connectors,
state/dedupe, safe writes, forbidden actions, output, failure mode, and manual
test. Platform-specific prompts should only diverge in artifact shape and app
settings, such as Codex `automation.toml`, Claude local `SKILL.md`, or Claude
remote Routine Markdown.
