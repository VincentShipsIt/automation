# aakashg/claude-routines-and-agents-pm-pack

Source: https://github.com/aakashg/claude-routines-and-agents-pm-pack

This is the strongest public Claude Routines example pack found, but it does not include an explicit license in the repository root at the time reviewed, so it is linked instead of copied.

## What It Contains

- Claude remote Routine examples.
- Claude Cowork/local scheduled task examples.
- Managed Agent examples.
- Sample outputs.
- Security notes.
- Prompt injection mitigation notes.
- Measurement and rollout docs.

## Useful Examples

- `routines/01-competitor-pricing.md`
- `routines/02-morning-meeting-brief.md`
- `routines/03-weekly-user-sentiment.md`
- `cowork-tasks/01-local-transcript-digest.md`
- `cowork-tasks/02-morning-brief-to-local-folder.md`
- `routines/routines-checklist.md`

## Patterns Worth Copying

- Choose the right surface first: remote Routine vs Desktop scheduled task vs Managed Agent.
- Remove unused connectors before scheduling.
- Run manually once before enabling the schedule.
- Define output format explicitly.
- Use a durable state store, such as Notion, when routine runs are stateless.
- Include setup, expected output, failure modes, and tuning notes in each routine doc.

