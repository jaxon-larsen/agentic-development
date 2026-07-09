---
name: improve-codebase-architecture
description: Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you pick.
disable-model-invocation: true
---

## Overview
Surface codebase design issues and propose refactoring opportunities to deepen modules (leveraging seams and locality for testability).

## Instructions
### 1. Explore
Read `.agents/memory/context.md` glossary and run organic codebase scans. Note structural issues:
- Shallow modules (complex interface relative to logic).
- Logic scattered across too many small files (poor locality).
- Mismatched or leaky abstractions.
- Apply the **deletion test**: would deleting the module concentrate complexity, or just disperse it?

### 2. Present HTML Report
Write a self-contained HTML report to the OS temp directory (`$TMPDIR`, `/tmp`, or `%TEMP%`) named `architecture-review-<timestamp>.html` and open it (`start`/`open`/`xdg-open`).
The report must:
- Use Tailwind and Mermaid CDNs.
- Present each refactor candidate with: Files involved, Problem statement, Proposed solution, Benefits, and Before/After diagram.
- Rank candidates by recommendation strength (`Strong`, `Worth exploring`, `Speculative`).
- Present a single **Top recommendation**.
Ask user: "Which of these would you like to explore?"

### 3. Grilling & Update
Once the user selects a candidate, run `/grilling` to align on boundaries and tests.
- Update `.agents/memory/context.md` glossary with new/sharpened concepts.
- Create execution plan and run approved changes.

## Output
- Visual HTML report opened on user's system.
- Glossary updates in `.agents/memory/context.md`.
- Codebase design improvements.

## References
- [HTML-REPORT.md](./HTML-REPORT.md) - Standard HTML report scaffold, design guidelines, and Tailwind/Mermaid patterns.
- [architecture-patterns.md](./references/architecture-patterns.md) - Reference list of modular software design principles and common anti-patterns.
