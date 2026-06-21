# Secret Scanner

Scan recent commits for accidentally committed secrets or credentials.

## Grounding Rules

- Check for patterns matching API keys, tokens, passwords, private keys
- Report file path, line number, and commit SHA for each finding
- Do NOT display the actual secret in reports; use redacted previews
- Flag historical commits, not just HEAD
- Prioritize findings by secret type severity
