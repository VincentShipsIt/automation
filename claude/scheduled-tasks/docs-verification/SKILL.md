---
name: docs-verification
description: Verify docs against source and open a correction PR
---

ultracode

Verify documentation for `[PROJECT]` against the current source of truth.

Scope:
- Work only in `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:
- Read local agent instructions and docs contribution rules.
- Pick one docs area with clear source-backed verification.
- Compare docs against code, configs, scripts, commands, APIs, or schemas.
- Fix stale, misleading, or missing instructions.
- Do not invent product behavior.
- Keep edits minimal and source-backed.
- Run docs formatting or link checks when available.
- Commit and open a PR against `[TRUNK]`.

Output:
- Report docs verified, source evidence, changes made, branch, PR URL, validation, and uncertain items.
