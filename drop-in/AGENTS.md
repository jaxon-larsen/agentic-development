# Agent instructions

Read [INSTRUCTIONS.md](./INSTRUCTIONS.md) for coding behavior, verification, and post-implementation doc sync.

## Project documentation

| File | Purpose |
|---|---|
| [CONTEXT.md](./CONTEXT.md) | Domain glossary and index into `docs/` |
| `docs/adr/` | Architectural decision records |
| `README.md` | Human-facing setup and usage |
| `.scratch/grill-session.md` | Optional notes from `/grilling` (gitignored) |

## Skills

Install the skill library into your agent (once globally, or per-project — see the skill library README). Then use:

| Command | When |
|---|---|
| `/grilling` | Clarify docs, code, or gaps — questions only |
| `/domain-modeling` | Sync, audit, or restructure docs vs code |
| `/handoff` | Hand off to another session |
| `/diagnosing-bugs` | Hard bugs or regressions |

**Typical doc workflow:** `/grilling` → `/domain-modeling` restructure → `/domain-modeling` audit or sync.
