# Agent Configuration & Workspace Rules

This file guides AI coding assistants (including Cursor and Antigravity) in this workspace.

---

## 📋 Core Setup Instructions

Assimilate these files before initiating work:
1.  **[INSTRUCTIONS.md](./INSTRUCTIONS.md):** Overall behavioral guidelines, coding principles, testing, and collaboration protocols. (Never modify this file per-project).
2.  **[CONTEXT.md](./CONTEXT.md):** High-level context of this project, technology stack, domain glossary, and active task tracker.

---

## 🛠️ Workspace Structure & Documentation

Adhere to the project's documentation layouts:
- All detailed guides, architecture maps, and technical specs live in the [docs/](./docs/) directory.
- Documented complex bug investigations live in [fixes/](./fixes/).

---

## 🤖 Active Agent Commands & Skills

If custom skills are loaded in `.agents/skills/`, you can trigger them via their respective slash commands:
- `/grill` — Trigger a relentless interview session to stress-test a design before implementing.
- `/review` — Perform a two-axis review of standards and specs for the current diff.
- `/improve-codebase-architecture` — Scan the codebase for shallowness and refactoring opportunities.
- `/prototype` — Build a throwaway prototype for state, business-logic, or UI design questions.
- `/handoff` — Compact the current conversation for another session to bridge contexts.
- `/enhance-docs` — Audit doc-code drift, identify ambiguities, and grill to clarify vision.
- `/expand-from-docs` — Identify gaps, interview user on next phase, and create execution plans.

---

## 🗣️ Communication Protocols

- **Standard Check-in:** Before generating large edits or major code blocks, check in with the user:
  > "Confirming understanding: I've reviewed [specific document/previous context]. The goal is [task goal], adhering to [key pattern/constraint]. Proceeding with [planned step]."
- **Suggest vs. Apply:** Use "Suggestion:" for draft suggestions or "Applying fix:" for direct edits.
