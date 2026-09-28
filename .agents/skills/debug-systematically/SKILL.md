---
name: debug-systematically
description: "Hypothesis-driven debugging. Reproduce, hypothesize, test, fix, verify."
disable-model-invocation: true
---

## Overview
Hypothesis-driven debugging workflow to avoid random trials. Build a tight feedback loop first — everything else follows from it.

## Instructions
### 1. Build a Feedback Loop
**This is the skill.** If you have a tight pass/fail signal, you will find the cause. If you don't, no amount of staring at code will save you.

Try these in order until one works:
1. **Failing test** at whatever seam reaches the bug (unit, integration, e2e).
2. **Curl / HTTP script** against a running dev server.
3. **CLI invocation** with a fixture input, diffing stdout against a known-good snapshot.
4. **Replay a captured trace** — save a real request/payload/event log to disk; replay through the code path in isolation.
5. **Throwaway harness** — spin up a minimal subset of the system that exercises the bug code path.
6. **HITL script** — last resort. If a human must click, use [hitl-loop.template.ps1](./scripts/hitl-loop.template.ps1) (PowerShell) or [hitl-loop.template.sh](./scripts/hitl-loop.template.sh) (Bash) so the loop is still structured.

**Tighten the loop:** Make it faster (skip unrelated init), sharper (assert on the specific symptom), and more deterministic (pin time, seed RNG, isolate I/O).

### 2. Reproduce & Minimize
Run the loop. Confirm it goes red on **the user's exact symptom** (not a nearby failure). Minimize the repro only as far as needed to isolate the cause and keep checks fast.

### 3. Hypothesize
Rank the plausible hypotheses (often 1–3) and test the cheapest discriminating one first. Each must be falsifiable:

> "If <X> is the cause, then <changing Y> will make the bug disappear / <changing Z> will make it worse."

Ask the user to re-rank them only when their domain knowledge could change the next check.

### 4. Instrument & Investigate
Each probe must map to a specific hypothesis. **Change one variable at a time.** Prefer debugger/REPL over logs. If you must log, **tag every debug log** with a unique prefix (e.g. `[DEBUG-a4f2]`) — cleanup becomes a single grep.

### 5. Fix & Regression Check
Before fixing a reproducible behavior bug, capture the smallest reliable failing check when practical. Add a lasting regression test when it protects an important behavior or failure mode; otherwise use the existing feedback loop. Apply the fix, confirm the check passes, and re-run the original loop.

If the root cause is a repeated pattern, search for closely related instances in the affected subsystem. Fix those that share the same cause and verification path; report broader occurrences separately so the bug fix does not expand into an unbounded refactor.

### 6. Cleanup
Before declaring done:
- [ ] Original repro no longer reproduces (re-run feedback loop)
- [ ] Chosen regression check passes
- [ ] All `[DEBUG-...]` instrumentation removed (grep the prefix)
- [ ] Throwaway prototypes deleted
- [ ] Root cause identified and documented in findings
- [ ] If a recurring or obscure pitfall was uncovered, record it under Troubleshooting in `.agents/memory/context.md`

## Output
A report detailing:
- **Feedback Loop**: The command or reproducible steps that expose the bug.
- **Hypotheses**: Explanations tested and ranked.
- **Root Cause & Fix**: The verified reason and modified files.
- **Verification**: The before-and-after check and any relevant test results or limits.

## References
- [hitl-loop.template.ps1](./scripts/hitl-loop.template.ps1) - Human-in-the-loop PowerShell template for bugs requiring manual interaction on Windows.
- [hitl-loop.template.sh](./scripts/hitl-loop.template.sh) - Human-in-the-loop Bash template for bugs requiring manual interaction on POSIX systems.
