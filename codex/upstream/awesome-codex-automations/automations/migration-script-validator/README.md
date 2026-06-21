# Migration Script Validator

Verify database/schema migration scripts are reversible and consistent.

## Grounding Rules

- Check that each "up" migration has a corresponding "down"
- Verify migration order matches timestamp/sequence
- Flag migrations that modify the same table/column
- Test migrations against schema snapshots if available
- Do NOT run migrations; analyze only
