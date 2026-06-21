# Guardrail: Paperclip startup failure modes and `paperclipai doctor` auto-repair boundary

Paperclip does not expose a self-modifiable agent config allowlist. Instead, the server
can fail to start or operate correctly due to misconfigured state — a missing secrets
key, a misconfigured deployment mode, or a port conflict. `paperclipai doctor` detects
these conditions and, for two of them, can repair them automatically when invoked with
`--repair`. This document describes each check, its `canRepair` classification, and the
operator action required when automatic repair is unavailable or insufficient.

## The 9-check doctor matrix

`paperclipai doctor` runs exactly 9 checks in the sequence below. Each row shows whether
the check can be auto-repaired with `--repair` and what the operator must do when it
cannot.

| # | Check | Status returned | canRepair | What `--repair` does / manual operator action |
|---|-------|-----------------|-----------|-----------------------------------------------|
| 1 | **Config file** _(gate check)_ | `fail` | `false` | Missing: run `paperclipai onboard`. Corrupt (JSON parse error): `paperclipai configure --section database` or `paperclipai onboard` to recreate. If this check fails, checks #2–#9 are skipped. |
| 2 | **Deployment / auth mode** | `fail` | `false` | Sub-cases: (a) `local_trusted` bound non-loopback → `paperclipai configure --section server`; (b) `authenticated` mode missing `BETTER_AUTH_SECRET` → set env var (manual only — not auto-generated); (c) `public` exposure missing `auth.publicBaseUrl` → `paperclipai configure --section server`; (d) non-HTTPS public URL → fix URL. |
| 3 | **Agent JWT secret** | `fail` | `true` (on fail) | `--repair` generates `PAPERCLIP_AGENT_JWT_SECRET` into `~/.paperclip/instances/default/.env` via `ensureAgentJwtSecret()`. Manual alternative: `echo "PAPERCLIP_AGENT_JWT_SECRET=$(openssl rand -hex 32)" >> ~/.paperclip/instances/default/.env` |
| 4 | **Secrets adapter** | `warn` (missing key file) | `true` (on warn) | `--repair` creates `secrets/master.key` with `randomBytes(32)` at mode 0600. If key material is corrupt: delete file and re-run `paperclipai doctor --repair`. If unreadable (permissions): `chmod 600 ~/.paperclip/instances/default/secrets/master.key`. |
| 5 | **Storage** | `fail` | `false` | `local_disk`: check write permissions on `~/.paperclip/instances/default/data/storage/`. `s3`: verify credentials and endpoint manually. |
| 6 | **Database** | `fail` | `false` (embedded dir auto-created inline) | Embedded Postgres: data dir is auto-created by `fs.mkdirSync` if missing — no operator action needed. If port 54329 is in conflict: free the port. `postgres` mode: fix connection string via `paperclipai configure --section database`. |
| 7 | **LLM provider** | `warn` (network) / `fail` (401) | `false` | Optional check; non-blocking on network failure. 401 from API: `paperclipai configure --section llm` to update key. |
| 8 | **Log directory** | `fail` (if dir exists but unwritable) | `false` (dir auto-created inline) | Log dir is auto-created by `fs.mkdirSync` if missing — no operator action needed. Fails only if the dir exists but is not writable: `chmod`/`chown` `~/.paperclip/instances/default/logs/`. |
| 9 | **Server port** | `warn` | `false` | Returns `warn` (not `fail`) when port 3100 is in use. The server will fail to bind when it tries to start. Operator action: `lsof -i :3100` to identify the conflicting process, then stop it or change `server.port` via `paperclipai configure --section server`. |

## Key distinctions

**`canRepair: true` requires `--repair`.**
Without the `--repair` flag, `paperclipai doctor` prints a `repairHint` for any failing
check but does not auto-fix anything. Always invoke `paperclipai doctor --repair` when
you want the two auto-repairable checks (#3 and #4) to actually repair themselves.

**Config file is a gate check.**
If check #1 fails — missing or corrupt `config.json` — `doctor` exits immediately and
checks #2–#9 are skipped. A missing or corrupt
`~/.paperclip/instances/default/config.json` is the highest-severity failure mode; the
server cannot start without it.

**Port 3100 conflict returns `warn`, not `fail`.**
`paperclipai doctor` will complete and report success even when port 3100 is occupied.
The server itself will fail to bind at start time. Use `lsof -i :3100` to diagnose.

**`BETTER_AUTH_SECRET` is NOT auto-generated.**
`paperclipai onboard` and `doctor --repair` do NOT create `BETTER_AUTH_SECRET`. It is
a manual operator step. Check #2 returns `fail` if `authenticated` mode is configured
without it. Generate and set it once:

```bash
echo "BETTER_AUTH_SECRET=$(openssl rand -hex 32)" >> ~/.paperclip/instances/default/.env
```

**`PAPERCLIP_AGENT_JWT_SECRET` IS auto-generated.**
Both `paperclipai onboard` and `paperclipai doctor --repair` generate
`PAPERCLIP_AGENT_JWT_SECRET` automatically via `ensureAgentJwtSecret()`. You do not
need to set it manually unless you are recovering from a filesystem issue without access
to `doctor`.

**Database and log directories are auto-created inline.**
For both check #6 (embedded-postgres data dir) and check #8 (log dir), `doctor` calls
`fs.mkdirSync` directly if the directory is missing. This is transparent — no operator
action is needed for a fresh install. The `canRepair: false` flag on these checks refers
only to their formal repair path, not to directory creation.

## Detection and scheduling

Run `paperclipai doctor --repair` on a schedule so that transient filesystem issues
(e.g. a server migration or a botched backup restore) are detected and repaired before
the next login attempt fails:

```
*/5 * * * * /usr/bin/paperclipai doctor --repair >> ~/.paperclip/watchdog-doctor.log 2>&1
```

A 5-minute interval is appropriate. An hourly check is too slow for secrets-key loss
after a filesystem event: the server may fail to authenticate agents for up to an hour
before the watchdog fires.

The cron entry should be silent on healthy runs (the command exits 0 and produces no
output when all checks pass). Alert the operator only when `doctor` returns a non-zero
exit code or when a repair was performed.

## Summary: only two checks are auto-repairable

Of the 9 checks in `paperclipai doctor`:

- **Check #3 (Agent JWT secret)** and **Check #4 (Secrets adapter — missing key file)**
  are the only `canRepair: true` entries. All other checks require manual operator
  intervention.
- Checks #6 and #8 auto-create directories inline but are not formally `canRepair: true`.
- Checks #1, #2, #5, #7, and #9 are always manual.

For startup troubleshooting, see `docs/troubleshooting.md`.
