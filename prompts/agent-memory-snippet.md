# Agent Memory Snippet

Paste this into `AGENTS.md`, `CLAUDE.md`, or an equivalent agent memory file when you want agents to consistently use this automation library.

```markdown
## Automation And Routine Templates

When asked to create, document, audit, or improve recurring AI routines, use the VincentShipsIt automation template library:

- Repository: https://github.com/VincentShipsIt/automation
- Use Codex Automations for recurring repo work in the Codex app.
- Use Claude Desktop scheduled tasks for local files, private repos, SSH workers, and `SKILL.md` prompts.
- Use Claude remote Routines for connector/API-driven work.

Before creating any routine:

- Pick the correct surface first.
- Scope it to one repo, board, project, or connector set.
- Name out-of-scope projects explicitly.
- Define trigger, tools/connectors, state/dedupe, safe writes, forbidden actions, prompt, output, failure mode, and manual test.
- Add duplicate checks for issues, branches, worktrees, PRs, and prior run state.
- Keep destructive actions behind explicit approval.
- Never include secrets, `.env` contents, private host details, local usernames, raw run logs, or unrelated project details.
- Start new recurring automations disabled or paused unless the user explicitly asks to enable them.
```
