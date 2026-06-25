---
name: enhance-docs
description: Search the docs and reference the codebase to identify drift, flag ambiguities, outline concrete steps to simplify/restructure documentation, and interview the user to clarify the project's vision.
disable-model-invocation: true
---

# Enhance Docs

Audit project documentation against the codebase to identify drift, simplify doc structures, and align the development roadmap with the user's vision.

## Process

### 1. Explore

Read the repository's domain glossary (`CONTEXT.md`), files in the `docs/` folder, and scan the codebase to locate implemented features, modules, and API layers.

### 2. Generate Alignment Report

Write a structured report (do not edit files yet) detailing the following:

- **Doc-Code Drift:** Areas where the written documentation (specs, architecture, README) differs from what is actually implemented in the code.
- **Redundancy & Bloat:** Places where documentation duplicates itself, contains obsolete instructions, or is unnecessarily verbose.
- **Ambiguities & Gaps:** Underspecified requirements, missing edge cases, or unclear logic in the specifications.
- **Simplification Plan:** Concrete, actionable steps to reorganize, deduplicate, or restructure the docs (e.g., merging scattered notes into `CONTEXT.md`, archiving old plans).

*If no drift, bloat, or ambiguities are found, present a "Clean Alignment Report" and suggest proactive documentation improvements (e.g., adding guides for undocumented patterns, expanding glossary terms).*

### 3. Interview

Present the report to the user. Then, ask targeted clarifying questions **one at a time** to resolve the open concerns. 

For each question:
- Explain why the ambiguity matters.
- Provide your recommended resolution or design tradeoff.
- Wait for the user's answer before asking the next question.

### 4. Sync

Once the user confirms the decisions:
- Update `CONTEXT.md` (specifically the Core Domain Vocabulary and Active Tasks checklist) or relevant local documentation files to reflect the agreed-upon vision.
- Stage the updated documents for review.
