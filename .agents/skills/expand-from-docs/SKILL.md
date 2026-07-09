---
name: expand-from-docs
description: Compare code against documentation to locate growth opportunities, interview the user to define the next implementation phase, draft a plan updating code and docs, and update status and task lists accordingly.
disable-model-invocation: true
---

## Overview
Drive codebase expansion by implementing specifications/requirements from docs, ensuring code and docs stay in sync.

## Instructions
### 1. Analyze Gaps
Scan `.agents/memory/context.md`, `docs/`, and codebase. Identify:
- **Feature Gaps:** Specs not yet implemented in code.
- **Stepping Off Points:** Code foundations ready for expansion.
- **Scaffolding:** Preparation required to support the implementation.

### 2. Interview
Grill user on the next implementation stage one question at a time. Explain design trade-offs and suggest recommendations.

### 3. Plan
Draft a plan to implement the phase:
- Outline code and doc updates.
- Detail scaffolding and verification steps (unit & integration tests).
- Present to user for approval.

### 4. Execute
Upon approval, write code, run verification tests, and update `.agents/memory/tasks.md` backlog and status.

## Output
- Structured implementation plan.
- Tested code modifications.
- Updated task and backlog records.
