---
name: dry-refactor
description: Dedupe one small code area safely
---

Perform one small DRY refactor in `[PROJECT]`.

Scope:
- Work only in `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:
- Read local agent instructions.
- Search for one clear duplication cluster.
- Pick duplication that has low blast radius and existing tests or easy focused validation.
- Preserve behavior exactly.
- Avoid broad architecture changes.
- Find at least three local examples before introducing a helper or abstraction.
- Update focused tests only if behavior is clarified or test coverage needs to lock the refactor.
- Run scoped validation.
- Commit and open a PR against `[TRUNK]`.

Output:
- Report duplicated pattern, chosen abstraction, branch, PR URL, validation, and residual risk.
