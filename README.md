# Agent Skills for Engineering Workspaces

A compact library of AI agent skills focused on keeping **code and documentation in sync**.

Works across agent environments (Cursor, Antigravity) that load `SKILL.md` files or slash-command workflows.

General coding behavior lives in [INSTRUCTIONS.md](./INSTRUCTIONS.md) — including post-implementation doc sync.

## Quickstart

1. Copy `skills/` into your agent's skills directory.
2. Copy [INSTRUCTIONS.md](./INSTRUCTIONS.md) into each project (or reference it from your agent config).
3. **`/grilling`** — probe and clarify docs, code, or both (questions only).
4. **`/domain-modeling`** — sync, audit, or restructure docs vs code.

## Workflow

```
/grilling  →  .scratch/grill-session.md
     ↓
/domain-modeling restructure  →  organize docs, build CONTEXT.md
     ↓
/domain-modeling audit or sync  →  verify vs code
```

## Skills

Skills live in flat folders under `skills/`. Each skill has a `SKILL.md`. Every skill below links to its definition.

Each skill is either **user-invoked** (`disable-model-invocation: true` — only you, typing its name) or **model-invoked** (agent can reach when the task fits). See [docs/invocation.md](./docs/invocation.md).

### User-invoked

| Skill | Purpose |
|---|---|
| [grilling](./skills/grilling/SKILL.md) | Ask questions; probe docs and code; capture session notes |
| [handoff](./skills/handoff/SKILL.md) | Compact conversation for another session |

### Model-invoked

| Skill | Purpose |
|---|---|
| [domain-modeling](./skills/domain-modeling/SKILL.md) | Sync, audit, or restructure docs; keep them aligned with code |
| [diagnosing-bugs](./skills/diagnosing-bugs/SKILL.md) | Diagnosis loop for hard bugs and regressions |

### domain-modeling modes

| Mode | Use when |
|---|---|
| **Sync** | After implementation (automatic via INSTRUCTIONS.md) |
| **Audit** | Full doc/code drift check |
| **Restructure** | Messy docs — extract CONTEXT.md, dedupe, reorganize |

## Terms

Vocabulary for **this skill library** (not to be confused with a project's own `CONTEXT.md`):

| Term | Meaning |
|---|---|
| **Skill** | A folder with `SKILL.md` — instructions the agent follows when invoked |
| **Grilling** | Questions only; probes docs and code; writes `.scratch/grill-session.md` |
| **Domain modeling** | Sync, audit, or restructure mode; edits docs with approval |
| **Project CONTEXT.md** | Per-project glossary and index into `docs/`; not a spec |
| **ADR** | Short decision record in `docs/adr/` |

**Doc skill pipeline:** `/grilling` → session notes → `/domain-modeling` restructure → audit/sync. Project CONTEXT indexes into `docs/` without duplicating them. README stays human-facing; agents fix factual drift only (except link fixes after restructure).

## Maintaining this repo

When adding or editing skills:

- Every skill in `skills/` must appear in this README with a link to its `SKILL.md`.
- Group entries under **User-invoked** and **Model-invoked**.
- Skill behavior conventions: [docs/invocation.md](./docs/invocation.md).
