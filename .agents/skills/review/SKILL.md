---
name: review
description: Review a code change for defects, requirement alignment, and unnecessary complexity with depth matched to risk.
---

# Code Review

Review every file in the selected change (defaulting to the repository's unstaged changes), then report only actionable, source-verified findings. Keep a routine review light; use independent passes when the change warrants them.

## 1. Establish the review boundary

- Resolve the user's requested branch, commit, PR, path, or working tree. State the exact boundary in the report.
- For a working-tree review, use `git status --porcelain=v1 -uall` to inventory tracked **and untracked** files. Use `git diff HEAD` for tracked changes; read each relevant untracked file as a new file. Account for deletions and renames. Never silently omit a changed file.
- For a branch review, use the requested base and `git diff <base>...HEAD`. Do not silently include working-tree changes in that boundary. For a commit, compare it with its parent. If the boundary is ambiguous and materially changes what is reviewed, ask once.
- Exclude secrets, ignored files, generated output, and unrelated artifacts from model context. Name any excluded path or category in the coverage note. If no reviewable change exists, say so rather than inventing findings.

## 2. Gather only relevant context and checks

- Read the task or PR intent, project rules, affected interfaces and callers, and documentation that describes changed behavior.
- Run focused tests, typechecks, or lint checks when practical. Record commands and outcomes. A failing check is evidence to investigate, **not** a reason to stop reviewing. If a check cannot run, continue source review and state the limit.
- On a large diff, group related files by behavior or subsystem so every changed file has an owner. Read enough surrounding source to understand each changed path.

## 3. Match review depth to risk

- **Routine:** Make one pass across correctness, alignment, and economy. This is the default for small, local changes.
- **Deep:** Use separate independent passes for the three axes when the user requests a thorough review or the change affects trust boundaries, authentication, money, data loss, concurrency, persistence, public APIs, schema migrations, deployment, or several interacting subsystems. Use subagents only when the active environment and user instructions allow them; otherwise run the passes sequentially.
- Do not add agents, repeated test runs, or broad repository scans merely to fill a process. Expand a pass only to resolve a concrete uncertainty.

### Review axes

- **Correctness:** Trace changed behavior through callers and consumers. Check edge cases, failure handling, races, security boundaries, and regressions. A style preference is not a defect.
- **Downstream assumptions:** For changed APIs, schemas, or shared behavior with other consumers, identify the one or two assumptions most likely to break beyond direct callers. Probe them with focused source or runtime evidence, and say when the decisive check is unavailable.
- **Alignment:** Compare behavior with the user's request, acceptance criteria, and affected docs. Look for missing requirements, behavior drift, and unrequested work.
- **Economy:** Apply the deletion test to new layers, dependencies, wrappers, configuration, and duplicate logic. Suggest removal only when the same required behavior remains, including validation, error handling, security, accessibility, and verification.

## 4. Verify candidate findings

Before reporting an issue, reopen the current source and verify its file and line. State the triggering condition, the actual or well-supported failure, and why the proposed change causes it. Try to disprove the finding using nearby guards, callers, tests, and runtime conditions. If a decisive fact is unavailable, label it an open question, not a confirmed defect. Consolidate duplicates by root cause.

Use `Critical` for a demonstrated severe failure or security exposure, `Warn` for a material defect or unmet requirement, and `Note` only for a concrete, worthwhile simplification. Omit speculative nits.

## Report

```markdown
## Review: READY | CHANGES REQUESTED | INCOMPLETE

Scope: <exact diff boundary; tracked and untracked coverage>
Checks: <commands and results, or why not run>

### Findings
- [SEVERITY] path:line — <trigger, impact, and smallest effective correction>

### Open questions and limits
- <only facts that could change the verdict or files not reviewed>
```

If there are no actionable findings, say so and still report scope and check limits. `READY` means no material issue was found within the stated scope; it does not claim an exhaustive audit.
