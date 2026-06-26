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

| Destination       | Contents                                       |
| ----------------- | ---------------------------------------------- |
| `.cursor/skills/` | All skills (Cursor)                            |
| `.agents/skills/` | All skills (Antigravity)                       |
| `AGENTS.md`       | Agent entry point (skipped if exists)          |
| `INSTRUCTIONS.md` | Coding + doc-sync behavior (skipped if exists) |
| `CONTEXT.md`      | Glossary seed (skipped if exists)              |
| `docs/`           | Documentation folder                           |
| `docs/scratch/`   | Grill session notes (gitignored)               |

**Manual copy** (same result): copy `skills/*` into `.cursor/skills/` and `.agents/skills/`, then copy files from `drop-in/` and `INSTRUCTIONS.md` from the repo root.

### After install

1. Edit `CONTEXT.md` — add your domain terms or run `/enhance-docs` to audit existing docs against the code.
2. Open the project in Cursor or Antigravity — skills load from `.cursor/skills/` or `.agents/skills/`.
3. Try `/grilling` on something fuzzy, then `/enhance-docs` to sync, or `/expand-from-docs` to build out new features.

## Workflow

```
/grilling  →  docs/scratch/grill-session.md
     ↓
/enhance-docs  →  audit doc-code drift, resolve ambiguities
     ↓
/expand-from-docs  →  interview, plan, and execute feature expansion
```

`INSTRUCTIONS.md` runs **sync** automatically after implementation work.

## Skills

Skills live in `skills/`. Each skill is **user-invoked** (`disable-model-invocation: true`) or **model-invoked** (agent can reach when the task fits).

### User-invoked

| Skill                                                                            | Purpose                                                     |
| -------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| [enhance-docs](./skills/enhance-docs/SKILL.md)                                   | Audit doc-code drift, identify ambiguities, and grill to clarify vision |
| [expand-from-docs](./skills/expand-from-docs/SKILL.md)                           | Identify gaps, interview user on next phase, and create execution plans |
| [grilling](./skills/grilling/SKILL.md)                                           | Ask questions; probe docs and code; capture session notes   |
| [handoff](./skills/handoff/SKILL.md)                                             | Compact conversation for another session                    |
| [improve-codebase-architecture](./skills/improve-codebase-architecture/SKILL.md) | Scan codebase for shallowness and refactoring opportunities |
| [prototype](./skills/prototype/SKILL.md)                                         | Build throwaway prototype code                              |

### Model-invoked

| Skill                              | Purpose                                             |
| ---------------------------------- | --------------------------------------------------- |
| [review](./skills/review/SKILL.md) | Two-axis review (Standards vs Spec) of commit diffs |

## Terms

| Term                | Meaning                                                  |
| ------------------- | -------------------------------------------------------- |
| **Skill**           | Folder with `SKILL.md` — agent instructions when invoked |
| **Grilling**        | Questions only; writes `docs/scratch/grill-session.md`   |
| **CONTEXT.md**      | Project glossary and index into `docs/`                  |
| **Decision Log**    | Inline records of key decisions in context/design files  |

## Maintaining this skill library

When adding or editing skills:

- Every skill in `skills/` must appear in this README with a link to its `SKILL.md`.
- Group under **User-invoked** and **Model-invoked**.
- **User-invoked:** set `disable-model-invocation: true`; human-facing `description`.
- **Model-invoked:** omit that flag; model-facing `description` with trigger phrasing.
- User-invoked skills may invoke model-invoked skills, not other user-invoked skills.
- Reach other skills via `/skill` prose, not cross-folder behavior links.
