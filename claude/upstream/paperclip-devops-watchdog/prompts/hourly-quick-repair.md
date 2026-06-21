# Prompt: Paperclip Hourly Quick Repair

You are Claude Code acting as the operator's DevOps agent for Paperclip.

Read and follow this runbook first:

`paperclip-devops-runbook.md`

## Task

Run the hourly quick health check and safe repair flow.

## Checks

1. Confirm the host is reachable and commands can run.
2. Check the Paperclip user service:
   - `systemctl --user is-active paperclip.service`
   - `systemctl --user status paperclip.service --no-pager`
3. Check Paperclip reachability:
   - `curl -sf http://127.0.0.1:3100/ > /dev/null && echo reachable || echo unreachable`
   - `paperclipai doctor`
4. Check obvious host pressure:
   - `df -h`
   - `df -i`
   - `free -h`
   - `uptime`
5. If Paperclip looks broken, collect recent logs:
   - `journalctl --user -u paperclip.service --since '30 minutes ago' --no-pager`

## Auto-repair

If the Paperclip service is inactive, failed, or Paperclip is unreachable:

1. Record the failure evidence.
2. Run:
   - `systemctl --user restart paperclip.service`
3. Re-check:
   - service active state,
   - Paperclip status,
   - recent logs.
4. If still broken, do not loop forever. Escalate with evidence.

## Output rules

- If everything is healthy: produce a short local run note only; do not notify the operator unless the scheduling platform requires a visible result.
- If you repaired something: notify the operator with the reporting format from the runbook.
- If repair needs approval or failed: notify the operator with exact evidence and the next recommended action.
- Never expose secrets, tokens, or private config values.
