# Agent Skills for Engineering Workspaces

A compact library of AI agent skills focused on keeping **code and documentation in sync**.

Works across Cursor and Antigravity (`SKILL.md` + slash commands).

## Drop into a project

From this repo, run the installer against any codebase:

```bash
# macOS / Linux
./drop-in/install.sh /path/to/your-project

# Windows
.\drop-in\install.ps1 -Target C:\path\to\your-project
```

**What it installs:**

| Destination | Contents |
|---|---|
| `.cursor/skills/` | All skills (Cursor) |
| `.agents/skills/` | All skills (Antigravity) |
| `AGENTS.md` | Agent entry point (skipped if exists) |
| `INSTRUCTIONS.md` | Coding + doc-sync behavior (skipped if exists) |
| `CONTEXT.md` | Glossary seed (skipped if exists) |
| `docs/adr/` | ADR folder |
| `.scratch/` | Grill session notes (gitignored) |

**Manual copy** (same result): copy `skills/*` into `.cursor/skills/` and `.agents/skills/`, then copy files from `drop-in/` and `INSTRUCTIONS.md` from the repo root.

### After install

1. Edit `CONTEXT.md` — add your domain terms or run `/domain-modeling` restructure on existing docs.
2. Open the project in Cursor or Antigravity — skills load from `.cursor/skills/` or `.agents/skills/`.
3. Try `/grilling` on something fuzzy, then `/domain-modeling` restructure or audit.

## Workflow

```
/grilling  →  .scratch/grill-session.md
     ↓
/domain-modeling restructure  →  organize docs, build CONTEXT.md
     ↓
/domain-modeling audit or sync  →  verify vs code
```

`INSTRUCTIONS.md` runs **sync** automatically after implementation work.

## Skills

Skills live in `skills/`. Each skill is **user-invoked** (`disable-model-invocation: true`) or **model-invoked** (agent can reach when the task fits).

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

| Term | Meaning |
|---|---|
| **Skill** | Folder with `SKILL.md` — agent instructions when invoked |
| **Grilling** | Questions only; writes `.scratch/grill-session.md` |
| **Domain modeling** | Sync, audit, or restructure; edits docs with approval |
| **CONTEXT.md** | Project glossary and index into `docs/` |
| **ADR** | Decision record in `docs/adr/` |

## Maintaining this skill library

When adding or editing skills:

- Every skill in `skills/` must appear in this README with a link to its `SKILL.md`.
- Group under **User-invoked** and **Model-invoked**.
- **User-invoked:** set `disable-model-invocation: true`; human-facing `description`.
- **Model-invoked:** omit that flag; model-facing `description` with trigger phrasing.
- User-invoked skills may invoke model-invoked skills, not other user-invoked skills.
- Reach other skills via `/skill` prose, not cross-folder behavior links.
