# Claude Remote Routine Templates

Paste-ready Claude remote Routine prompts.

Remote routines should use connectors such as GitHub and Slack, not local
filesystem assumptions. They are best for board hygiene, triage, digests,
notifications, and metadata updates.

## Templates

- `board-hygiene.md` - keep GitHub issue/project metadata current without local repo access.

## Placeholder Key

- `[PROJECT]` - human-readable project name.
- `[GITHUB_REPO]` - `owner/repo`.
- `[PROJECT_BOARD]` - GitHub project or board name/URL.
- `[STATE_FILE]` - routine memory location or durable state note when available.
- `[OUT_OF_SCOPE_PROJECTS]` - projects this routine must not inspect.
