---
name: onboarding
description: Bootstrap a repository as an agentic workspace by copying static instructions and dynamically tailoring context and agents templates.
disable-model-invocation: true
---

## Overview
Scan codebase, substitute template placeholders (`{{...}}`), and bootstrap project memory/agent configurations for developer collaboration.

## Instructions
### 1. Codebase Scan
Identify tech stack (manifests like `package.json`, `Cargo.toml`, `go.mod`, `pyproject.toml`), project layout (tests, src entry points), and existing docs/READMEs.

### 2. Tailor Template Placeholders (`{{...}}`)
Systematically inspect and replace template tokens across workspace files:
- **`docs/*.md`**: Replace `{{PROJECT_NAME}}`, `{{PRIMARY_LANGUAGE}}`, `{{FRONTEND_FRAMEWORK}}`, `{{BACKEND_FRAMEWORK}}`, `{{TEST_COMMAND}}`, `{{LINT_COMMAND}}`, `{{TYPECHECK_COMMAND}}`.
- **`.agents/memory/context.md`**: Populate domain vocabulary and tech stack gotchas while enforcing the ~100-line Memory Hygiene Policy.
- **`.agents/AGENTS.mdc`**: Tailor rules, custom scripts, and folder index mappings.
- **`.agents/memory/tasks.md`**: Seed initial discovery and setup checklist tasks.

### 3. User Review & Grilling
Present updated files in chat. Grill user one question at a time to verify key terms, custom script options, or architectural boundaries before completing.

## Output
- Fully tailored `docs/` knowledge base (`index.md`, `architecture.md`, `technical.md`, `testing.md`).
- Bootstrapped `.agents/memory/context.md` project memory with memory hygiene guidelines.
- Customized `.agents/AGENTS.mdc` rules and entry points.
- Initial backlog checklist in `.agents/memory/tasks.md`.

## References
- [onboarding-checklist.md](./resources/onboarding-checklist.md) - Step-by-step checklist guiding scan parameters, token substitution, and structure maps.
