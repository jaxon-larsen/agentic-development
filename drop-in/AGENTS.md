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

---

## 🤖 Active Agent Commands & Skills

Custom skills are loaded dynamically from the workspace's `.agents/skills/` (for Antigravity) or `.cursor/skills/` (for Cursor) directories. 

To discover what slash commands are available in this workspace or suggest them to the user:
1. Scan the subdirectories of `.agents/skills/` (each folder name corresponds to a command, e.g., `/grill` or `/enhance-docs`).
2. Read the corresponding `SKILL.md` file in each folder to understand its parameters, description, and workflow.

---

## 🗣️ Communication Protocols

- **Standard Check-in:** Before generating large edits or major code blocks, check in with the user:
  > "Confirming understanding: I've reviewed [specific document/previous context]. The goal is [task goal], adhering to [key pattern/constraint]. Proceeding with [planned step]."
- **Suggest vs. Apply:** Use "Suggestion:" for draft suggestions or "Applying fix:" for direct edits.
