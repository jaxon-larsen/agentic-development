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
- **`docs/*.md` when copied or requested**: Replace `{{PROJECT_NAME}}`, `{{PRIMARY_LANGUAGE}}`, `{{FRONTEND_FRAMEWORK}}`, `{{BACKEND_FRAMEWORK}}`, `{{TESTING_FRAMEWORK}}`, `{{TEST_COMMAND}}`, `{{LINT_COMMAND}}`, `{{TYPECHECK_COMMAND}}`, `{{DOMAIN_BOUNDARY_*}}` (see [onboarding-checklist.md](./resources/onboarding-checklist.md)). Replace or remove the example Mermaid graph in `docs/architecture.md` using actual source evidence. Do not create the full docs set solely to complete onboarding.
- **`.agents/memory/context.md`**: Populate domain vocabulary and tech stack gotchas while enforcing the ~100-line Memory Hygiene Policy.
- **`AGENTS.md`**: Merge with any existing root `AGENTS.md` instead of overwriting it. Keep a short project-specific entry point to relevant rules, skills, docs, and verification commands. Remove references to templates the project did not copy.
- **`.agents/memory/tasks.md`**: Seed only actionable discovery or setup work that remains after onboarding.

### 3. Verify and Clarify
Check that root `AGENTS.md` links resolve, listed commands exist, and any populated docs match the source inspected. Present the updated files and assumptions. Ask about only unresolved choices that would materially change the result; complete the discoverable setup without a mandatory interview.

## Output
- Tailored `docs/` knowledge base when those templates were copied or requested.
- Bootstrapped `.agents/memory/context.md` project memory with memory hygiene guidelines.
- Customized root `AGENTS.md` entry point.
- Actionable remaining-work checklist in `.agents/memory/tasks.md`.

## References
- [onboarding-checklist.md](./resources/onboarding-checklist.md) - Step-by-step checklist guiding scan parameters, token substitution, and structure maps.
