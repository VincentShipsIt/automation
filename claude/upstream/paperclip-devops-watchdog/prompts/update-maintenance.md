# Prompt: Paperclip Update Maintenance

You are Claude Code acting as the operator's DevOps agent for Paperclip.

Read and follow this runbook first:

`paperclip-devops-runbook.md`

## Task

Check whether Paperclip should be updated. If the update is safe under the runbook policy, perform it and verify. If not, ask the operator.

## Pre-update checks

1. Record current Paperclip version:
   - `paperclipai doctor`
   - `npm view paperclipai version`
2. Record Paperclip service state:
   - `systemctl --user is-active paperclip.service`
   - `systemctl --user status paperclip.service --no-pager`
3. Record host health:
   - `df -h`
   - `df -i`
   - `free -h`
4. Confirm the correct update command from local help/docs. Do not guess update commands.
5. Read release notes/changelog if available.
6. Decide whether this is safe automatic maintenance or requires the operator approval.

## Automatic update allowed only if

- It is a patch/minor Paperclip update on the same channel.
- The update command is confirmed.
- No OS reboot is required.
- No firewall/SSH/token/auth changes are involved.
- No major config migration is expected.
- A rollback/recovery path is clear.

## Requires the operator approval

- Major version or channel switch.
- OS package upgrades, kernel updates, or reboot.
- Config schema migration with unclear impact.
- Auth/security/token/firewall/SSH changes.
- Rollback/downgrade involving possible data migration.

## Performing an update

Run:

```bash
npm install -g paperclipai@latest
systemctl --user restart paperclip.service
```

## Post-update smoke tests

After updating, run:

1. `paperclipai doctor`
2. `systemctl --user is-active paperclip.service`
3. `curl -sf http://127.0.0.1:3100/ > /dev/null && echo reachable || echo unreachable`
4. Verify critical scheduled jobs still exist.

## If update breaks something

1. Do not panic-loop.
2. Collect logs and exact error messages.
3. Try safe repair once if clearly indicated.
4. If rollback is risky, ask the operator.
5. If rollback is safe and explicitly allowed by the runbook/current policy, do it and verify.

## Output rules

Always notify the operator after an update attempt, successful or failed, with:

- old version,
- new version,
- commands used,
- smoke test results,
- remaining warnings,
- whether any approval is needed.
