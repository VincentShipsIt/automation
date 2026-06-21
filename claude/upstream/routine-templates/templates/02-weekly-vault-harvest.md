# Routine: Weekly vault harvest

**Schedule**: Sunday 20:00 local
**Connectors needed**: Burn (for Spark → Vault promotion)
**Delivery**: Slack / Email
**Time budget**: ~3 min per run

---

## Prompt

Weekly sweep — promote what survived the week, burn what didn't.

### Step 1 — Fetch this week's Sparks (items I read and kept for 7 days)

Call `burn.list_sparks` with `limit: 50`, filter by `created_at >= <last Sunday>`.

Shape: `{id, url, title, tags, notes, highlights}`.

### Step 2 — Score for Vault-worthiness

For each Spark, score 0–5 on these axes:

- **Still relevant** (is this still useful 7 days later, or dated hot-take?)
- **Actionable** (can I apply something from this to work I'm doing?)
- **Quotable** (will I cite this in conversations / writing?)
- **Rare insight** (hard to rederive — worth preserving vs easy to re-find)

Sum. Items scoring ≥ 12 → Vault. Items 6–11 → leave as Spark. Items ≤ 5 → recommend burn.

### Step 3 — Execute promotions

For each Vault-worthy item, call `burn.move_spark_to_vault` with a concise category (e.g. "ai-agents", "distribution", "systems").

For burn-worthy items, suggest — **don't auto-delete**. Humans-in-the-loop for destructive ops.

### Step 4 — Deliver weekly brief

```
🗄️ Vault harvest — week of [date]

Promoted to Vault ([N] items)
- [title] → category `[cat]` — [1-line why]
…

Suggested to burn ([M] items)
- [title] — [1-line why this didn't age]

Left as Spark ([P] items)
```

### Rules

- Never auto-delete. Destructive ops require human confirm.
- If < 3 Sparks this week, say so — don't pad
- Category names stay short, single-hyphen kebab-case
- Don't re-categorize existing Vault items without ask

---

## Setup checklist

- [ ] Burn MCP Connector linked
- [ ] Delivery connector linked
- [ ] Schedule: Sunday 20:00 local
- [ ] Review the 4 scoring axes — edit if your axes differ

## Why this matters

The 24h Flame timer handles fresh intake. Sparks (read-and-kept) can linger. Without a weekly harvest, even the Spark layer becomes another backlog. This routine forces the Spark → Vault commit vs let-it-fade decision.
