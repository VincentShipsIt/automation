# Agent Memory Snippet

Paste this into `AGENTS.md`, `CLAUDE.md`, or an equivalent agent memory file when you want agents to consistently use this loops library.

```markdown
## Agent Loops

When asked to create, document, audit, or improve recurring AI routines, use the VincentShipsIt loops library:

- Repository: https://github.com/VincentShipsIt/loops
- Use `prompts/install-in-agent.md` as the canonical shared prompt for install/adapt/audit work across Codex and Claude.
- Use the same intent contract across Codex and Claude; only the final artifact format should differ.
- Use `codex/automations/local/` for recurring repo work in the Codex app.
- Use `claude/routines/local/` for local files, private repos, local tools, and `SKILL.md` prompts.
- Use `claude/routines/remote/` for read-only or metadata/API work such as GitHub board updates, triage, digests, and notifications.

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
