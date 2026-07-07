---
name: onboarding
description: Bootstrap a repository as an agentic workspace by copying static instructions and dynamically tailoring context and agents templates.
disable-model-invocation: true
---

# Onboarding

Configure and customize a newly bootstrapped repository for agent collaboration by tailoring the living project memory (`.agents/memory/context.md`) and agent configuration to fit the scanned codebase.

## Process

### 1. Codebase Scan
- Scan the repository to detect:
  - **Technology Stack:** package managers, frameworks, and database setups (e.g., parsing `package.json`, `Cargo.toml`, `requirements.txt`).
  - **Project Layout:** folder structure, test paths, and entry points.
  - **Existing Guidelines:** read existing `README` or documentation index files.

### 2. Customize Project Memory (`.agents/memory/context.md`)
- Tailor **`.agents/memory/context.md`** to align with the codebase scan:
  - Populate the *Technology Stack* list with detected libraries and frameworks.
  - Seed the *Core Domain Vocabulary* with key terms extracted from the codebase's readme/structure.
  - Build the initial *Active Tasks & Roadmap* checklist based on the project's state.

### 3. Customize Agent Rules (`.agents/AGENTS.mdc`)
- Tailor **`.agents/AGENTS.mdc`** with any project-specific conventions, test scripts, or tool configurations discovered.

### 4. User Review
- Present the customized `.agents/memory/context.md` and `.agents/AGENTS.mdc` to the user in the chat.
- Ask targeted questions **one at a time** (following the `/grill` protocol) to verify domain glossary terms, coding conventions, or custom tools before wrapping up.
- Inform the user that they can now manually stage and commit the customized onboarding files.
