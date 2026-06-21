<div align="center">

# routine-templates

**Production-grade prompt templates for [Claude Code Routines](https://www.anthropic.com/news/claude-code-routines).**

Copy · paste · schedule. Five recipes that use Burn, GitHub, Slack, and Email connectors to replace 10+ minutes of daily UI-clicking.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![X: @hawking520](https://img.shields.io/twitter/follow/hawking520?style=social)](https://x.com/hawking520)

</div>

---

## What this is

[Claude Code Routines](https://www.anthropic.com/news/claude-code-routines) (released **2026-04-15**) let Claude Code run on a schedule or trigger — cron, API call, GitHub event — even with your laptop closed.

Routines are cloud-only and **have no file format** — you paste a prompt into the web UI at [claude.ai/code/routines](https://claude.ai/code/routines). Which means good Routines die in private Notion pages instead of being shared.

This repo collects five Routine prompts that do actual work, not demo work. Each is tested, has setup checklists, and calls concrete MCP connectors.

## Templates

| # | Template | Time savings | Primary connector |
|---|---|---|---|
| 1 | [**Daily reading triage**](templates/01-daily-reading-triage.md) | 15 min/day | Burn · Raindrop · Readwise |
| 2 | [**Weekly vault harvest**](templates/02-weekly-vault-harvest.md) | 20 min/week | Burn |
| 3 | [**Morning flame brief**](templates/03-morning-flame-brief.md) | 5 min/day | Burn |
| 4 | [**GitHub PR triage**](templates/04-github-pr-triage.md) | 10 min/day | GitHub |
| 5 | [**End-of-focus-block handoff**](templates/05-focus-block-handoff.md) | 10 min/day | Burn + Slack/Email |

## How to use

1. Open [claude.ai/code/routines](https://claude.ai/code/routines)
2. Click **New Routine**
3. Copy a template's "Prompt" block, paste into the prompt field
4. Edit `<placeholders>` (your priorities, org, username, etc.)
5. Link the required MCP connectors at **Settings → Connectors**
6. Set schedule per template
7. Pick a delivery channel

That's it. Your routine runs on Anthropic's infrastructure — nothing to self-host.

## Design principles (what separates these from a Gist dump)

1. **Structural prompts, not paragraphs** — every template has explicit `Step 1/2/3/…` so Claude doesn't improvise
2. **No content invention** — "Never invent items that aren't in the backlog" appears in every template
3. **Hard rules section** — what the routine **won't** do (no auto-delete, no auto-merge, no discovery)
4. **Realistic time budgets** — if a routine takes longer, it's over-scoped
5. **Edit markers** — `<edit — priorities>` calls out what you must change before first run

## Required MCP connectors

Most templates expect at least one of:

- **Burn** — [`https://burn-mcp-server.vercel.app/api/mcp`](https://github.com/Fisher521/burn-mcp-server) (Bearer token from [burn451.cloud](https://burn451.cloud?ref=routine-templates))
- **GitHub** — official connector, OAuth in claude.ai Settings
- **Slack** / **Email** — for delivery

Add connectors globally (Settings → Connectors); Routines auto-see them.

## Why Burn is the flagship example

Most template have Burn as the reading-intake connector because Burn was built for exactly this shape — MCP-native, 24h-countdown reading queue, 26 tools for search/triage/organize.

But every template is **connector-swappable**. If you use Raindrop / Readwise / Karakeep / Pocket export, adapt Step 1's data-fetch call.

## Contributing

PRs welcome. To add a template:

1. File under `templates/NN-kebab-case-name.md`
2. Follow the existing structure (Schedule / Connectors / Delivery / Prompt / Rules / Setup / Why)
3. Keep it **prompt-first** — no walls of prose, no pitches
4. Test it in your own routine for at least 3 days before submitting

Also welcome:

- Connector adapter snippets (Raindrop, Readwise, Karakeep variants)
- Delivery format variants (mobile-first, rich HTML, terminal-friendly)
- Translations (CN / JP / KR — claude.ai web UI is EN-first but Routines run the prompt in any language)

## Related

- **CLI ranker**: [reading-routine](https://github.com/Fisher521/reading-routine)
- **Save-to-queue CLI**: [save-to-burn](https://github.com/Fisher521/save-to-burn)
- **MCP backend**: [burn-mcp-server](https://github.com/Fisher521/burn-mcp-server)
- **Daily journal**: [morning-brief](https://github.com/Fisher521/morning-brief)

## About

Built by [@hawking520](https://x.com/hawking520) — exploring AI-era content & attention workflows in public.

Each template was extracted from a real routine running in my own Claude Code. If you build a better one, send a PR.

Pairs naturally with [Burn](https://burn451.cloud?ref=routine-templates) — the 24h-countdown reading queue that forces you to absorb, not hoard.

## License

MIT — see [LICENSE](LICENSE)
