# Agent Skills for Engineering Workspaces

A compact library of AI agent skills for real software work: alignment, implementation, test-driven development, debugging, and handoffs.

These skills are intentionally small and composable. They work across agent environments, including Cursor and Antigravity, that can load `SKILL.md` files or slash-command-style workflows.

General coding behavior for agents lives in [INSTRUCTIONS.md](./INSTRUCTIONS.md).

## Quickstart

1. Install or copy the skills you want into your agent's skills directory.
2. Use `/ask-agent` when you are not sure which workflow fits the moment.

## Why These Skills Exist

AI agents are most useful when they have the same engineering rails a strong teammate would expect: crisp context, small slices, fast feedback, durable decisions, and clear handoffs.

This repo packages those rails as reusable skills:

- **Alignment before action**: `/grill-me` and `/grill-with-docs` help turn fuzzy intent into concrete decisions.
- **Shared project language**: domain-modeling workflows keep `CONTEXT.md` and ADRs useful, so agents can speak in the project's terms instead of generic prose.
- **Feedback loops**: `/tdd` and `/diagnosing-bugs` push agents toward small verified steps instead of large untested edits.
- **Design pressure**: `/codebase-design` helps agents notice module boundaries, seams, and complexity before the code hardens around them.

## Reference

These split on one axis: who can invoke them. **User-invoked** skills are reachable only when you type them, usually to orchestrate a workflow. **Model-invoked** skills can be invoked by you or reached for automatically by an agent when the task fits.

### Engineering

Daily code-work skills.

**User-invoked**

- **[ask-agent](./skills/engineering/ask-agent/SKILL.md)** - Find the right skill or flow for the current engineering/design situation.
- **[grill-with-docs](./skills/engineering/grill-with-docs/SKILL.md)** - Grilling session that also builds your project's domain model, sharpening terminology and updating `CONTEXT.md` and ADRs inline.
- **[implement](./skills/engineering/implement/SKILL.md)** - Implement a planned change from a spec or agreed design, using tests where possible.

**Model-invoked**

- **[diagnosing-bugs](./skills/engineering/diagnosing-bugs/SKILL.md)** - Disciplined diagnosis loop for hard bugs and performance regressions: reproduce, minimize, hypothesize, instrument, fix, regression-test.
- **[tdd](./skills/engineering/tdd/SKILL.md)** - Test-driven development with a red-green-refactor loop. Builds features or fixes bugs one vertical slice at a time.
- **[domain-modeling](./skills/engineering/domain-modeling/SKILL.md)** - Actively build and sharpen a project's domain model, stress-test terms, and update `CONTEXT.md` and ADRs inline.
- **[codebase-design](./skills/engineering/codebase-design/SKILL.md)** - Shared discipline and vocabulary for designing deep modules with small interfaces and useful seams.
- **[resolving-merge-conflicts](./skills/engineering/resolving-merge-conflicts/SKILL.md)** - Resolve merge conflicts while preserving both sides' intent.

### Productivity

General workflow tools, not code-specific.

**User-invoked**

- **[grill-me](./skills/productivity/grill-me/SKILL.md)** - Get interviewed about a plan or design until every branch of the decision tree is resolved.
- **[handoff](./skills/productivity/handoff/SKILL.md)** - Compact the current conversation into a handoff document so another agent can continue the work.
- **[writing-great-skills](./skills/productivity/writing-great-skills/SKILL.md)** - Reference for writing and editing skills well: the vocabulary and principles that make a skill predictable.

**Model-invoked**

- **[grilling](./skills/productivity/grilling/SKILL.md)** - Interview the user about a plan or design until every branch of the decision tree is resolved.
