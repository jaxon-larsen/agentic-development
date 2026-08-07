---
name: grill
description: Probe and clarify — ask questions about docs, code, or both until understanding is sharp. Does not edit project files.
disable-model-invocation: true
---

## Overview

Interview the user to clarify goals, design decisions, and requirements. **Questions only** — no file edits.

## Instructions

1. **Map the Design Tree:** Map out choices as a hierarchical design tree (high-level architectural decisions first, details later).
2. **Read Code & Docs First:** Read `context.md`, `docs/`, and code before grilling.
3. **Execute in Rounds:** Work the design tree in **rounds**. The **frontier** consists of decisions whose prerequisites are settled—ask the frontier questions in one organized round:
   - Format each question cleanly:
     ```text
     ? **Q1** - **<Question Title>**: <Question body with context & options>
     ?? <Your recommended default answer & rationale>
     ```
   - Use `ask_question` tool if available, or list the questions in chat with `(Recommended)` options listed first.
4. **Scenario Test:** Design specific scenarios/edge cases to stress-test requirements.

## Output

A text-based summary of decisions in chat:

- **Focus**: Grill scope.
- **Resolved Terms / Decisions**: Key agreements.
- **Open Questions / Mismatches**: Leftover work.
  Recommend updating `.agents/memory/context.md` if key domain terms were defined.

## References

### Grilling Question Bank

Use these questions as templates during requirement gathering and design clarification sessions.

#### 🏗️ Architecture & High-Level Design

- **Stack & Tooling**: "Are we using any specific library or framework for this feature, or should I stick to what is currently package-configured?"
- **Data Flow & Seams**: "Where should the boundary of this new feature sit? Should we wrap this logic in a new module or expand an existing one?"
- **Database & State**: "Does this feature require persisting state? If so, what database schema or state shape are you envisioning?"

#### 📋 Requirements & Scope

- **Success Criteria**: "What does a successful implementation of this feature look like? Are there specific inputs and outputs we must support?"
- **Edge Cases**: "How should the system handle invalid inputs or external service failures?"
- **Scope Control**: "What is the absolute minimal set of features we need for the first version? What should we postpone to a later iteration?"

#### 👤 User Experience & Interactions

- **User Interface**: "What are the primary UI components required? Are there styling choices (e.g. colors, layouts) I should prioritize?"
- **Feedback Loops**: "How should errors or status updates be reported back to the user?"
