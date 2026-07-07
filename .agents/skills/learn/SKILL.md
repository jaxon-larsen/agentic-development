---
name: learn
description: Audit the recent session history to extract domain terms, library conventions, or troubleshooting tips and persist them to context.md and technical.md.
disable-model-invocation: true
---

# Learn (Persist Session Learnings)

Analyze recent conversation history, code changes, and resolved design decisions to update the workspace's living memory.

## Process

### 1. Audit Session History
Review the current conversation history, git diffs, and resolved grill session notes to extract:
* **Domain Vocabulary:** Newly resolved terms, names, API identifiers, or business entities.
* **Troubleshooting Steps:** Resolving tool version issues, compiler flags, configuration bugs, or environment setup gotchas.
* **Roadmap Updates:** Checked-off checklist items or newly identified backlog ideas.
* **Technical Guidelines:** Code styles, directory constraints, interface choices, or typing exceptions.

* **context.md:** Update the `Technology Stack`, `Core Domain Vocabulary`, `Troubleshooting`, `General Preferences`, or `Past Corrections` sections when new terms, preferences, gotchas, or stack parameters are defined.
* **tasks.md:** Check off completed tasks and update the active sprint roadmap milestones.

### 4. Keep Agent Configuration Broad (`AGENTS.mdc`)
* **CRITICAL:** Do not add specific vocabulary words, troubleshooting steps, or minor style choices into `AGENTS.mdc` (or `.agents/AGENTS.mdc`). 
* Keep `AGENTS.mdc` focused strictly on broad, overall workspace instructions, high-level boundaries, and tool definitions.

### 5. Final User Review
* Present the updated markdown diffs to the user in chat.
* Explain what terms, rules, or roadmap changes were learned and why they were placed in their respective files.
* Prompt the user to stage and commit the updated memory files.
