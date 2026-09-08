---
name: review
description: Fast, three-axis code review (Correctness + Alignment + Economy) with pre-review readiness short-circuiting.
---

# Code Review Skill

Conducts a deterministic pre-flight readiness check followed by three independent, single-responsibility sub-agent reviews:
- **Readiness:** Run tests, typechecks, and check git hygiene before reviewing.
- **Axis 1: Correctness:** Runtime behavior, edge cases, security, and repository conventions.
- **Axis 2: Alignment:** Requirements satisfaction, scope management, and documentation/content parity.
- **Axis 3: Economy:** Code minimalism, YAGNI, dead code, shallow wrappers, and the Deletion Test.

---

## Workflow Instructions

### 1. Pre-Flight Readiness (Deterministic Gate)
Execute this gate directly before spawning review agents.
- **Git Hygiene:** Run `git status --porcelain`. Fail immediately if untracked secrets (`.env`, credentials), build artifacts, or temporary scratch files exist.
- **Diff Resolution:** Resolve the diff boundary. If a base branch/ref is provided, use `git diff <base>...HEAD`. Otherwise, evaluate staged and unstaged working-tree changes (`git diff HEAD`). Fail if the diff is empty.
- **Automated Verification:** Discover and run project verification scripts if present (e.g., checks in `package.json`, `Makefile`, `Justfile`, `docs/testing.md`, or standard test/lint runners).
- **Short-Circuit Rule:** If tests fail, linters error, or git hygiene is violated, stop. Do not dispatch review agents. Emit `## 🚦 Pre-Flight Readiness: FAILED` with the tool logs.

### 2. Context Discovery (Heuristic Fallbacks)
Locate and supply existing context to review agents without hard dependencies on proprietary layouts:
- **Spec / Task Context:** Find task descriptions or user prompt specs. Check available issue trackers, PR descriptions, and files with similar roles.
- **Project Rules:** Check for style guides, linter configs, `.agents/rules/`, or `README.md`. If none exist, fall back to idiomatic language conventions.
- **Documentation:** Identify modified features/routes/APIs and search for corresponding markdown guides, docs folders, or inline API specs.

### 3. Dispatch Review Sub-Agents
Spawn 3 parallel agents. Remember, 
- **No Active Polling:** When awaiting sub-agent results, do NOT set sequential sleep timers or repeatedly query intermediate statuses. 
Pass each agent the **resolved diff**, **discovered context paths**, and its specific brief:

- **Correctness Agent Brief:**
  - *Focus:* Code safety, logic defects, security, and rule compliance.
  - *Audit:* Edge cases (null/undefined, off-by-one, boundary values), race conditions, error handling (no swallowed exceptions), security vulnerabilities (injection, auth, unvalidated inputs), and consistency with existing codebase patterns.
  - *Prompt:* "Audit the diff strictly for bugs, security vulnerabilities, edge cases, and repo conventions. Do not evaluate feature scope or design simplicity. Use the severity rubric: `Critical` (blocker, bug, crash, security risk), `Warn` (unhandled edge case, convention violation), `Note` (style nit). Format each finding as `- [SEVERITY] filepath:line_number: Description`. Max 350 words."

- **Alignment Agent Brief:**
  - *Focus:* Spec adherence, scope boundaries, and documentation parity.
  - *Audit:* Are all requested features/acceptance criteria satisfied? Is there unrequested work (scope creep)? Have accompanying guides, user docs, schemas, or docs pages been updated to match the changes made?
  - *Prompt:* "Audit the diff strictly against requested specifications and documentation sync. Do not review code syntax or logic bugs. Check requirement completeness, scope creep, and stale/missing docs or page updates. Use the severity rubric: `Critical` (missing core requirement, undocumented breaking change), `Warn` (partial implementation, omitted documentation/content update for modified behavior), `Note` (scope creep, doc typo). Format each finding as `- [SEVERITY] filepath:line_number: Description`. Max 350 words."

- **Economy Agent Brief:**
  - *Focus:* Minimalism, YAGNI, DRY, and abstraction depth.
  - *Audit:* Identify unnecessary abstractions, single-use utility wrappers, speculative configuration, and redundant code. Apply the **Deletion Test**: Can this new class, function, or layer be removed or folded into the call site without functional regression?
  - *Prompt:* "Audit the diff strictly for bloat, unnecessary abstractions, YAGNI, and DRY violations. Do not evaluate requirement completion or runtime security. Use the severity rubric: `Critical` (architectural anti-pattern creating severe maintenance debt), `Warn` (shallow wrapper, dead code, copy-pasted logic, failed Deletion Test), `Note` (minor simplification nit). Format each finding as `- [SEVERITY] filepath:line_number: Description`. Max 350 words."

### 4. Aggregate Report
Synthesize findings side-by-side using the following template:

```markdown
## 🚦 Pre-Flight Readiness: PASSED

## 🛡️ Correctness
<!-- Correctness agent findings -->

## 🎯 Alignment
<!-- Alignment agent findings -->

## ✂️ Economy
<!-- Economy agent findings -->

---
### Verdict: [READY / CHANGES REQUESTED]
- **Correctness Blocker:** <Top "None" critical issue or>
- **Alignment Blocker:** <Top "None" critical issue or>
- **Economy Blocker:** <Top "None" critical issue or>