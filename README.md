# Agent Skills for Engineering Workspaces

A compact library of AI agent skills for real software work: discovery, planning, issue creation, triage, test-driven implementation, debugging, architecture review, and workflow setup.

These skills are intentionally small and composable. They are meant to work across agent environments, including Cursor, Antigravity, Codex, and other tools that can load `SKILL.md` files or slash-command-style workflows.

## Quickstart

1. Install or copy the skills you want into your agent's skills directory.
2. Include `/setup-skills` in each new codebase that will use the engineering workflows.
3. Run `/setup-skills` once in that codebase. It will record:
   - where issues are tracked
   - which labels map to the triage state machine
   - where domain docs and ADRs live
4. Use `/ask-agent` when you are not sure which workflow fits the moment.

## Why These Skills Exist

AI agents are most useful when they have the same engineering rails a strong teammate would expect: crisp context, small slices, fast feedback, durable decisions, and clear handoffs.

This repo packages those rails as reusable skills:

- **Alignment before action**: `/grill-me` and `/grill-with-docs` help turn fuzzy intent into concrete decisions.
- **Shared project language**: domain-modeling workflows keep `CONTEXT.md` and ADRs useful, so agents can speak in the project's terms instead of generic prose.
- **Feedback loops**: `/tdd` and `/diagnosing-bugs` push agents toward small verified steps instead of large untested edits.
- **Issue-driven work**: `/to-prd`, `/to-issues`, and `/triage` connect planning to the issue tracker and keep work ready for humans or agents.
- **Design pressure**: `/codebase-design` and `/improve-codebase-architecture` help agents notice module boundaries, seams, and complexity before the code hardens around them.

## Reference

These split on one axis: who can invoke them. **User-invoked** skills are reachable only when you type them, usually to orchestrate a workflow. **Model-invoked** skills can be invoked by you or reached for automatically by an agent when the task fits.

### Engineering

Daily code-work skills.

**User-invoked**

- **[ask-agent](./skills/engineering/ask-agent/SKILL.md)** - Find the right skill or flow for the current engineering/design situation.
- **[grill-with-docs](./skills/engineering/grill-with-docs/SKILL.md)** - Grilling session that also builds your project's domain model, sharpening terminology and updating `CONTEXT.md` and ADRs inline.
- **[triage](./skills/engineering/triage/SKILL.md)** - Move issues and external PRs through a state machine of triage roles.
- **[improve-codebase-architecture](./skills/engineering/improve-codebase-architecture/SKILL.md)** - Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you pick.
- **[setup-skills](./skills/engineering/setup-skills/SKILL.md)** - Configure a repo for the engineering skills: issue tracker, triage labels, and domain doc layout. Run once per repo.
- **[to-issues](./skills/engineering/to-issues/SKILL.md)** - Break any plan, spec, or PRD into independently grabbable issues using vertical slices.
- **[to-prd](./skills/engineering/to-prd/SKILL.md)** - Turn the current conversation into a PRD and publish it to the issue tracker.
- **[prototype](./skills/engineering/prototype/SKILL.md)** - Build a throwaway prototype for state, business-logic, or UI design questions.
- **[implement](./skills/engineering/implement/SKILL.md)** - Implement a planned change from a PRD or issue set, using tests where possible.

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
- **[teach](./skills/productivity/teach/SKILL.md)** - Teach the user a new skill or concept over multiple sessions, using the current directory as a stateful teaching workspace.
- **[writing-great-skills](./skills/productivity/writing-great-skills/SKILL.md)** - Reference for writing and editing skills well: the vocabulary and principles that make a skill predictable.

**Model-invoked**

- **[grilling](./skills/productivity/grilling/SKILL.md)** - Interview the user about a plan or design until every branch of the decision tree is resolved.
