---
name: loop-writer
description: Draft, audit, repair, or adapt Codex Automation, Claude Routine, Claude Desktop scheduled task, and shared AI-agent loop templates in the VincentShipsIt/loops repo. Use when the user asks to create a loop, improve a routine or automation prompt, convert an existing workflow into a reusable loop, audit loop safety, or prepare templates under codex/, claude/, shared/, prompts/, or skills/.
---

# Loop Writer

Use this skill to write clean, bounded loop templates for this repository.

## Source Order

1. Read `README.md` and `AGENTS.md`.
2. Read the nearest platform index:
   - Codex local: `codex/README.md`, `codex/automations/README.md`, `codex/automations/local/README.md`, `shared/local/codex/README.md`.
   - Codex remote: `codex/README.md`, `codex/automations/README.md`, `codex/automations/remote/README.md`, `shared/remote/codex/README.md`.
   - Claude local: `claude/README.md`, `claude/routines/README.md`, `claude/routines/local/README.md`, `shared/local/claude/README.md`.
   - Claude remote: `claude/README.md`, `claude/routines/README.md`, `claude/routines/remote/README.md`, `shared/remote/claude/README.md`.
   - Shared prompt only: `shared/README.md`, then the relevant `shared/local/` or `shared/remote/` index.
3. Read `shared/loop-intents.md` when comparing or naming loops across Codex and Claude.
4. For loop-design standards, read `shared/forward-future-loop-library.md`.
5. For stricter authoring criteria, read `references/loop-contract.md`.

When live catalog comparison is needed, use the existing Forward Future skill instead of duplicating it:

```text
npx skills add Forward-Future/loop-library --skill loop-library -g
```

## Surface Decision

- Use `codex/automations/local/` for repo work in the Codex app, especially worktree-based implementation, issue hygiene, Sentry fixes, local validation, and codebase maintenance.
- Use `codex/automations/remote/` only for future connector-safe Codex remote templates.
- Use `claude/routines/local/` for local files, private repos, local tools, and Claude Code `SKILL.md` prompts.
- Use `claude/routines/remote/` for connector/API-driven work. Keep it read-only or metadata-only by default, such as GitHub board updates, triage, digests, and notifications.
- Do not make remote-worker validation a default template. Use local/worktree loops for tests and code execution unless a target project explicitly defines a safe worker contract.
- Use `shared/` for reusable source prompts before creating app-specific files.

## Naming Rules

- Keep names literal and intent-first: `github-issue-implementation`, `recent-commit-review`, `sentry-hotfix`, `board-hygiene`, `dry-repo`.
- Use a `github-` prefix when the loop depends on GitHub issues, pull requests, or project boards.
- Do not use `ultracode` in Codex template names, paths, ids, headings, or descriptions.
- In this repo, `ultracode` means Claude Opus 4.8-level effort. Use it only for Claude routine templates where that effort level is intentional.
- Keep placeholders generic. Universal tokens: `[PROJECT]`, `[REPO_PATH]`, `[GITHUB_REPO]`, `[TRUNK]`,
  `[BRANCH_PREFIX]`, `[STATE_FILE]`, `[OUT_OF_SCOPE_PROJECTS]`. Routine-specific tokens also exist
  (e.g. `[PROJECT_BOARD]`, `[REVIEW_MARKER]`, `[TOOL_COMMAND]`, `[AUTOMATION_ASSIGNEE]`,
  `[ALLOW_SAFE_DELETES]`). Canonical local path = `[REPO_PATH]`; canonical tool invocation =
  `[TOOL_COMMAND]`; multi-repo routines use `[REPO_PATH_1]`/`[GITHUB_REPO_1]` etc. Source of truth:
  `claude/routines/local/README.md` Placeholder Key, `shared/local/claude/README.md` Placeholder Key, and the matching remote README when using a remote surface.

## Ultracode Emit Rule

Claude code-review, code-building, and validation templates that should run at Opus 4.8 effort
MUST emit a bare `ultracode` token as the FIRST line of the prompt body (after frontmatter). Rules:

- The token is `ultracode` with no surrounding backticks, no prefix, no suffix — a single bare word on
  its own line.
- It goes in the prompt body, NOT in the task name, path, or any heading.
- The body token is the trigger; do not encode the execution effort in task names.

Example correct placement:

```text
---
name: recent-commit-review
description: Review recent trunk commits and open a fix PR
---

ultracode

Review new commits on `[GITHUB_REPO]` ...
```

Also set the task's app model to **Claude Opus 4.8**; the body token and the model selection work
together to drive the high-effort run.

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

- Run `rg -n "ultracode" codex shared/local/codex shared/remote/codex README.md prompts` and ensure only Claude-intentional references remain outside Codex surfaces.
- Run a private/project residue scan if any template was derived from local routines.
- Validate `automation.toml` files when Codex templates changed.
- Run `./validate.sh` and ensure it passes.
- Confirm every code/review/validation Claude template emits the bare `ultracode` token as the first prompt-body line.
- Report files changed, validation run, and any unresolved setup placeholders.
