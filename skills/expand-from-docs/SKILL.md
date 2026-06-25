---
name: expand-from-docs
description: Compare code against documentation to locate growth opportunities, interview the user to define the next implementation phase, draft a plan updating code and docs, and update status and task lists accordingly.
disable-model-invocation: true
---

# Expand from Docs

Drive codebase and feature expansion by turning specifications and requirements into working implementations, ensuring code and docs are synchronized, and identifying pathways for further robustness.

## Process

### 1. Analyze Gaps and Stepping Off Points

Read existing documentation (`CONTEXT.md`, files in `docs/`, etc.) and scan the codebase. Identify:
- **Feature Gaps:** Areas where the code has not yet caught up to the specifications/documentation.
- **Stepping Off Points:** Promising entry points or foundations in the current code and docs to expand the project into a more robust, complete system.
- **Architectural Readiness:** What scaffolding or preparation is needed to support the next logical phase of implementation.

### 2. Interview

Ask the user targeted questions **one at a time** to align on what the next step of the project should be. 

For each question:
- State the proposed feature/direction and why it is a natural next step.
- Explain any trade-offs or design decisions.
- Wait for the user's response before asking the next question or moving to the planning stage.

### 3. Create Implementation Plan

Draft a structured plan to execute the agreed-upon phase. The plan must:
- Outline the next stage of implementation (focusing mostly on code updates, but including doc updates).
- Detail how the codebase will be prepared or scaffolded for a forthcoming stage of development.
- Include a verification plan (automated and manual tests).
- Present this plan to the user for feedback and approval.

### 4. Execute and Document

Once the plan is approved:
- Write and refine the code to implement the next stage.
- Update the documentation (e.g. task lists or checklists in `CONTEXT.md`) to:
  - Mark completed tasks as finished.
  - Add newly discovered ideas, roadmap items, or next steps to the backlog.
