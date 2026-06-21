# Contributing to Awesome Codex Automations

Thank you for your interest in contributing! This document provides guidelines for contributing to this awesome list.

## Guidelines

### General Requirements

1. **One automation per pull request** - Makes review easier
2. **Search before adding** - Check if a similar automation already exists
3. **Follow the format** - Use the standard automation template
4. **Test your automation** - Ensure the grounding rules are practical and testable

### Automation Quality Criteria

A good automation should be:

- **Specific**: Clear about what it does and doesn't do
- **Grounded**: Rules that prevent hallucination and ensure reliability
- **Actionable**: Produces useful output that teams can act on
- **Scoped**: Focused on a single concern

### Automation Template

```markdown
#### Automation Title

> One-line description of what the automation does.

**Grounding rules:**
- Rule about required evidence/sources
- Rule about what NOT to do
- Rule about output format/constraints
- Rule about scope limitations
```

### Grounding Rules Best Practices

Good grounding rules:

- ✅ Require concrete evidence (commit SHAs, file paths, line numbers)
- ✅ Specify what the automation should NOT do
- ✅ Define clear boundaries and scope
- ✅ Prevent speculation and invention
- ✅ Set confidence thresholds

Avoid:

- ❌ Vague instructions ("improve code quality")
- ❌ Unbounded scope ("analyze everything")
- ❌ Missing evidence requirements
- ❌ Auto-fix without human review

### Categories

Add automations to the most appropriate existing category:

- **Code Quality**: Bug detection, code smells, dead code
- **Team Communication**: Standups, changelogs, PR management
- **Documentation**: README, API docs, guides
- **Dependency Management**: Updates, licenses, unused deps
- **Security**: Secrets, CVEs, permissions
- **Testing**: Coverage, flaky tests, test gaps
- **Release Management**: Release notes, versioning, migrations

If your automation doesn't fit any category, propose a new one in your PR description.

## Pull Request Process

1. Fork the repository
2. Create a new branch (`git checkout -b add-automation-name`)
3. Add your automation following the template
4. Commit with a clear message (`git commit -m "Add: Automation Name"`)
5. Push to your fork (`git push origin add-automation-name`)
6. Open a pull request

### PR Title Format

- `Add: Automation Name` - For new automations
- `Update: Automation Name` - For improvements to existing automations
- `Fix: Description` - For typos, broken links, etc.

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help maintain the quality of the list

## Questions?

Open an issue if you have questions about contributing or need clarification on the guidelines.
