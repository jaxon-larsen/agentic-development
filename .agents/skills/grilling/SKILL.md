---
name: grilling
description: Probe and clarify — ask questions about docs, code, or both until understanding is sharp. Does not edit project files.
disable-model-invocation: true
---

## Overview
Interview the user to clarify goals, design decisions, and requirements. **Questions only** — no file edits.

## Instructions
1. **Focus & Map:** Define grilling scope. Map out logical choices as a hierarchical design tree (high-level decisions first, details later).
2. **Read Code & Docs First:** Read context.md, docs/, and code before grilling.
3. **One Question at a Time:** Ask questions one by one. Do not overwhelm the user.
   - Use `ask_question` tool if available, otherwise ask directly in chat.
4. **Recommend Answers:** Place your recommended option **first** in the list, prefix with `(Recommended)`, and explain the rationale.
5. **Scenario Test:** Design specific scenarios/edge cases to stress-test requirements.

## Output
A text-based summary of decisions in chat:
- **Focus**: Grill scope.
- **Resolved Terms / Decisions**: Key agreements.
- **Open Questions / Mismatches**: Leftover work.
Recommend updating `.agents/memory/context.md` if key domain terms were defined.

## References
- [question-bank.md](./resources/question-bank.md) - Pre-made architectural, requirement, design, and technical questions.
