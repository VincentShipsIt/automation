# Flaky Test Detector

Identify tests that have inconsistent pass/fail results in CI.

## Grounding Rules

- Analyze CI logs from the past 14 days
- Flag tests that failed then passed without code changes
- Include failure frequency and last failure date
- Link to specific CI runs as evidence
- Categorize by likely cause (timing, external dependency, race condition)
