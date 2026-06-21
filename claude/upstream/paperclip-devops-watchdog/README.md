# Claude Code Paperclip DevOps Watchdog

This folder contains a proposed Claude Code DevOps workflow for keeping a Paperclip server healthy.

Goal: set up a VPS-local watchdog that checks the Paperclip server, performs safe repairs, and escalates anything risky to the operator.

## TL;DR

1. Install Paperclip on your VPS in **`authenticated` mode** — never the
   unauthenticated `local_trusted` default. `npx paperclipai onboard --yes` alone
   selects `local_trusted` (no login; anyone who reaches the server is admin), so
   do not stop there. Onboard for config, then set `deploymentMode=authenticated`,
   generate `BETTER_AUTH_SECRET` (`openssl rand -hex 32`), and expose it deliberately —
   either behind a reverse proxy on a domain, or on a bare public IP with
   `paperclipai allowed-hostname <IP>`. The premium DevOps Kit's
   `01-installer-vps-doctor` playbook performs this end-to-end; this OSS watchdog
   assumes the server is already in `authenticated` mode.
2. Install Claude Code on the same VPS, or on a trusted machine that can SSH into the VPS.
3. Open Claude Code and use this prompt:

```text
Configure yourself as the Paperclip watchdog for this server. Start here: https://raw.githubusercontent.com/MichaelZelbel/paperclip-devops-watchdog/main/AGENT_START.md
```

That starter file contains the safety boundaries, dry-run checks, and local cron recommendations.

## Architecture note

The production watchdog should run **locally on the VPS** via cron or a systemd timer. Claude Code can help generate and test the scripts, but Claude Code `/schedule` and Claude Cloud Routines are remote cloud agents by default; they cannot access local VPS files, local services, or `systemctl --user` unless you explicitly add SSH/MCP/connectors.

Recommended default:

```text
VPS-local cron/systemd timer -> local check/repair scripts -> Telegram alert only when needed
```

See `docs/local-cron-telegram.md` for the recommended setup.

## Quick start

1. Clone or copy this repository onto the machine where Claude Code will run.
2. Make sure Claude Code can reach the Paperclip VPS, either by running directly on the VPS or by SSHing into it.
3. Open this repository in Claude Code.
4. Start with a manual dry run before scheduling anything.

Suggested first prompt for Claude Code:

```text
You are setting up this repository as a Paperclip DevOps watchdog.

Read README.md, CLAUDE.md, and paperclip-devops-runbook.md first.

Then do a manual safe dry run of the hourly quick repair workflow from prompts/hourly-quick-repair.md.

Important boundaries:
- Do not change firewall, SSH, Tailscale, secrets, auth, config, packages, or OS settings.
- Do not delete data.
- Do not update Paperclip yet.
- Only run read-only checks unless the Paperclip server is clearly down.
- If the server is down, you may restart only the user service paperclip.service once, then verify and report.

After the dry run, report:
1. whether Paperclip is healthy,
2. which commands worked,
3. any warnings that should be documented,
4. whether this machine is suitable for scheduled watchdog runs,
5. the exact scheduled task prompt/frequency you recommend.
```

## Manual VPS validation

Before enabling a scheduled watchdog, verify the basic commands on the VPS:

```bash
systemctl --user is-active paperclip.service
systemctl --user status paperclip.service --no-pager
curl -sf http://127.0.0.1:3100/ > /dev/null && echo reachable || echo unreachable
paperclipai doctor
df -h
df -i
free -h
uptime
```

Expected healthy signs:

- `paperclip.service` is `active`.
- `curl -sf http://127.0.0.1:3100/` reports reachable.
- Disk usage is comfortably below warning levels, ideally below 80%.
- Memory and load are not under sustained pressure.

If `paperclipai doctor` reports warnings, review them before giving Claude Code more autonomous permissions. Warnings are not always incidents, but they are useful setup notes.

## Recommended scheduling model

Use local cron or a systemd timer on the VPS as the default watchdog runner.

Recommended local jobs:

1. `quick-check.sh`
   - Frequency: every 5 minutes, or hourly if you prefer less noise.
   - Source prompt/policy: `prompts/hourly-quick-repair.md`.
   - Purpose: fast health check, safe repair, Telegram incident report only when needed.

2. `deep-check.sh`
   - Frequency: every 6 hours.
   - Source prompt/policy: `prompts/six-hour-deep-check.md`.
   - Purpose: deeper Paperclip server, host, embedded Postgres health, update-readiness, disk/RAM/log health.

3. Optional `update-maintenance` run
   - Frequency: weekly or manual.
   - Source prompt/policy: `prompts/update-maintenance.md`.
   - Purpose: safe Paperclip update flow with pre/post smoke tests and explicit rollback boundaries.
   - Do not auto-update unless the operator explicitly approves that policy.

## What about Claude Code `/schedule`?

Do not assume Claude Code scheduled tasks run on the VPS. Claude Code `/schedule` and Cloud Routines are remote agents unless you deliberately provide secure access to the VPS.

Use remote scheduled agents only for advanced setups such as:

- SSH from the remote agent into a restricted watchdog user,
- MCP/connectors that can safely run the local checks,
- a strongly authenticated HTTPS status endpoint.

For most users, local cron + Telegram is simpler, safer, and more reliable.

## Files

- `paperclip-devops-runbook.md` — operational policy and escalation rules.
- `docs/local-cron-telegram.md` — recommended production architecture using local cron/systemd timer plus Telegram alerts.
- `docs/agent-self-config-guardrail.md` — pattern for understanding Paperclip startup failure modes and the `paperclipai doctor` auto-repair boundary.
- `prompts/hourly-quick-repair.md` — main hourly scheduled prompt.
- `prompts/six-hour-deep-check.md` — deep scheduled prompt.
- `prompts/update-maintenance.md` — update prompt.
- `templates/claude-settings.conservative.example.json` — stricter permission template.
- `templates/claude-settings.autonomous-devops.example.json` — more autonomous template after the operator explicitly approves it.
- `templates/desktop-scheduled-task-skill.example.md` — optional Claude Code Desktop scheduled task SKILL.md wrapper.
- `templates/cloud-operator-prompt.example.md` — template for cloud-based operator agents with SSH/MCP access to the VPS.

## Safety principle

Claude Code may repair Paperclip, but it must not silently perform destructive, security-sensitive, or broad system changes. Restarting the service is safe. Deleting unknown files, rotating secrets, changing firewall/SSH, and major updates are not.

## Support this project

This watchdog is free and MIT licensed, and it stays that way.

If it saved you time and you want to support the work, you can buy me a
coffee on Ko-fi. Supporters get my personal extended build, the Paperclip
DevOps Kit. It takes this watchdog and wires it into a full hands-off
setup: it installs Paperclip and Claude Code for you, onboards them, sets
up Telegram alerts, and adds safe nightly upgrades with rollback, cost
monitoring, a security baseline audit, incident-response playbooks, and more.
You end up with a DevOps assistant living on your server that you can just
ask to do things.

[Support on Ko-fi and get the Paperclip DevOps Kit](https://ko-fi.com/michaelc0de)

Either way, thanks for using the watchdog.
