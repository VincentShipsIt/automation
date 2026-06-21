# Routine: GitHub PR triage

**Schedule**: weekday 17:00 local
**Connectors needed**: GitHub
**Delivery**: Slack / Email
**Time budget**: ~2 min per run

---

## Prompt

End-of-day: tell me which open PRs on my repos need me.

### Step 1 — List PRs needing me

Call GitHub connector `pr.list` filtered to `is:open review-requested:<me> OR (is:open author:<me> review-status:approved)`.

Also include: PRs in `<my-primary-org>` where I was requested as reviewer and have not reviewed.

For each: `{number, repo, title, author, url, created_at, last_comment_at, labels}`.

### Step 2 — Tag each PR with a state

- 🟥 **Blocked on me** — reviewer requested, I haven't reviewed, > 24h old
- 🟧 **Ready to merge** — my PR, approved, CI green, still open
- 🟦 **Needs attention** — my PR, requested changes, I haven't pushed updates > 48h
- 🟩 **Fresh** — < 24h old, low urgency

### Step 3 — Deliver brief

```
🧑‍💻 PR inbox — [date]

🟥 Blocked on me ([N])
- #123 [title] — @author — opened [Nd ago]
  [url]

🟧 Ready to merge ([M])
- #456 [title] — CI green since [date]

🟦 Needs my updates ([P])
- #789 [title] — requested changes [Nd ago]

🟩 Fresh ([Q])
(titles only, for awareness)
```

### Rules

- Don't auto-merge, auto-approve, or auto-comment on any PR
- Skip draft PRs
- Cap each section at 8 entries; say "+X more" if truncated
- If all sections empty: "📭 PR inbox clean."

---

## Setup checklist

- [ ] GitHub MCP connector linked at claude.ai → Settings → Connectors
- [ ] Delivery connector linked
- [ ] Schedule: weekdays 17:00 local
- [ ] Edit `<my-primary-org>` in Step 1 to your actual org

## Why this matters

Notifications don't capture "waiting on me" well. This routine reads the real state, not the notification inbox (which goes stale).
