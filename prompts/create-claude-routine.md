# Create One Claude Routine Or Scheduled Task

Use this prompt in Claude when you want one concrete Claude Routine or Claude Desktop scheduled task draft.

```text
Create one Claude Routine or Claude Desktop scheduled task draft for this project using the VincentShipsIt loops library.

Source library:
- https://github.com/VincentShipsIt/loops
- Prefer local copy if available.

Routine requested:
- Purpose: [FEATURE_IMPLEMENTATION | BACKLOG_PICKUP | BOARD_HYGIENE | TOOL_FIX_PASS | SECURITY_FIX_PASS | REACT_FIX_PASS | DRY_REFACTOR | CLEANUP | REMOTE_VALIDATION | PR_REVIEW | WORKTREE_PRUNE | DOCS_VERIFICATION | BUNDLE_SIZE | E2E_EXPANSION | OTHER]
- Surface preference: [CLAUDE_DESKTOP_SCHEDULED_TASK | CLAUDE_REMOTE_ROUTINE | UNSURE]
- Project: [PROJECT]
- Repository: [GITHUB_REPO]
- Local path: [REPO_PATH]
- Trunk branch: [TRUNK]
- Out of scope: [OUT_OF_SCOPE_PROJECTS]
- Remote worker, if any: [REMOTE_WORKER]

Steps:
1. Read this repo's AGENTS.md, CLAUDE.md, README, package scripts, and existing routine docs.
2. Decide the correct surface before writing the prompt.
3. Choose the closest template from claude/scheduled-tasks/ or shared/claude/.
4. Fill placeholders from verified repo facts.
5. Keep unknowns as [PLACEHOLDER] and list them under Required Setup.
6. Include setup, connectors/tools, trigger, state/dedupe, safe writes, forbidden actions, prompt, output, failure mode, and manual test.
7. Keep destructive actions behind explicit approval.

Do not create or enable the live schedule unless explicitly asked. If live scheduled-task tools are available and the user asks to create it, start disabled or paused when possible.

Output:
- The complete Routine or SKILL.md draft.
- Required setup values still missing.
- Manual test instructions.
- Recommended schedule and model.
```
