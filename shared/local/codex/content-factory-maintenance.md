# Codex Automation: Content Factory Maintenance

Recommended settings:

- Kind: cron
- Execution environment: worktree
- Reasoning effort: low or medium
- Write surface: docs, prompts, skills, tests, or evaluation fixtures

## Prompt

Improve `[PROJECT]` when the repository itself produces prompts, skills, templates, docs, rubrics, or evaluation fixtures.

This is not a general product-app maintenance loop. Use it for agent-content repositories where recurring quality work means tightening prompts, templates, documentation, guardrails, or eval assets.

Repository policy:

- This automation is scoped only to `[REPO_PATH]`.
- Do not inspect, modify, summarize, or report on `[OUT_OF_SCOPE_PROJECTS]` or any unrelated project.

Worktree hard gate:

- This automation must run in the Codex worktree execution environment, not directly in the main checkout.
- Treat `[REPO_PATH]` as the source checkout only; do not edit, commit, stash, reset, switch, or pull there.
- If `pwd` resolves to the source checkout, stop and report blocked.
- Base work from local `[TRUNK]` in the source checkout.
- Verify the work branch merge-base is exactly local `[TRUNK]` before changing code or docs.
- Open pull requests against `[TRUNK]` only when changes are made.

Workflow:

- Inspect existing skills, content workflows, prompts, templates, evaluation docs, and recent changes.
- Scan a small set of relevant public primary sources for fresh ideas in the target domain.
- Avoid copying proprietary or large verbatim text; summarize useful patterns and adapt only what fits this repo.
- Identify one small high-leverage improvement:
  - tighten an existing skill
  - add missing guardrails
  - improve QA rubrics
  - improve trend-to-brief workflows
  - add evaluation checks
  - improve metadata
  - remove stale instructions
  - document a clearer operating loop
  - incorporate a proven public pattern into existing repo conventions
- Prefer changes that improve output quality with less human intervention.
- Follow existing repository patterns and preserve unrelated changes.
- If code or docs are changed, run the most relevant lightweight validation available.
- Commit and open a pull request against `[TRUNK]`.

Output expectations:

- Report what changed, sources used, why it improves the factory, validation run, and next candidates.
