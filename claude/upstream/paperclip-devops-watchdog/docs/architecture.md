# Architecture

The pattern is intentionally simple:

1. Claude Code runs independently from Paperclip.
2. A scheduled Claude Code task reads this repository's runbook and prompt.
3. It checks the Paperclip host, the `paperclip.service` systemd user unit, embedded
   Postgres health, and update availability.
4. It performs narrowly scoped safe repairs (service restart, `paperclipai doctor --repair`
   for the two auto-repairable checks).
5. It escalates risky changes to a human operator.

This avoids relying on Paperclip's own scheduler to repair Paperclip when the server
itself is down.

## Paperclip server model

Paperclip is a Node.js + React orchestration platform for running AI agent teams. The
deployed stack on the VPS is:

- **Process:** `paperclipai run` managed by a systemd user unit (`paperclip.service`).
- **Database:** Embedded PostgreSQL 17 (via `embedded-postgres`), data at
  `~/.paperclip/instances/default/db/`, internal port 54329 (not exposed externally).
- **Config:** `~/.paperclip/instances/default/config.json` (created by `paperclipai onboard`).
- **Port:** 3100 (HTTP, localhost or LAN depending on `server.bind`).
- **Auth:** `authenticated + private` mode recommended for VPS; requires `BETTER_AUTH_SECRET`
  in `~/.paperclip/instances/default/.env`.

This deployment model has no separate proxy binary, no headless automation runtime, and
no remote debugging protocol endpoint. Health checks are service status + HTTP liveness
probe only (`curl -sf http://127.0.0.1:3100/`).
