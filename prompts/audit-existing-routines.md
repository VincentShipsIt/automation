# Audit Existing Routines And Automations

Use this prompt when a project already has Codex automations, Claude routines, scheduled tasks, cron prompts, or agent runbooks.

```text
Audit this project's existing routines and automations, then convert the useful parts into clean templates using the VincentShipsIt automation library conventions.

Source library:
- https://github.com/VincentShipsIt/automation
- Prefer local copy if available.

Inspect:
- Codex automations, if available.
- Claude scheduled tasks, routines, SKILL.md files, CLAUDE.md, AGENTS.md, cron prompts, runbooks, and workflow docs.
- GitHub Actions or other scheduled jobs only for context; do not modify them unless asked.

For each routine found:
- Identify surface: Codex Automation, Claude Desktop scheduled task, Claude remote Routine, cron, GitHub Action, or other.
- Identify trigger, tools/connectors, state/dedupe, safe writes, forbidden actions, output, and failure mode.
- Classify it as keep, merge, rewrite, disable, or delete-candidate.
- Extract the reusable pattern.
- Remove project names, org names, local paths, hostnames, issue numbers, PR URLs, run history, secrets, and personal details.

Create:
- A concise audit report.
- Clean templates under .agents/automation/ or the repo's existing automation docs location.
- A migration checklist for turning drafts into live routines.

Rules:
- Do not create live schedules or update app-managed automations unless explicitly asked.
- Do not preserve raw run logs as templates.
- Do not expose secrets or private host details.
- Keep only patterns that are reusable and safe.

Finish with:
- Routines found.
- Routines worth keeping.
- Clean templates created.
- Unsafe or stale routines to retire.
- Recommended first three routines to enable manually.
```
