# Automation Templates

Clean templates and examples for recurring Codex automations and Claude routines.

This repo is not an installed automation pack. Use it as a source of prompt bodies, schedules, guardrails, and setup patterns, then create the live automation inside Codex or Claude.

## Pick The Right Surface

Use Codex Automations when the task should run against a repo in the Codex app, especially worktree-based implementation, issue hygiene, Sentry fixes, and recurring codebase maintenance.

Use Claude Desktop scheduled tasks when the task needs local files, local tools, SSH workers, private repos, or Claude Code style `SKILL.md` prompts.

Use Claude remote Routines when the task is mostly connector/API driven: GitHub triage, meeting briefs, reading digests, sentiment summaries, or webhook/API-triggered workflows.

## Fast Start

1. Choose one template:
   - Codex feature work: `codex/automations/feature-implementation/automation.toml`
   - Codex board cleanup: `codex/automations/board-hygiene/automation.toml`
   - Codex Sentry fix loop: `codex/automations/sentry-hotfix/automation.toml`
   - Claude local feature work: `claude/scheduled-tasks/feature-implementation/SKILL.md`
   - Claude remote validation: `claude/scheduled-tasks/continuous-testing-remote/SKILL.md`
   - Claude PR review: `claude/scheduled-tasks/pr-quality-review/SKILL.md`

2. Replace every placeholder:
   - `[PROJECT]`
   - `[REPO_PATH]`
   - `[GITHUB_REPO]`
   - `[PROJECT_BOARD]`
   - `[TRUNK]`
   - `[BRANCH_PREFIX]`
   - `[OUT_OF_SCOPE_PROJECTS]`
   - `[REMOTE_WORKER]` if used

3. Decide the trigger:
   - Schedule for hygiene, validation, summaries, cleanup, and drift detection.
   - Webhook/API trigger for CI failures, new Sentry issues, PR opened, issue labeled ready, or release events.
   - Manual run first for every new routine.

4. Create the live automation:
   - Codex: create a new Automation in the Codex app, copy the prompt/settings from the `automation.toml`, start paused, run once, then enable.
   - Claude Desktop: create a scheduled task and use the matching `SKILL.md` as the prompt body. Configure schedule, model, folder, and permissions in the app.
   - Claude remote Routine: use the shared Claude templates or upstream routine examples, configure only the connectors the routine actually needs, and paste the prompt into the Routine UI.

5. Run it once manually and inspect the output before enabling the schedule.

## Safety Checklist

Before enabling any recurring routine:

- Scope it to one repo, board, project, or connector set.
- Name out-of-scope projects explicitly.
- Add duplicate checks for issues, branches, worktrees, PRs, and prior run state.
- Define the write surface: read-only, issue metadata, branch + PR, or external API writes.
- Put destructive actions behind explicit approval.
- Keep secrets, tokens, `.env` files, request bodies, and private host details out of output.
- Define the final report format.
- Define what "no safe work" means, and make the routine stop cleanly.

## Recommended Stack

For autonomous engineering work, start with these:

- `codex/automations/feature-implementation/automation.toml`
- `codex/automations/board-hygiene/automation.toml`
- `claude/scheduled-tasks/continuous-testing-remote/SKILL.md`
- `claude/scheduled-tasks/pr-quality-review/SKILL.md`
- `claude/scheduled-tasks/worktree-prune/SKILL.md`

For product and operations routines, borrow the structure from:

- `claude/upstream/routine-templates/templates/04-github-pr-triage.md`
- `claude/upstream/routine-templates/templates/05-focus-block-handoff.md`
- `claude/linked-examples/aakashg-claude-routines-pm-pack.md`

## Template Rule

Every strong routine should answer these questions:

```text
Surface:
Trigger:
Connectors/tools:
State/dedupe:
Safe writes:
Forbidden actions:
Prompt:
Output:
Failure mode:
Manual test before enabling:
```

## References And Licensing

Copied upstream repositories with explicit MIT licenses keep their license files under `upstream/`.

Repositories without an explicit license are summarized and linked instead of republished under `linked-examples/`.
