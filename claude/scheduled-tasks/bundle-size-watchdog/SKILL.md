---
name: bundle-size-watchdog
description: Monitor dependency and build artifact size drift
---

Check bundle, dependency, or build artifact size drift for `[PROJECT]`.

Scope:
- Work only in `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:
- Read local agent instructions.
- Inspect existing package scripts and size-report tooling.
- Run the lightest available size or dependency inspection command.
- Do not install new dependencies unless the repo already requires it.
- Do not run full production builds locally unless explicitly allowed.
- Identify meaningful regressions, stale artifacts, or easy wins.
- If a safe cleanup exists, open a small PR.
- Otherwise report findings only.

Output:
- Report commands run, size deltas/findings, safe fixes made, branch/PR if created, skipped heavy work, and next actions.
