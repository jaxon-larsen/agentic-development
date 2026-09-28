---
trigger: glob
description: Code quality, proportional testing, and evidence-based verification.
globs: "**/*.js, **/*.ts, **/*.jsx, **/*.tsx, **/*.py, **/*.go, **/*.rs, **/*.cpp, **/*.h, **/*.java, **/*.cs"
---

# Agent Testing & Verification Rules
Rules for code quality, proportional testing, and troubleshooting loops.

## 1. Code Quality & Modularity
- **Strict Types:** Respect the type system; avoid escape hatches (like `any`).
- **Cohesion:** Split code when a file combines responsibilities that are easier to understand or change separately; length alone is not a reason to split it.
- **Dependency Tracing:** Before changing a function, class, or API signature, trace its dependency path and public consumers.
- **Document Consequential Limits:** Explain a known limitation where a maintainer needs to see it, when it affects correctness, scale, or a likely future change.
- **No Rot:** Remove imports and variables rendered obsolete by your changes.

## 2. Test-Driven Development & Verification
- **Goal-Driven:** Identify how to verify each meaningful change; use a persistent task breakdown only when it helps track the work.
- **Regression Checks:** For a reproducible behavior bug, add or run the smallest check that fails on the bug before fixing it when practical. For trivial, documentation, low-risk configuration, or exploratory changes, use a proportionate check instead of creating a test that merely repeats the implementation.
- **Direct Evidence:** When practical, exercise the changed behavior at the nearest meaningful interface and record what actually happened. Match the check's cost and depth to risk; state any important path that was not exercised instead of treating a build or test proxy as proof of that path.
- **Debugging Protocols:** Fix root causes, not symptoms. Trace errors using log analysis; remove temporary debug logging before completing.
- **Scratchpad Prototyping:** Execute temporary logic checks in workspace scratchpad files (`.agents/scratch/`), deleting them prior to finalization.
- **Failure Loop Protection:** After three runs with the same failure and no new evidence, stop repeating that command. Inspect the cause, change the hypothesis or check, and continue only when the next step can resolve a concrete uncertainty. If no meaningful diagnostic step remains, record the blocker under `## ⚠️ Pitfalls & Troubleshooting` in `.agents/memory/context.md` and ask the user for the missing input.

