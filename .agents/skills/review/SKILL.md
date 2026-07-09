---
name: review
description: Review the changes since a fixed point (commit, branch, tag, or merge-base) along two axes — Standards (does the code follow this repo's documented coding standards?) and Spec (does the code match what the originating issue/PRD asked for?). Runs both reviews in parallel sub-agents and reports them side by side. Use when the user wants to review a branch, a PR, work-in-progress changes, or asks to "review since X".
---

## Overview
Two-axis review of git diff against user's fixed point:
- **Standards:** Compliance with `.agents/rules/` and conventions.
- **Spec:** Compliance with PRD, specs, or task lists.
Spawns parallel sub-agents to review independently, then aggregates findings.

## Instructions
### 1. Pin Ref & Setup
- Check that ref resolves (`git rev-parse <ref>`) and diff is non-empty (`git diff <ref>...HEAD`).
- Capture diff and commit list.

### 2. Identify Spec & Standards
- Locate spec: `.agents/memory/tasks.md` checklist, user argument path, or `docs/` specs.
- Locate standards: static rules under `.agents/rules/` and glossary conventions in `context.md`.

### 3. Spawn Parallel Sub-Agents
Use `general-purpose` subagent to run reviews concurrently:
- **Standards & Security Agent Brief:** Report violations of conventions or security risks.
  - Prompt: "Group findings strictly by severity: `Critical` (vulnerabilities/breaking), `Warn` (deviations/bugs), `Note` (nits). Prefix each finding with `filepath:line_number` and place general summaries at the bottom. Limit to 400 words."
- **Spec Agent Brief:** Identify requirements missing, incorrect, partial, or scope creep.
  - Prompt: "Group findings strictly by severity: `Critical` (failed requirements), `Warn` (partial), `Note` (scope creep). Prefix each finding with `filepath:line_number` and place general summaries at the bottom. Limit to 400 words."

### 4. Aggregate Findings
Compile report under `## Standards` and `## Spec` headers. Do not merge or rerank. End with a one-line count/worst issue summary.

## Output
- Structured markdown code review in chat with independent Standards and Spec sections.
- Findings grouped by severity with `filepath:line_number` citations.
- Worst-issue summary per axis.

## References
- [review-checklist.md](./references/review-checklist.md) - Security, correctness, and design criteria.
