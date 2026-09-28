---
name: prototype
description: Build throwaway code to answer a design question — logic prototype or UI variations.
disable-model-invocation: true
---

## Overview
A prototype is **throwaway code that answers a design question**. The question dictates the shape.

## Instructions
### 1. Choose the Smallest Experiment
State the design question and what observation would answer it. Build only enough to obtain that observation:
- **Logic/State Model:** Use a script or focused interactive harness; read [LOGIC.md](./references/LOGIC.md) when the user needs to drive state transitions.
- **User Interface:** Build a focused mockup or structurally different variants; read [UI.md](./references/UI.md) when comparison in the app will help the decision.

### 2. Implementation Rules
1. **Isolate:** Mark prototype files clearly and avoid new routing or dependency conventions.
2. **Easy to Run:** Give one simple command or URL when the user needs to try it.
3. **Keep It Small:** Use in-memory state or stubs unless persistence is the question. Skip production polish and tests that do not help answer the question.
4. **Expose the Answer:** Show the state, behavior, or UI difference the experiment is testing.
5. **Production Use:** Carry forward the validated design. Reuse code only after it meets the normal production requirements for types, errors, and verification; remove the throwaway harness.

## Output
- A runnable experiment and its command or URL when applicable.
- The observed design answer, recorded in the relevant existing docs when it changes the project design.
- Cleanup or production follow-up for any throwaway files.

## References
- [LOGIC.md](./references/LOGIC.md) - Detailed guide for backend/logic prototyping.
- [UI.md](./references/UI.md) - Detailed guide for frontend/UI prototyping.
