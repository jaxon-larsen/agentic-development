---
name: spec-architect
description: Interrogate project decisions from foundations to tight contracts, iteratively updating project docs until stopped.
disable-model-invocation: true
---

# Spec Architect

Use this skill when the user asks for a spec interview or names it explicitly.

Conducts a recursive, contract-tightening interview loop with the user. Progressively probes architectural, technical, and operational decisions—starting broad and narrowing to edge-case contracts—while writing living, evergreen updates to project documentation after each round. The evolving docs hold the project design; `expand-from-docs` turns those docs into a phased implementation plan later.

---

## Workflow Instructions

### 1. Intelligent Context Discovery

Before initiating questions:
- Locate project documentation and memory roots dynamically using relative paths:
  - Documentation directory (typically `docs/` or repository docs root).
  - Agent memory directory (typically `.agents/memory/`, such as `context.md` or `tasks.md`).
- Scan existing markdown files and source code to map current decisions, interfaces, and open gaps. Use the project's glossary and respect existing architecture decisions.
- Separate established decisions, assumptions, contradictions, and unresolved choices. Identify the frontier of unresolved foundational choices; do not ask for facts the repository already establishes.

### 2. Progressive Interview Loop (2–3 Questions per Round)

Structure questions hierarchically across rounds, tightening the contract as decisions solidify. Start with the most important decisions that will affect many future plans. As those are resolved, you may probe deeper into more specific areas as the docs are improved.

#### Question Format

Format each question with context, trade-offs, and a recommended default:

```text
? **Q1** - **<Question Title>**: <Context and specific trade-off to decide>
  (Recommended) <Default choice with concise rationale>
   - Option A: <Description>
   - Option B: <Description>
```

Present questions directly in chat with `(Recommended)` options listed first (prioritize interactive question tools if available in your environment).
Prioritize questions that determine downstream choices. If a new answer conflicts with a documented decision, surface the conflict in the next round instead of silently choosing one.

### 3. Immediate Evergreen Doc Updates

Apply documentation updates to disk immediately upon receiving the user's answers:

- **Living Documents, Not Logs:** Write evergreen statements of current truth. Never append interview transcripts, changelogs, or conversational minutes to architectural docs.
- **Decision Status:** Record settled decisions as current design, and mark unresolved assumptions or alternatives explicitly. Preserve brief rationale when it explains a consequential choice; do not turn an assumption into a fact.
- **Behavior Contracts:** For decisions that change observable behavior, record a representative success case and the existing interface or test seam that could verify it. If no suitable seam exists, identify that design gap without inventing an implementation task.
- **Source-Backed Structure:** Describe boundaries and data flow clearly. Add or revise a Mermaid diagram when it makes a real architectural decision or data flow easier to understand. Link source for existing structure; label planned or uncertain relationships distinctly in prose or diagrams.
- **Deduplication & DRY:** Update or replace existing sections rather than appending duplicate blocks. Maintain a strict single source of truth across all doc files.
- **Existing Files First:** Direct updates into established documentation (e.g. `docs/architecture.md`, `docs/technical.md`, `docs/testing.md`).
- **New Documents:** Create a distinct document when the established docs have no suitable home for the decision. Ask about location or ownership only when genuinely ambiguous.
- **Glossary Sync:** Extract and record newly introduced domain terminology and definitions into `.agents/memory/context.md` when present.
- **Avoid Bloat:** If a user changes the existing plan, remove all references to the outdated information. Do not leave notes about the old plan. Similarly, if a user says something is not part of the plan, you do not need to record that decision unless strictly necessary. The docs should be a living source of truth, not an idea graveyard.

### 4. Turn Cadence

Execute each round in a single conversational turn:

1. **Apply Edits:** Write modified files directly to disk using standard editing tools.
2. **Check Consistency:** Reconcile the new decisions with affected interfaces, diagrams, and prior statements, then briefly summarize files updated and decisions codified.
3. **Queue Next Round:** Present the next batch of 2–3 targeted questions, drilling into the next level of the design hierarchy.

Continue this cycle iteratively until the user explicitly signals to stop (e.g. "stop", "done", "looks good", "ready to build").