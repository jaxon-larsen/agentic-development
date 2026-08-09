---
name: review
description: Three-axis code review (Standards + Spec + Simplicity) with PR readiness checks. Use when reviewing changes or preparing a PR.
---

## Overview
Comprehensive PR-readiness audit and three-axis code review:
- **PR Readiness Check:** Run tests/linters, audit git status for untracked secrets/artifacts.
- **Standards Review:** Verify compliance with `.agents/rules/`, security guardrails, and conventions.
- **Spec Review:** Verify requirement completeness against specs, PRD, or `tasks.md` checklists.
- **Simplicity Review:** Evaluate YAGNI, DRY, shallow wrappers, over-engineering, and apply Deletion Test.
Spawns 3 parallel sub-agents to review independently, then aggregates findings side-by-side.

## Instructions

### 1. Pre-Commit PR Readiness & Ref Pinning
- Check git status (`git status`) for untracked secrets, uncommitted changes, or temporary files.
- Resolve target ref (`git rev-parse <ref>`) and ensure diff is non-empty (`git diff <ref>...HEAD` or uncommitted diff).
- Execute verification commands from `docs/testing.md` (e.g. test runner, linter) with output filtering.

### 2. Identify Context
- Locate spec: `.agents/memory/tasks.md` checklist, user argument path, or `docs/` specs.
- Locate standards: static rules under `.agents/rules/` and glossary conventions in `context.md`.

### 3. Spawn Parallel Sub-Agents
Use `research` or `self` sub-agents to run reviews concurrently:
- **Standards & Security Sub-agent Brief:** Report violations of conventions, failing tests, or security risks.
  - Prompt: "Group findings strictly by severity: `Critical` (vulnerabilities/breaking), `Warn` (deviations/bugs), `Note` (nits). Prefix each finding with `filepath:line_number` and place general summaries at the bottom. Limit to 400 words."
- **Spec Sub-agent Brief:** Identify requirements missing, incorrect, partial, or scope creep.
  - Prompt: "Group findings strictly by severity: `Critical` (failed requirements), `Warn` (partial), `Note` (scope creep). Prefix each finding with `filepath:line_number` and place general summaries at the bottom. Limit to 400 words."
- **Simplicity Sub-agent Brief:** Evaluate (1) YAGNI & scope creep, (2) DRY & duplicate logic, (3) Deletion test & shallow wrappers (*can new code be removed/merged without functional loss?*).
  - Prompt: "Group findings strictly by severity: `Critical` (heavy technical debt/over-engineering), `Warn` (unnecessary abstraction/wrapper), `Note` (simplification nit). Prefix each finding with `filepath:line_number` and place general summaries at the bottom. Limit to 400 words."

### 4. Aggregate Findings
Compile report under `## 🚦 PR Readiness`, `## 📏 Standards`, `## 🎯 Spec`, and `## ✂️ Simplicity` headers. Do not merge or rerank. End with pass/fail verdict and worst-issue summary per axis.

## Output
- Structured markdown review with independent PR Readiness, Standards, Spec, and Simplicity sections.
- Findings grouped by severity with `filepath:line_number` citations and merge recommendation.

## References
- [review-checklist.md](./references/review-checklist.md) - PR readiness, security, correctness, spec, and simplicity criteria.
