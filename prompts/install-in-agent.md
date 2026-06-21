# Install Loops Into This Project

Use this prompt in a coding agent while the target project is open.

```text
Install the VincentShipsIt loops library into this project as agent-friendly docs and project-specific routine drafts.

Source library:
- GitHub: https://github.com/VincentShipsIt/loops
- If the library already exists locally, read the local copy instead of fetching.

Goal:
- Create clean, project-specific loop drafts that can later be pasted into Codex Automations, Claude Desktop scheduled tasks, or Claude remote Routines.
- Do not create live schedules, webhooks, recurring jobs, or app automations unless explicitly asked after the drafts are reviewed.

First inspect this project:
- Read AGENTS.md, CLAUDE.md, README, package scripts, existing docs, and existing automation/routine files if present.
- Identify the repo path, GitHub repo, trunk branch, package manager, test commands, CI system, issue tracker, project board, and out-of-scope sibling projects.
- Find any existing branch/worktree/PR conventions.

Choose surfaces:
- Use Codex Automation for repo work that should run in the Codex app, especially feature implementation, issue hygiene, Sentry fixes, and codebase maintenance.
- Use Claude Desktop scheduled tasks for local files, private repos, SSH workers, and Claude Code SKILL.md prompts.
- Use Claude remote Routines for connector/API-driven work such as GitHub triage, meeting briefs, reading digests, and webhook/API-triggered workflows.

Create or update:
- .agents/loops/README.md
- .agents/loops/shared/
- .agents/loops/codex/
- .agents/loops/claude/

Install a small useful starter set:
- Feature implementation
- Recent commit review
- Board hygiene
- Remote validation or local validation
- PR quality review
- Worktree prune

For each installed draft, include:
- Surface
- Trigger
- Connectors/tools
- State/dedupe strategy
- Safe writes
- Forbidden actions
- Prompt body
- Output format
- Failure mode
- Manual test before enabling

Rules:
- Replace placeholders only with facts verified from this repo.
- Keep unknowns as [PLACEHOLDER] and list them under Required Setup.
- Do not include secrets, .env contents, private host details, local usernames, or unrelated project names.
- Do not copy raw run history from existing routines.
- Add duplicate checks for issues, branches, worktrees, PRs, and previous run state.
- Put destructive actions behind explicit approval.
- Make every routine stop cleanly when no safe work exists.

Finish with:
- Files created or changed.
- Which routines are ready to paste into Codex or Claude.
- Required setup values still missing.
- Recommended first manual test.
```
