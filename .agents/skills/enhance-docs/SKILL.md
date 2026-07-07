---
name: enhance-docs
description: Search the docs and reference the codebase to identify drift, flag ambiguities, outline concrete steps to simplify/restructure documentation, and interview the user to clarify the project's vision.
disable-model-invocation: true
---

# Enhance Docs

Audit project documentation against the codebase to identify drift, simplify doc structures, and align the development roadmap with the user's vision.

## Process

### 1. Explore

Read the repository's domain glossary (`.agents/memory/context.md`), files in the `docs/` folder, and scan the codebase to locate implemented features, modules, and API layers.

### 2. Generate Alignment Report

Write a structured report (do not edit files yet) detailing the following:

- **Doc-Code Drift:** Areas where the written documentation (specs, architecture, README) differs from what is actually implemented in the code.
- **Redundancy & Bloat:** Places where documentation duplicates itself, contains obsolete instructions, or is unnecessarily verbose.
- **Ambiguities & Gaps:** Underspecified requirements, missing edge cases, or unclear logic in the specifications.
- **Wiki Linter / Structural Health Check:** Scan for:
  - **Orphan Files:** Any `.md` files under `docs/` that are not linked from `docs/index.md` or any other `.md` files in `docs/`.
  - **Dead Markdown Links:** Relative links within markdown files that point to non-existent local files/directories.
  - **Glossary Gaps:** Capitalized domain terms, key jargon, or bolded terms (`**Term**`) appearing in the codebase or in `docs/` that are missing definitions in the `## 🗣️ Core Domain Vocabulary` section of `.agents/memory/context.md`.
  - **Stale Tasks:** Discrepancies between tasks checked as complete/incomplete in `.agents/memory/tasks.md` and their actual implementation status in the codebase.
- **Simplification Plan:** Concrete, actionable steps to reorganize, deduplicate, or restructure the docs (e.g., merging scattered notes into `.agents/memory/context.md` or relevant files in `docs/`, archiving old plans, or resolving linter warnings).

_If no drift, bloat, or ambiguities are found, present a "Clean Alignment Report" and suggest proactive documentation improvements (e.g., adding guides for undocumented patterns, expanding glossary terms)._

### 3. Interview

Present the report to the user. To resolve the open concerns and clarify the project's vision, invoke the grilling protocol (the `/grill` command process):

- For each question, explain why it matters, present design trade-offs, and suggest a recommended option.
- Summarize session notes in the chat as decisions crystallize.
- Wait for the user's response before asking the next question.

### 4. Sync

Once the user confirms the decisions:

- Update `.agents/memory/context.md` (specifically the Core Domain Vocabulary) and `.agents/memory/tasks.md` (Active Tasks roadmap), or relevant documentation files in `docs/` to reflect the agreed-upon vision.
- Present the updated documents to the user for review.
