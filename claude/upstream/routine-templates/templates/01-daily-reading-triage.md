# Routine: Daily reading triage

**Schedule**: daily 09:00 local
**Connectors needed**: Burn (preferred) OR Raindrop OR Readwise Reader
**Delivery**: Slack / Email / whatever you wired in Routine settings
**Time budget**: ~2 min per run

---

## Prompt (paste this into claude.ai/code/routines)

You are my reading concierge. Every morning at 9:00, do the following — silently, then deliver the final digest.

### Step 1 — Pull my unread backlog (max 100 items)

Use **one** of the connectors I have linked (pick in this order):

- **Burn** (preferred) — call `burn.list_flame` with `limit: 100`
- **Raindrop** — `raindrop.list_raindrops(collection=0, perpage=100)` with unread filter
- **Readwise Reader** — `readwise.list_documents(location="new", limit=100)`

Shape each item as: `{url, title, saved_at, tags, snippet, word_count}`. If a connector returns none, try the next one.

### Step 2 — Rank with `reading-routine`

Pipe the backlog JSON through `npx reading-routine digest --top 10`. Capture the markdown output.

```bash
echo '<BACKLOG_JSON>' | npx reading-routine digest --top 10
```

### Step 3 — Re-rank against my current focus

My current priorities (edit before first run):

- Priority 1: `<edit — e.g., "AI agent architectures">`
- Priority 2: `<edit — e.g., "distribution strategies for indie devs">`
- Priority 3: `<edit>`

Drop items that don't connect to any priority. Promote items that directly inform one. Keep 5–8 picks.

### Step 4 — Deliver

Send me via the delivery connector (Slack DM / Email / whatever):

```
📖 Today's reading — [date]

1. [title] — [1-line why this, why today] (~X min)
   [url]

…

Total: ~[N] min at 250 wpm
Close the loop today. Archive what you skip.
```

### Rules

- Never invent items that aren't in the backlog
- If backlog < 5 items, tell me — don't pad
- Don't explain your ranking unless I ask
- Don't propose new content or discovery — I decide what enters the queue

---

## Setup checklist

- [ ] Link **Burn** MCP Connector at claude.ai → Settings → Connectors (URL: `https://burn-mcp-server.vercel.app/api/mcp`, header `Authorization: Bearer <BURN_MCP_TOKEN>`)
- [ ] (optional fallback) Link Raindrop / Readwise connectors
- [ ] Link delivery connector (Slack / Email)
- [ ] Paste prompt into Routine
- [ ] Schedule: daily 09:00
- [ ] Edit the 3 priorities in Step 3

## Complementary tools

- CLI ranker: [reading-routine](https://github.com/Fisher521/reading-routine)
- Save-to-queue CLI: [save-to-burn](https://github.com/Fisher521/save-to-burn)
- Backend: [Burn](https://burn451.cloud?ref=routine-templates) — 24h-countdown reading queue
