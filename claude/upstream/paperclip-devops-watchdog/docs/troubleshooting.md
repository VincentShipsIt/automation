# Troubleshooting

## Claude Code terminal connection closed unexpectedly

If the terminal running Claude Code disconnects, first determine what failed:

1. Did the VPS stay healthy?
   - `uptime`
   - `free -h`
   - `df -h`
   - `journalctl -k --since '2 hours ago' --no-pager | grep -Ei 'oom|killed process|segfault|out of memory'`

2. Did SSH or the web terminal disconnect?
   - `journalctl -u ssh --since '2 hours ago' --no-pager`
   - If using a provider web console, retry over normal SSH. Web consoles are more fragile than SSH.

3. Did Claude Code exit, or is it still running?
   - `ps aux | grep -Ei '[c]laude|[n]ode.*claude'`

4. Did Paperclip itself stay healthy?
   - `systemctl --user is-active paperclip.service`
   - `curl -sf http://127.0.0.1:3100/ > /dev/null && echo reachable || echo unreachable`
   - `paperclipai doctor`

Recommended prevention:

- Run Claude Code inside `tmux` or `screen`, not directly in a provider web terminal.
- Prefer logging in as the Paperclip OS user instead of switching users mid-session.
- Ensure `paperclipai` is on that user's `PATH` (globally installed via `npm install -g paperclipai`).
- If using a user service from another account, set `XDG_RUNTIME_DIR=/run/user/<uid>` correctly.

Example tmux flow:

```bash
tmux new -s paperclip-watchdog
# run Claude Code inside tmux

# if disconnected later:
tmux attach -t paperclip-watchdog
```

If Claude Code lost its context, restart the dry run from `AGENT_START.md` and mention what step disconnected.

## Disk is full

- Check `df -h` and `df -i`.
- Identify large logs/caches read-only first.
- Vacuum logs only when they are clearly the cause.
- Never delete unknown Paperclip state, config, embedded Postgres data, or secrets.

## Paperclip service is down

- `systemctl --user is-active paperclip.service`
- `journalctl --user -u paperclip.service --since '30 minutes ago' --no-pager`
- `curl -sf http://127.0.0.1:3100/ > /dev/null && echo reachable || echo unreachable`
- Restart: `systemctl --user restart paperclip.service`
- After restart, re-check reachability and run `paperclipai doctor`.
- Escalate if service fails to stay active after one restart attempt.

## Paperclip server won't start — port 3100 conflict

Symptom: `paperclip.service` enters `failed` state immediately at start; `journalctl`
shows `EADDRINUSE :3100`.

```bash
lsof -i :3100
```

Identify the conflicting process and stop it, or change `server.port` in
`~/.paperclip/instances/default/config.json` via `paperclipai configure --section server`.

Note: `paperclipai doctor` returns `warn` (not `fail`) for a port conflict — the server
can still run `doctor` even when port 3100 is unavailable.

## `paperclipai doctor` returns JWT secret failure

Symptom: doctor check #3 fails with `status: fail` on "Agent JWT secret".

Repair with `paperclipai doctor --repair` (auto-generates `PAPERCLIP_AGENT_JWT_SECRET`).
Manual alternative:

```bash
echo "PAPERCLIP_AGENT_JWT_SECRET=$(openssl rand -hex 32)" >> ~/.paperclip/instances/default/.env
```

## `paperclipai doctor` returns config file missing or corrupt

Symptom: doctor exits immediately with `status: fail` on "Config file" (gate check —
no subsequent checks run).

- If missing: `paperclipai onboard` to recreate.
- If corrupt (JSON parse error): `paperclipai onboard` or
  `paperclipai configure --section database` to rebuild specific sections.

This is the highest-severity failure mode — the server cannot start without a valid
`~/.paperclip/instances/default/config.json`.
