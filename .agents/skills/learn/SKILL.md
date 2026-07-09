---
name: learn
description: Audit the recent session history to extract domain terms, library conventions, or troubleshooting tips and persist them to context.md and technical.md.
disable-model-invocation: true
---

## Overview
Analyze recent conversation, diffs, and decisions to update living repository memory.

## Instructions
### 1. Audit Session
Review conversation, git diffs, and grill notes. Extract:
- **Domain Vocabulary:** Resolved concepts, entity names, or terms.
- **Troubleshooting:** Tool version fixes, gotchas, configuration blocks, or compiler flags.
- **Roadmap:** Completed tasks or new backlog items.
- **Conventions:** Styles, folder limits, type guidelines, or test setups.

### 2. Update Memory Files
- Update `.agents/memory/context.md` (Vocabulary, Stack, Troubleshooting, Preferences, Corrections sections).
- Update `.agents/memory/tasks.md` checklist milestones.
- Do not add specific vocabulary or gotchas directly to `AGENTS.mdc`.

### 3. Review Diffs
- Present updated `.agents/memory/context.md` and `.agents/memory/tasks.md` diffs in chat and explain what was learned.

## Output
- Markdown diff of updates in `context.md` and `tasks.md`.
- Summary of lessons extracted.

## References
- [rule-writing-guide.md](./references/rule-writing-guide.md) - Guidelines for writing effective rules and memory updates.
