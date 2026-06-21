---
name: nightly-e2e-expansion
description: Add exactly one focused nightly e2e spec
---

Add exactly one focused nightly e2e test for `[PROJECT]`.

Scope:
- Work only in `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:
- Read local agent instructions and existing e2e patterns.
- Find at least three nearby e2e examples before writing a new spec.
- Pick one important untested user path with low fixture/setup risk.
- Add one focused spec or extend one existing spec.
- Do not introduce broad test framework changes.
- Do not require production credentials or live external services.
- Run only the new/changed spec when practical; otherwise explain the skipped validation.
- Commit and open a PR against `[TRUNK]`.

Output:
- Report user path covered, files changed, validation, branch, PR URL, and residual risk.
