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
6. **HITL bash script** — last resort. If a human must click, use [hitl-loop.template.sh](./scripts/hitl-loop.template.sh) so the loop is still structured.

**Tighten the loop:** Make it faster (skip unrelated init), sharper (assert on the specific symptom), and more deterministic (pin time, seed RNG, isolate I/O).

### 2. Reproduce & Minimize
Run the loop. Confirm it goes red on **the user's exact symptom** (not a nearby failure). Then shrink the repro to the smallest scenario that still goes red — cut inputs, callers, config one at a time. Done when every remaining element is load-bearing.

### 3. Hypothesize
Generate **3–5 ranked hypotheses** before testing any. Each must be falsifiable:

> "If <X> is the cause, then <changing Y> will make the bug disappear / <changing Z> will make it worse."

Show the ranked list before testing — the user often has domain knowledge that re-ranks instantly.

### 4. Instrument & Investigate
Each probe must map to a specific hypothesis. **Change one variable at a time.** Prefer debugger/REPL over logs. If you must log, **tag every debug log** with a unique prefix (e.g. `[DEBUG-a4f2]`) — cleanup becomes a single grep.

### 5. Fix & Regression Test
Write the regression test **before** the fix (if a correct seam exists). Watch it fail, apply fix, watch it pass, re-run the original feedback loop.

### 6. Cleanup
Before declaring done:
- [ ] Original repro no longer reproduces (re-run feedback loop)
- [ ] Regression test passes
- [ ] All `[DEBUG-...]` instrumentation removed (grep the prefix)
- [ ] Throwaway prototypes deleted
- [ ] Root cause stated in the commit message

## Output
A report detailing:
- **Feedback Loop**: The one command that reproduces the bug.
- **Hypotheses**: Explanations tested and ranked.
- **Root Cause & Fix**: The verified reason and modified files.
- **Verification**: Run log showing tests passed.

## References
- [hitl-loop.template.sh](./scripts/hitl-loop.template.sh) - Human-in-the-loop bash template for bugs requiring manual interaction.
