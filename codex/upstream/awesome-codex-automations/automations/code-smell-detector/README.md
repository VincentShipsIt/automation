# Code Smell Detector

Analyze recent changes for code smells and anti-patterns, suggesting improvements.

## Grounding Rules

- Focus on changes from the last 7 days or since last run
- Categorize findings by severity (critical, warning, info)
- Link each finding to specific file:line references
- Do NOT suggest changes that would alter functionality
- Prioritize maintainability over stylistic preferences
