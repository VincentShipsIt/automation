# Routine: End-of-focus-block handoff

**Schedule**: daily 18:30 local (or whenever your deep-work block ends)
**Connectors needed**: Burn (for capturing refs found during the block) + Slack/Email for delivery
**Delivery**: self (a note to future-you)
**Time budget**: ~2 min per run

---

## Prompt

Write a handoff note from present-me to tomorrow-me. No summary — just the 3 things that matter.

### Step 1 — Pull today's Burn activity

Call `burn.list_sparks` filtered to `created_at >= today 00:00` — gives me what I promoted from Flame → Spark (= things I actively read today).

Call `burn.list_flame` with the same filter — gives me what I saved new today.

### Step 2 — Write a 3-part handoff

```
📌 Handoff · [date]

1. **What I shipped today** (concrete artifacts — code, docs, decisions):
   - <list 2–4 items — not chores, just things that would show up in a PR / commit / published doc>

2. **Loose threads** (the "if I don't write it down, I'll forget by tomorrow" items):
   - <list 2–3 — be honest, include half-finished thinking>

3. **Tomorrow's one thing**
   <single sentence: the ONE thing that unlocks the most. Not a list.>
```

### Step 3 — Append references

From Step 1's Burn activity, pick the 3 most likely to matter tomorrow. Paste as links under a `References` heading.

### Step 4 — Deliver

Post to my own Slack DM (or email myself). Subject: `Handoff [date]`.

### Rules

- The handoff is **for me**, not for others — skip polish, keep informal
- Never include items from other people's work (no "team shipped X")
- "Tomorrow's one thing" is ONE thing — if tempted to add a second, cut both and think harder
- If today was light (no sparks, no flames, no output), say so — don't manufacture a handoff

---

## Setup checklist

- [ ] Burn MCP Connector linked
- [ ] Delivery = your own Slack DM or email (configure in Routine)
- [ ] Schedule: daily 18:30 (tune to your block boundary)
- [ ] Rename to "End of sprint" if you do sprints not daily blocks

## Variation: sprint handoff

Change schedule to Friday 17:00, widen Step 1 to `>= Monday 00:00`, keep structure. Weekly version.
