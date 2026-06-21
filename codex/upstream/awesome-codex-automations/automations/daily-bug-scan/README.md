# Daily Bug Scan

Scan recent commits (since the last run, or last 24h) for likely bugs and propose minimal fixes.

## Grounding Rules

- Use ONLY concrete repo evidence (commit SHAs, PRs, file paths, diffs, failing tests, CI signals)
- Do NOT invent bugs; if evidence is weak, say so and skip
- Prefer the smallest safe fix; avoid refactors and unrelated cleanup
