---
name: spec-architect
description: Interrogate project decisions from foundations to tight contracts, iteratively updating project docs until stopped.
disable-model-invocation: true
---

# Spec Architect

Conducts a recursive, contract-tightening interview loop with the user. Progressively probes architectural, technical, and operational decisions—starting broad and narrowing to edge-case contracts—while writing living, evergreen updates to project documentation after each round.

---

## Workflow Instructions

### 1. Intelligent Context Discovery

Before initiating questions:
- Locate project documentation and memory roots dynamically using relative paths:
  - Documentation directory (typically `docs/` or repository docs root).
  - Agent memory directory (typically `.agents/memory/`, such as `context.md` or `tasks.md`).
- Scan existing markdown files and source code to map current decisions, interfaces, and open gaps.
- Identify the frontier of unresolved foundational choices.

### 2. Progressive Interview Loop (2–3 Questions per Round)

Structure questions hierarchically across rounds, tightening the contract as decisions solidify:

1. **Foundational Tier (Initial Rounds):**
   - System boundaries, core philosophy, architectural patterns, tech stack constraints, primary actors/personas, and end-to-end data topology.
2. **Subsystem Tier (Middle Rounds):**
   - Module decomposition, interface seams, data models/schemas, state lifecycle, persistence mechanisms, and external integrations.
3. **Contract & Hardening Tier (Later Rounds):**
   - Error handling strategies, boundary edge cases, concurrency/race conditions, security/auth boundaries, performance budgets, and testing invariants.

#### Question Format

Format each question with context, trade-offs, and a recommended default:

```text
? **Q1** - **<Question Title>**: <Context and specific trade-off to decide>
💡 (Recommended) <Default choice with concise rationale>
   - Option A: <Description>
   - Option B: <Description>
```

Present questions directly in chat with `(Recommended)` options listed first (prioritize interactive question tools if available in your environment).

### 3. Immediate Evergreen Doc Updates

Apply documentation updates to disk immediately upon receiving the user's answers:

- **Living Documents, Not Logs:** Write evergreen statements of current truth. Never append interview transcripts, changelogs, or conversational minutes to architectural docs.
- **Deduplication & DRY:** Update or replace existing sections rather than appending duplicate blocks. Maintain a strict single source of truth across all doc files.
- **Existing Files First:** Direct updates into established documentation (e.g. `docs/architecture.md`, `docs/technical.md`, `docs/testing.md`).
- **File Creation Gate:** If an answer warrants creating a distinct new document, propose the new file path to the user and obtain confirmation before creating it.
- **Glossary Sync:** Extract and record newly introduced domain terminology and definitions into `.agents/memory/context.md` when present.
- **Avoid Bloat:** If a user changes the existing plan, remove all references to the outdated information. Do not leave notes about the old plan. Similarly, if a user says something is not part of the plan, you do not need to record that decision unless strictly necessary. The docs should be a living source of truth, not an idea graveyard.

### 4. Turn Cadence

Execute each round in a single conversational turn:

1. **Apply Edits:** Write modified files directly to disk using standard editing tools.
2. **Summarize Updates:** Provide a brief, bulleted summary of files updated and decisions codified.
3. **Queue Next Round:** Present the next batch of 2–3 targeted questions, drilling into the next level of the design hierarchy.

Continue this cycle iteratively until the user explicitly signals to stop (e.g. "stop", "done", "looks good", "ready to build").

### 5. Finalization & Wrap-Up

When the user signals to stop:

- Present a concise index table of all updated documentation files with relative links.
- List any remaining deferred questions or future phase considerations.
- Outline recommended next steps (e.g. task decomposition via `goal`, prototyping via `prototype`, or implementation).

---

## Grilling Question Bank

Use these patterns to guide question formulation across tiers.

### 🏗️ Tier 1: Foundations & Architecture

- **Scope & Boundaries:** "What is strictly outside the scope of this project or phase?"
- **Topology:** "Is this structured as a modular monolith, standalone CLI, client-server service, or distributed pipeline?"
- **Runtime & Stack:** "What runtime environments and core toolchains are mandated, and what constraints do they impose?"
- **State Ownership:** "Where does the authoritative state live, and how is mutation managed across boundaries?"

### ⚙️ Tier 2: Subsystems & Data Flow

- **Module Contracts:** "What are the exact inputs, outputs, and interfaces between the primary components?"
- **Persistence & Schema:** "What is the shape of the data model? Does it require migration guarantees, relational integrity, or schema validation?"
- **Communication Protocols:** "How do components coordinate (synchronous method calls, REST, gRPC, event emitter, message bus)?"
- **Lifecycle & Lifecycle Hooks:** "How is initialization, configuration loading, health monitoring, and graceful shutdown handled?"

### 🛡️ Tier 3: Contracts, Edge Cases & Verification

- **Failure Modes & Retries:** "How should network failures, unexpected payload formats, or resource exhaustion be handled?"
- **Concurrency & Idempotency:** "Can operations be invoked concurrently? Are mutations idempotent?"
- **Security & Authorization:** "How are secrets managed, inputs sanitized, and permissions enforced at system seams?"
- **Verification Contracts:** "What defines a passing test suite? Are there specific integration fixtures, contract tests, or performance benchmarks required?"
