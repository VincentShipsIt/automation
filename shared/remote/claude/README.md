# Shared Claude Remote Templates

Reusable source prompts for Claude remote Routines.

## Templates

| Template | Use when | Safe writes |
| --- | --- | --- |
| `board-hygiene.md` | Keep GitHub issue/project metadata current without local repo access | GitHub issue/project metadata only |

## Placeholder Key

- `[PROJECT]` - human-readable project name.
- `[GITHUB_REPO]` - `owner/repo`.
- `[PROJECT_BOARD]` - GitHub project or board name/URL.
- `[STATE_FILE]` - routine memory location or durable state note when available.
- `[OUT_OF_SCOPE_PROJECTS]` - projects this routine must not inspect.
