# Agent Start: Paperclip Watchdog

Use this file as the starting point when asking Claude Code to configure itself as a watchdog for a Paperclip server.

## Goal

Configure Claude Code as a safe DevOps watchdog for the Paperclip server on this server.

Claude Code should help configure local VPS checks that periodically verify Paperclip health, perform only clearly safe repairs, and escalate risky changes to the operator.

## First steps

1. Read these files in this repository:
   - `README.md`
   - `CLAUDE.md`
   - `paperclip-devops-runbook.md`
   - `docs/local-cron-telegram.md`
   - `prompts/hourly-quick-repair.md`

2. Confirm where Claude Code is running:
   - directly on the Paperclip VPS, or
   - on another trusted machine that can SSH into the VPS.

3. Run a manual dry run of the hourly quick repair workflow.

4. If the dry run succeeds, propose a local cron or systemd timer setup. Do not use Claude Code `/schedule` as the default runner, because scheduled Claude Code agents are remote by default and cannot access this VPS without an explicit connector such as SSH or MCP.

## Safety boundaries

Do not do any of these without explicit operator approval:

- Change firewall, SSH, Tailscale, public exposure, or auth settings.
- Rotate or reveal secrets/tokens.
- Delete data.
- Install/remove OS packages.
- Reboot the server.
- Update Paperclip.
- Change Paperclip config.

Read-only checks are allowed.

If the Paperclip server is clearly down, Claude Code may restart only this user service once:

```bash
systemctl --user restart paperclip.service
```

After restarting, verify the service and report what happened.

## Manual dry-run checks

Run these checks first:

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

If the server looks broken, collect recent logs before restarting:

```bash
journalctl --user -u paperclip.service --since '30 minutes ago' --no-pager
```

## Report back

After the dry run, report:

1. whether Paperclip is healthy,
2. which commands worked,
3. any warnings or blockers,
4. whether this environment is suitable for scheduled watchdog runs,
5. which schedule you recommend.

## Recommended local schedule

Start conservatively with local cron or a systemd timer:

- every 5 minutes, or hourly: quick health check and safe repair workflow,
- every 6 hours: deeper host/Paperclip check,
- weekly or manual: update-maintenance check, but do not auto-update unless explicitly approved.

Use Telegram notifications for meaningful incidents and repairs. Stay quiet when healthy.

Do not create Claude Code `/schedule` tasks unless the operator explicitly chooses an advanced remote-agent architecture with SSH, MCP, or another secure connector.

If everything works reliably, the operator can decide whether to grant more autonomous permissions later.
