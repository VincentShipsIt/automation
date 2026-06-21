# Codex Automations

Examples and tooling for OpenAI Codex app Automations.

## Shared Templates

Use `../shared/codex/` for clean shared templates derived from working Codex automation patterns:

- `../shared/codex/board-hygiene.md`
- `../shared/codex/feature-implementation.md`
- `../shared/codex/sentry-hotfix.md`
- `../shared/codex/content-factory-maintenance.md`
- `../shared/codex/memory.md`

## Clean App Automation Templates

Use `automations/` for app-ready templates derived from local Codex automation patterns:

```text
~/.codex/automations/
```

The template set includes:

- Feature implementation
- Board hygiene
- Sentry hotfix
- Content factory maintenance
- Memory template

## Included Upstreams

### `upstream/awesome-codex-automations/`

Source: https://github.com/onurkanbakirci/awesome-codex-automations

MIT-licensed catalog of Codex automation ideas. The useful examples live under:

```text
upstream/awesome-codex-automations/automations/
```

Notable examples:

- `daily-bug-scan`
- `issue-triage`
- `ci-monitor`
- `test-gap-detection`
- `dependency-sweep`
- `release-notes-drafter`
- `secret-scanner`
- `performance-regression-watch`
- `weekly-engineering-summary`

Most examples are seed prompts, not full production automation configs.

### `upstream/codex-automations-cli/`

Source: https://github.com/vltansky/codex-automations

MIT-licensed CLI for sharing and installing Codex app automations:

```bash
npx -y codex-automations add <source>
npx -y codex-automations share
npx -y codex-automations list
npx -y codex-automations remove
```

Use this if we want to publish a reusable Codex automation pack.

## Codex Automation Shape

Local Codex app automations live under:

```text
~/.codex/automations/<automation-id>/
  automation.toml
  memory.md
```

Create and update live automations through the Codex app or Codex automation tools. Treat this folder as examples and source material, not as the live automation registry.
