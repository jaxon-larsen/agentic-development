---
name: onboarding
description: Bootstrap a repository as an agentic workspace by copying static instructions and dynamically tailoring context and agents templates.
disable-model-invocation: true
---

# Onboarding

Initialize a codebase for AI agent collaboration by establishing the Harness (rule configurations, tools, and living project memory).

## Process

### 1. Codebase Scan
- Scan the target repository to detect:
  - **Technology Stack:** package managers, frameworks, and database setups (e.g., parsing `package.json`, `Cargo.toml`, `requirements.txt`).
  - **Project Layout:** folder structure, test paths, and entry points.
  - **Existing Guidelines:** read existing `README` or documentation index files.

### 2. Install Static Guidelines
- Copy the behavioral guideline template **`INSTRUCTIONS.mdc`** directly into the project root.
- **CRITICAL:** Do not modify `INSTRUCTIONS.mdc`. It must remain static and uniform across all projects.

### 3. Customize Project Context & Rules
- Copy **`drop-in/CONTEXT.md`** and **`drop-in/AGENTS.mdc`** into the project.
- Dynamically customize the copied templates to align with the codebase scan:
  - Populate the *Technology Stack* list in `CONTEXT.md` with detected libraries and frameworks.
  - Seed the *Core Domain Vocabulary* in `CONTEXT.md` with key terms extracted from the codebase's readme/structure.
  - Build the initial *Active Tasks & Roadmap* checklist.

### 4. User Review
- Present the customized `CONTEXT.md` and `AGENTS.mdc` to the user in the chat.
- Ask targeted questions **one at a time** (following the `/grill` protocol) to verify domain glossary terms, coding conventions, or custom tools before wrapping up.
- Tell the user they can now manually stage and commit the new files.
