# Shared Claude Routine Templates

These shared templates are sanitized from local Claude Desktop scheduled tasks and
normalized against the public Claude routine examples in `../../claude/upstream/`.

Use them as copy-paste starting points for:

- Claude Desktop local scheduled tasks
- Claude Code remote Routines
- Claude `/loop` maintenance prompts

`ultracode` in Claude template names means Claude Opus 4.8-level effort. Do not carry that suffix into Codex templates. Templates that carry a bare `ultracode` token as the first body line (immediately after the YAML frontmatter's closing `---`) drive Opus 4.8 effort for code review, build, and validation tasks.

## Templates

| Template | Best surface | Use when |
| --- | --- | --- |
| `scheduled-task-base.md` | Desktop scheduled task | You need a safe local task wrapper |
| `feature-implementation.md` | Desktop scheduled task | Ship one ready issue to PR |
| `recent-commit-review-ultracode.md` | Desktop scheduled task | Review recent trunk commits and PR high-confidence fixes |
| `backlog-pickup-ultracode.md` | Desktop scheduled task | Fully autonomous issue pickup |
| `board-hygiene.md` | Desktop or remote Routine | Keep GitHub boards clean |
| `tool-fix-pass.md` | Desktop scheduled task | Run a scanner/tool and PR safe fixes |
| `dry-refactor.md` | Desktop scheduled task | Dedupe one small area |
| `cleanup-simplification.md` | Desktop scheduled task | Reduce LOC without feature deletion |
| `continuous-testing-remote.md` | Desktop scheduled task | Run periodic validation on a remote worker |
| `pr-quality-review.md` | Desktop or remote Routine | Review one open PR strictly |
| `worktree-prune.md` | Desktop scheduled task | Remove only merged clean worktrees |
| `docs-verification.md` | Desktop scheduled task | Verify docs against source |
| `bundle-size-watchdog.md` | Desktop scheduled task | Monitor dependency/build artifact size |
| `nightly-e2e-expansion.md` | Desktop scheduled task | Add exactly one nightly e2e spec |
| `react-fix-pass.md` | Desktop scheduled task | Run one conservative React quality fix pass |
| `security-fix-pass.md` | Desktop scheduled task | Run one conservative security fix pass |
| `repo-hygiene-cleanup.md` | Desktop scheduled task | Safe multi-repo hygiene check with no code changes by default |

## Common Claude Prompt Rules

- Define the surface: remote Routine, Desktop scheduled task, or `/loop`.
- Include setup, connectors/tools, prompt, hard rules, output, and failure modes.
- Remove unused connectors from remote Routines.
- Run manually once before scheduling.
- For Desktop tasks, keep prompt in `~/.claude/scheduled-tasks/<task>/SKILL.md`.
- For remote Routines, keep a Markdown source-of-truth because there is no portable routine file format.
- End autonomous remote Routine prompts with a direct execution instruction.

## Placeholder Key

Universal:
- `[PROJECT]`, `[REPO_PATH]`, `[GITHUB_REPO]`, `[TRUNK]`, `[BRANCH_PREFIX]`, `[STATE_FILE]`, `[OUT_OF_SCOPE_PROJECTS]`.

Remote / worker:
- `[REMOTE_WORKER]`, `[REMOTE_REPO_PATH]`, `[REMOTE_COMMAND_PREFIX]`.

Routine-specific:
- `[PROJECT_BOARD]`, `[REVIEW_MARKER]`, `[TOOL_COMMAND]`, `[AUTOMATION_ASSIGNEE]`, `[ALLOW_SAFE_DELETES]`.
- `[REPO_PATH_1]`/`[REPO_PATH_2]`, `[GITHUB_REPO_1]`/`[GITHUB_REPO_2]` (multi-repo).
- bundle-size-watchdog: `[DEPENDENCY_DIR]`, `[ARTIFACT_PATH_1]`, `[ARTIFACT_PATH_2]`, `[MAX_DEPENDENCY_SIZE]`, `[MAX_PACKAGE_COUNT]`, `[MAX_ARTIFACT_SIZE]`.
- docs-verification: `[DOC_SCOPE]`, `[DOC_FILE_1]`, `[DOC_FILE_2]`, `[DOC_FILE_3]`, `[SOURCE_PATH_1]`, `[SOURCE_PATH_2]`, `[SOURCE_PATH_3]`.

The canonical local-repo-path token is `[REPO_PATH]` (not `[LOCAL_REPO_PATH]` or `[ABSOLUTE_REPO_PATH]`).
The canonical tool-invocation token is `[TOOL_COMMAND]` (not `[TOOL_NAME]`).
