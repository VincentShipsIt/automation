---
name: cleanup-simplification
description: Reduce complexity or dead weight without changing behavior
---

ultracode

Make one small cleanup pass in `[PROJECT]`.

Scope:
- Work only in `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:
- Read local agent instructions.
- Identify one safe cleanup target: dead code, redundant branches, stale comments, duplicate config, unnecessary indirection, or obviously unreachable code.
- Do not remove features, public APIs, migrations, or compatibility code unless evidence proves they are unused.
- Keep behavior unchanged.
- Run focused validation.
- Commit and open a PR against `[TRUNK]`.

Output:
- Report cleanup target, evidence it was safe, branch, PR URL, validation, and residual risk.
