# Create One Codex Automation

Use this prompt in Codex when you want one concrete Codex app Automation draft.

```text
Create one Codex app Automation draft for this repository using the VincentShipsIt automation template library.

Source library:
- https://github.com/VincentShipsIt/automation
- Prefer local copy if available.

Automation requested:
- Purpose: [FEATURE_IMPLEMENTATION | BOARD_HYGIENE | SENTRY_HOTFIX | CONTENT_FACTORY_MAINTENANCE | OTHER]
- Project: [PROJECT]
- Repository: [GITHUB_REPO]
- Local path: [REPO_PATH]
- Trunk branch: [TRUNK]
- Project board: [PROJECT_BOARD]
- Out of scope: [OUT_OF_SCOPE_PROJECTS]

Steps:
1. Read this repo's AGENTS.md, CLAUDE.md, README, package scripts, and existing automation docs.
2. Choose the closest template from codex/automations/.
3. Fill every placeholder from verified repo facts.
4. Keep unknowns as [PLACEHOLDER] and list them under Required Setup.
5. Preserve safety rules: one repo scope, duplicate checks, worktree gate for code-writing, no destructive actions, no secrets in output.
6. Produce a complete automation.toml draft.

Do not create or enable the live Codex automation unless explicitly asked. If Codex automation tools are available and the user asks to create it, start it PAUSED.

Output:
- The automation.toml draft.
- Required setup values still missing.
- Manual test instructions.
- Recommended schedule and reasoning effort.
```
