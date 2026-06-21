# Unused Dependency Finder

Identify dependencies declared in package manifests but not imported in code.

## Grounding Rules

- Scan all source files for import/require statements
- Cross-reference against declared dependencies
- Exclude devDependencies used only in build/test scripts
- Mark confidence level for each finding
- Check for dynamic imports before flagging
