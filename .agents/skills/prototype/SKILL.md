---
name: prototype
description: Build a throwaway prototype to flesh out a design — a runnable terminal app for state/business-logic questions, or several radically different UI variations toggleable from one route.
disable-model-invocation: true
---

## Overview
A prototype is **throwaway code that answers a design question**. The question dictates the shape.

## Instructions
### 1. Determine Branch
Identify what question to answer:
- **Logic/State Model:** Build a tiny, runnable terminal script (following [LOGIC.md](LOGIC.md)) that demonstrates state changes.
- **User Interface:** Generate 2–3 UI variants on a single route (following [UI.md](UI.md)) toggleable via URL query params.

### 2. Implementation Rules
1. **Throwaway:** Name/locate files clearly to mark them as throwaway. Do not create new routing conventions.
2. **One-Command:** Must be runnable via one simple project script (e.g. `npm run prototype`).
3. **No Persistence:** Keep state in memory. Use mock database or temp file only if required.
4. **Skip Polish:** No tests, abstractions, or complex error handling.
5. **Expose State:** Log or render state differences after every action/toggle.
6. **Absorb/Delete:** Delete the code or merge validated logic immediately after answering the question.

## Output
- Runnable terminal script or multi-variation page.
- Log of the design answer recorded in spec docs or a local `NOTES.md`.
- Cleanup plan to remove prototype code.

## References
- [LOGIC.md](./LOGIC.md) - Detailed guide for backend/logic prototyping.
- [UI.md](./UI.md) - Detailed guide for frontend/UI prototyping.
