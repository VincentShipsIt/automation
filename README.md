# Automation Examples

Curated examples for app-level autonomous work:

- `shared/` - clean shared templates distilled from working routines and upstream examples.
- `codex/` - clean OpenAI Codex app Automations templates, examples, and sharing tooling.
- `claude/` - clean Claude Code Routines and Claude Desktop scheduled task templates.

This folder is for recurring app automations, not `AGENTS.md`, `CLAUDE.md`, or agent memory rules.

## Layout

```text
automation/
  shared/
    codex/
    claude/
  codex/
    automations/
    upstream/
      awesome-codex-automations/
      codex-automations-cli/
  claude/
    scheduled-tasks/
    upstream/
      routine-templates/
      paperclip-devops-watchdog/
    linked-examples/
      aakashg-claude-routines-pm-pack.md
      ziptax-claude.md
```

## Licensing

Repos with explicit MIT licenses were copied into `upstream/` with their license files intact.

Repos without an explicit license are linked and summarized under `linked-examples/` rather than republished here.

## Best Starting Points

- Shared cross-agent templates: `shared/`
- Shared Codex automation templates: `shared/codex/`
- Shared Claude routine templates: `shared/claude/`
- Clean Codex app automation templates: `codex/automations/`
- Clean Claude Desktop scheduled task templates: `claude/scheduled-tasks/`
- Codex automation ideas: `codex/upstream/awesome-codex-automations/automations/`
- Codex sharing/install CLI: `codex/upstream/codex-automations-cli/`
- Claude cloud routine prompt templates: `claude/upstream/routine-templates/templates/`
- Claude Desktop scheduled task/runbook pattern: `claude/upstream/paperclip-devops-watchdog/templates/desktop-scheduled-task-skill.example.md`
