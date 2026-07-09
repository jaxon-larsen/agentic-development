---
name: debug-systematically
description: "Systematically debug an issue using hypothesis-driven investigation. Reproduce, hypothesize, test, fix, verify."
disable-model-invocation: true
---

## Overview
Hypothesis-driven debugging workflow to avoid random trials.

## Instructions
### 1. Reproduce
Confirm the bug before writing code:
- Write reproduction script/test or compile explicit CLI instructions.
- Capture exact traceback or failure state.

### 2. Hypothesize
Formulate and rank 2–3 hypotheses explaining the root cause. Target associated modules or files.

### 3. Investigate
Add logging, run debuggers, or bisect to test hypotheses one by one without making speculative changes.

### 4. Fix
Make localized, minimal corrections. Avoid broad try-catch overrides that hide issues.

### 5. Verify
Re-run reproduction and full test suite to guarantee zero regressions. Document gotchas in `.agents/memory/context.md` (Troubleshooting).

## Output
A report detailing:
- **Reproduction**: Link to script and exact error logs.
- **Hypotheses**: Explanations tested.
- **Root Cause & Fix**: The verified reason and modified files.
- **Verification**: Run log showing tests passed.
