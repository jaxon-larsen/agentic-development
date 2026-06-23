---
name: ask-agent
description: Find the right agent skill or workflow for the current engineering, product, debugging, or design situation.
disable-model-invocation: true
---

# Ask Agent

Help the user choose the next useful skill or workflow.

This is a router, not a place to do the work. Listen to the user's situation, ask at most one clarifying question if needed, then recommend one primary path and, when useful, one fallback.

## Routing Guide

- **Fuzzy product, design, or implementation idea**: `/grill-with-docs`
- **Non-code idea that needs sharper thinking**: `/grill-me`
- **Implement planned work**: `/implement`
- **Build or fix with tests first**: `/tdd`
- **Diagnose a hard bug or regression**: `/diagnosing-bugs`
- **Explore architecture or module boundaries**: `/codebase-design`
- **Resolve merge or rebase conflicts**: `/resolving-merge-conflicts`
- **Hand work to another agent or future session**: `/handoff`

## Response Shape

Answer briefly:

1. Name the recommended skill.
2. Explain why it fits in one or two sentences.
3. Say what the user should provide next, if anything.

If no skill fits, say so and suggest a normal agent workflow instead.
