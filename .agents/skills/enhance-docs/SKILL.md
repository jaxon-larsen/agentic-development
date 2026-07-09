---
name: enhance-docs
description: Search the docs and reference the codebase to identify drift, flag ambiguities, outline concrete steps to simplify/restructure documentation, and interview the user to clarify the project's vision.
disable-model-invocation: true
---

## Overview
Audit project documentation against the codebase to identify drift, structural gaps, and align development roadmap with user vision.

## Instructions
### 1. Explore
Read `.agents/memory/context.md` glossary, `docs/`, and scan codebase to locate features, modules, and API layers.

### 2. Generate Alignment Report
Write a report (no edits yet) covering:
- **Doc-Code Drift:** Discrepancies between specs/READMEs and actual codebase.
- **Redundancy & Bloat:** Obsolete instructions or duplicate docs.
- **Ambiguities & Gaps:** Underspecified logic or missing edge cases in specs.
- **Wiki Linter / Structural Health:**
  - Orphan markdown files under `docs/` (not linked in index.md).
  - Dead relative markdown links.
  - Glossary Gaps: Domain/jargon terms used in code but missing definitions in `context.md`.
  - Stale Tasks: Discrepancies in task completion status between `tasks.md` and codebase.
- **Simplification Plan:** Concrete restructuring/cleanup steps.

### 3. Interview
Present report to user. Clarify open questions one at a time using `/grill` protocol (suggest recommendations and explain trade-offs).

### 4. Sync
Update `.agents/memory/context.md` (domain vocabulary), `.agents/memory/tasks.md` (roadmap), and docs under `docs/` after user confirmation.

## Output
- Alignment report table summarizing Drift, Bloat, Gaps, Linter, Glossary, and Tasks.
- Updated documentation, glossary, and active task lists.
