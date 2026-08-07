---
name: review
description: Two-axis code review (Standards + Spec) with PR readiness checks. Use when reviewing changes or preparing a PR.
---

## Overview
Comprehensive PR-readiness audit and two-axis code review:
- **PR Readiness Check:** Runs verification commands (tests, linters), audits git status for untracked secrets, and verifies clean build states.
- **Standards Review:** Compliance with `.agents/rules/`, security boundaries, and coding conventions.
- **Spec Review:** Compliance with PRD, specs, or `.agents/memory/tasks.md` checklists.
Spawns parallel sub-agents to review independently, then aggregates findings.

## Instructions
### 1. Pre-Commit PR Readiness & Ref Pinning
- Check git status (`git status`) for untracked secrets, uncommitted changes, or forbidden temporary files.
- Resolve target ref (`git rev-parse <ref>`) and ensure diff is non-empty (`git diff <ref>...HEAD` or uncommitted diff).
- Execute verification commands from `docs/testing.md` (e.g. test runner, linter) with output filtering to catch regressions before review.

### 2. Identify Spec & Standards
- Locate spec: `.agents/memory/tasks.md` checklist, user argument path, or `docs/` specs.
- Locate standards: static rules under `.agents/rules/` and glossary conventions in `context.md`.

### 3. Spawn Parallel Sub-Agents
Use `research` or `self` subagents to run reviews concurrently:
- **Standards & Security Agent Brief:** Report violations of conventions, failing tests, or security risks.
  - Prompt: "Group findings strictly by severity: `Critical` (vulnerabilities/breaking), `Warn` (deviations/bugs), `Note` (nits). Prefix each finding with `filepath:line_number` and place general summaries at the bottom. Limit to 400 words."
- **Spec Agent Brief:** Identify requirements missing, incorrect, partial, or scope creep.
  - Prompt: "Group findings strictly by severity: `Critical` (failed requirements), `Warn` (partial), `Note` (scope creep). Prefix each finding with `filepath:line_number` and place general summaries at the bottom. Limit to 400 words."

### 4. Aggregate Findings
Compile report under `## PR Readiness`, `## Standards`, and `## Spec` headers. Do not merge or rerank. End with a clear pass/fail status and worst-issue summary per axis.

## Output
- Structured markdown code review in chat with independent PR Readiness, Standards, and Spec sections.
- Findings grouped by severity with `filepath:line_number` citations.
- Worst-issue summary and PR merge recommendation.

## References
- [review-checklist.md](./references/review-checklist.md) - PR readiness, security, correctness, and design criteria.
