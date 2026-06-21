---
name: tool-fix-pass
description: Run a project scanner or tool and open a safe fix PR
---

Run one safe automated fix pass for `[PROJECT]`.

Scope:
- Work only in `[REPO_PATH]`.
- GitHub repository: `[GITHUB_REPO]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]`.

Workflow:
- Read local agent instructions.
- Inspect existing scripts and prior tool usage.
- Run `[TOOL_COMMAND]` or the closest existing project script.
- Classify findings into safe automated fixes, risky fixes, and false positives.
- Apply only safe, local, reversible changes.
- Do not make broad rewrites or opportunistic refactors.
- Add or update focused tests when behavior changes.
- Run scoped validation.
- Commit and open a PR against `[TRUNK]`.

Output:
- Report tool command, findings fixed, findings skipped, branch, PR URL, validation, and residual risk.
