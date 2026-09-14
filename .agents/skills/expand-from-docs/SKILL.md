---
name: expand-from-docs
description: Identify unimplemented specs, interview on the next phase, and draft an execution plan.
disable-model-invocation: true
---

## Overview

Audit project documentation against the codebase to discover unimplemented specifications, interview the user to tune the implementation strategy, and record an approved phased plan in project memory. Does not write production code.

## Instructions

### 1. Analyze Gaps

Scan `.agents/memory/context.md`, `docs/`, and the codebase. Identify:

- **Feature Gaps:** Specs declared in documentation but not yet implemented in code.
- **Stepping Off Points:** Existing code foundations ready for expansion.
- **Scaffolding:** Prerequisites or refactoring required before building.

### 2. Interview & Tune

Follow the grill-me protocol on the next implementation stage:
- Ask focused questions to clarify scope, edge cases, and design trade-offs.
- Suggest recommended defaults and explain trade-offs.
- Iterate until the requirements and design boundaries are clear.

### 3. Plan & Record

Draft a phased implementation plan:
- Group work into logical, incremental phases with verification criteria.
- Present the plan to the user for approval and tuning.
- Once approved, record the phased roadmap items into `.agents/memory/tasks.md`.

*Note:* Do not begin writing production implementation code during this workflow. Implementation proceeds only when the user explicitly initiates the coding phase.

## Output

- Phased implementation plan presented in chat.
- Updated `.agents/memory/tasks.md` backlog with approved milestones and verification criteria.
