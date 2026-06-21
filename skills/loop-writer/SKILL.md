---
name: loop-writer
description: Draft, audit, repair, or adapt Codex Automation, Claude Routine, Claude Desktop scheduled task, and shared AI-agent loop templates in the VincentShipsIt/loops repo. Use when the user asks to create a loop, improve a routine or automation prompt, convert an existing workflow into a reusable loop, audit loop safety, or prepare templates under codex/, claude/, shared/, prompts/, or skills/.
---

# Loop Writer

Use this skill to write clean, bounded loop templates for this repository.

## Source Order

1. Read `README.md` and `AGENTS.md`.
2. Read the nearest platform index:
   - Codex: `codex/README.md`, `codex/automations/README.md`, `shared/codex/README.md`.
   - Claude: `claude/README.md`, `claude/scheduled-tasks/README.md`, `shared/claude/README.md`.
   - Shared prompt only: `shared/README.md`.
3. For loop-design standards, read `shared/forward-future-loop-library.md`.
4. For stricter authoring criteria, read `references/loop-contract.md`.

When live catalog comparison is needed, use the existing Forward Future skill instead of duplicating it:

```text
npx skills add Forward-Future/loop-library --skill loop-library -g
```

## Surface Decision

- Use Codex Automations for repo work in the Codex app, especially worktree-based implementation, issue hygiene, Sentry fixes, and codebase maintenance.
- Use Claude Desktop scheduled tasks for local files, private repos, SSH workers, and Claude Code `SKILL.md` prompts.
- Use Claude remote Routines for connector/API-driven work.
- Use `shared/` for reusable source prompts before creating app-specific files.

## Naming Rules

- Keep Codex names literal and product-neutral: `recent-commit-review`, `sentry-hotfix`, `board-hygiene`.
- Do not use `ultracode` in Codex template names, paths, ids, headings, or descriptions.
- In this repo, `ultracode` means Claude Opus 4.8-level effort. Use it only for Claude routine templates where that effort level is intentional.
- Keep placeholders generic: `[PROJECT]`, `[REPO_PATH]`, `[GITHUB_REPO]`, `[TRUNK]`, `[BRANCH_PREFIX]`, `[STATE_FILE]`, `[OUT_OF_SCOPE_PROJECTS]`.

## Required Loop Contract

Every loop must define:

- Surface
- Trigger
- Connectors/tools
- State/dedupe
- Safe writes
- Forbidden actions
- Prompt
- Output
- Failure mode
- Manual test before enabling

For any code-writing loop, also define:

- Base branch
- Worktree or isolated checkout policy
- Duplicate PR/branch/worktree search
- Verification command or blocker behavior
- PR creation rule
- Baseline or memory update rule

## Edit Rules

- Preserve project-agnostic templates.
- Remove private repo names, local paths, issue numbers, PR URLs, hostnames, secrets, raw logs, and personal details.
- Start live automations paused or disabled unless explicitly asked otherwise.
- Prefer one bounded unit of work per run.
- Make no-op behavior explicit.
- Do not imply that a catalog prompt grants permission to deploy, delete, merge, spend money, contact users, or write production data.

## Finish

Before finishing:

- Run `rg -n "ultracode" codex shared/codex README.md prompts` and ensure only Claude-intentional references remain outside Codex surfaces.
- Run a private/project residue scan if any template was derived from local routines.
- Validate `automation.toml` files when Codex templates changed.
- Report files changed, validation run, and any unresolved setup placeholders.
