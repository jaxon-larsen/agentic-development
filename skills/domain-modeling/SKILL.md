---
name: domain-modeling
description: Keep docs and code in sync. Use for post-implementation sync, full drift audits, restructuring scattered docs into CONTEXT.md, or when code and documentation may disagree.
---

# Domain Modeling

Keep **domain language** (`CONTEXT.md`), **decisions** (ADRs), and **README** aligned with the code — and keep documentation well organized.

For **questions only** (no file edits), use `/grilling`.

Three modes. Say which mode you're in.

| Mode | When | Auto-run? |
|---|---|---|
| **Sync** | After code changes — check what likely became stale | Yes (project `INSTRUCTIONS.md` §5) |
| **Audit** | Full doc/code cross-check — drift, gaps, stale facts | No |
| **Restructure** | Docs are messy — reorganize, extract glossary, dedupe | No — only when user explicitly asks |

**Sync** and **audit** propose minimal truth fixes only. **Restructure** proposes layout changes, file splits, and glossary extraction. Never enter restructure mode from sync auto-trigger.

## Doc scope

- **`CONTEXT.md`** — glossary and index ([CONTEXT-FORMAT.md](./CONTEXT-FORMAT.md))
- **`docs/adr/`** — decisions ([ADR-FORMAT.md](./ADR-FORMAT.md))
- **`README.md`** — human-facing; fix **factual drift** only unless restructure requires link fixes
- **`docs/`** — longer material; indexed from CONTEXT, not duplicated

If `CONTEXT-MAP.md` exists, read it for multi-context monorepos.

---

## Sync mode

1. Identify what changed in code.
2. Check whether CONTEXT, ADRs, README, or indexed `docs/` are affected.
3. If nothing doc-related changed, say so and stop.
4. Propose **minimal patches** — wrong facts, missing terms, broken links. **Wait for approval per item.**
5. When code and docs disagree, ask which is authoritative before editing either side.

Do not propose file splits, merges, or glossary extraction in sync mode.

---

## Audit mode

1. **Inventory** — read `CONTEXT.md`, `README.md`, `docs/` (including `docs/adr/`), scan codebase structure.
2. **Cross-reference** — terms in CONTEXT vs code usage; significant code behavior vs docs.
3. **Classify findings:**
   - **Drift** — code and docs disagree
   - **Gap** — code has it, docs don't
   - **Stale** — docs describe removed behavior
   - **Noise** — docs duplicate CONTEXT or each other
4. **Report** — numbered list with paths. No edits yet.
5. **Propose patches** — minimal truth fixes only. **Wait for approval per item.**
6. **Disagreements** — present both readings; ask which is authoritative.

If findings are mostly structural (duplication, buried definitions, no CONTEXT), suggest the user re-run in **restructure** mode instead of patching piecemeal.

### README rule

Fix wrong facts (commands, paths, behavior). Do not rewrite structure or tone unless in restructure mode or asked.

### ADRs

Offer new ADRs only when: hard to reverse, surprising without context, result of a real trade-off.

---

## Restructure mode

Reorganize documentation for clarity. Reads `.scratch/grill-session.md` if present (output from `/grilling`).

### Goals

- **`CONTEXT.md`** — canonical glossary and index
- **Scattered `docs/`** — dedupe, split, or merge so each file has one job; link from CONTEXT instead of repeating definitions
- **`GLOSSARY.md`** — only when a standalone file is clearer than bloating CONTEXT (e.g. 30+ terms)
- **`docs/adr/`** — extract hard decisions from prose when they meet the ADR bar
- **`README.md`** — fix broken links after moves; preserve human voice

Do not delete user content without approval. Prefer move, split, and index over erase.

### Process

1. **Inventory** — every doc file, its purpose, problems (duplication, buried definitions, missing index).
2. **Propose target layout** — before/after tree; explain what moves where.
3. **Cross-check code** — when extracting terms or behavior, spot-check against code. Ask which side wins on disagreement.
4. **Propose patches** — one logical change per patch. **Wait for approval per patch** before applying.
5. **Finish** — summarize changes. Offer **audit** mode for a full drift pass if not already done.

### Response shape (restructure)

```
## Current problems
1. …

## Proposed layout
…

## Patches
### 1. …
Approve, edit, or skip?
```

---

## Response shape (sync and audit)

```
## Findings
1. [type] …

## Proposed patches
### 1. …
Approve, edit, or skip?
```

Do not apply patches until the user approves each one.
