# API Documentation Drift

Detect mismatches between API documentation and actual endpoint implementations.

## Grounding Rules

- Compare OpenAPI/Swagger specs against route handlers
- List specific endpoints with discrepancies
- Include expected vs actual for each finding
- Do NOT auto-fix; report only
