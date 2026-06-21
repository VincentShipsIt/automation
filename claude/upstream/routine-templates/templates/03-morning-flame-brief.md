# Routine: Morning flame brief

**Schedule**: daily 08:00 local
**Connectors needed**: Burn
**Delivery**: Slack / Email / Telegram
**Time budget**: ~1 min per run

---

## Prompt

Before my day starts, tell me what's about to burn.

### Step 1 — Fetch Flame items expiring today

Call `burn.list_flame` with `limit: 100` and compute items whose `expires_at` is within the next 14 hours.

### Step 2 — Group and summarize

Group by tag (or by domain if untagged). For each group, pick the most-likely-worth-reading item (prefer: high word_count, explicit tags, recent saves).

### Step 3 — Deliver compact brief

```
🔥 Burning today — [N] items expire before tonight

Top picks per topic:
• [tag] — [title] ([X min read])
  [url]
• …

Low-effort burns ([M] items):
(list titles only, no links)

Action: triage before 10 AM or they're ash.
```

### Rules

- Top picks: at most 5. Be ruthless — if all items are low-value, say so
- Low-effort burns: list them so I can swipe-to-burn in the app later
- Don't open URLs or fetch content — stay within the MCP data
- If 0 items expire today, send: "✨ No burns today. Your queue is clean."

---

## Setup checklist

- [ ] Burn MCP Connector linked
- [ ] Delivery connector linked
- [ ] Schedule: daily 08:00 local (adjust to before your coffee)
- [ ] Time zone: verify `expires_at` interpretation matches your local TZ

## Variation: afternoon flame check

Change schedule to `14:00`, rewrite Step 1 to `expires_at within 6 hours`, keep everything else. Second-chance alert for morning-skipped items.
