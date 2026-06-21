# Dead Code Hunter

Identify potentially unused code (functions, variables, imports) in recently modified files.

## Grounding Rules

- Only flag code as "dead" if there are zero references found in the codebase
- Provide the search evidence for each finding
- Exclude test files from "dead code" candidates
- Mark findings as "confident" or "needs review" based on evidence strength
