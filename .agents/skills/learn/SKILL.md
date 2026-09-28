---
name: learn
description: Extract domain terms and gotchas from the session and persist to context.md.
disable-model-invocation: true
---

## Overview
Analyze recent conversation, diffs, and decisions for durable knowledge future agents would otherwise have to rediscover. Write nothing when the final code, tests, or existing docs already make the lesson clear.

## Instructions
### 1. Audit Session
Review conversation, git diffs, and grill notes. Consider:
- **Domain Vocabulary:** Resolved concepts, entity names, or terms.
- **Troubleshooting:** Verified causes, tool version fixes, gotchas, configuration blocks, or compiler flags likely to recur.
- **Roadmap:** Actionable remaining work when the session actually creates or changes it.
- **Conventions:** Styles, folder limits, type guidelines, or test setups.

Keep a lesson only if it is verified, not already easy to recover from the repository, and likely to prevent a repeated mistake or substantial rediscovery. Do not preserve a transcript of work merely because it took effort.

### 2. Update Memory Files
- Update `.agents/memory/context.md` only for qualifying project knowledge (Vocabulary, Stack, Troubleshooting, Preferences, Corrections sections).
- Update `.agents/memory/tasks.md` only when an existing milestone changed or a concrete next action remains.
- Do not add specific vocabulary or gotchas directly to root `AGENTS.md`.
- If the same agent mistake has recurred across projects, propose a narrowly scoped shared rule or skill change for the user to choose. Keep the project-specific evidence in project memory; do not change the shared framework as a side effect of this skill.

### 3. Review Diffs
- Present diffs for files actually updated and explain what was learned. If nothing qualifies, say why no file changed.

## Output
- Diffs for updated memory files, if any.
- Summary of qualifying lessons, or why none qualified.

## References
- [rule-writing-guide.md](./references/rule-writing-guide.md) - Guidelines for writing effective rules and memory updates.
