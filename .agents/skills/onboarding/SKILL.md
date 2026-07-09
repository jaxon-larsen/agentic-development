---
name: onboarding
description: Bootstrap a repository as an agentic workspace by copying static instructions and dynamically tailoring context and agents templates.
disable-model-invocation: true
---

## Overview
Scan codebase and bootstrap project memory/agent configurations for developer collaboration.

## Instructions
### 1. Codebase Scan
Identify tech stack (manifests like `package.json`, `Cargo.toml`, etc.), project layout (tests, src entry points), and existing docs/READMEs.

### 2. Customize Project Memory
- Seed `.agents/memory/context.md`: technology stack, core domain glossary, and initial roadmap tasks.
- Customize `.agents/AGENTS.mdc` with discovered custom tools, run/test commands, or folder conventions.

### 3. User Review
Present updated files in chat. Grill user one question at a time to verify key terms or custom script options before completing.

## Output
- Bootstrapped `.agents/memory/context.md` project memory.
- Customized `.agents/AGENTS.mdc` rules.
- Initial backlog checklist in `.agents/memory/tasks.md`.

## References
- [onboarding-checklist.md](./resources/onboarding-checklist.md) - Checklist guiding scan parameters and structure maps.
