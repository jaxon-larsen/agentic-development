# Agentic Rule Writing Guide

Best practices for extracting learnings and codifying them as workspace memory or active rules.

## 🧠 Memory vs. Rules
- **Memory (`context.md`)**: Lives as dynamic context. Ideal for project description, tech stacks, developer preferences, glossary terms, resolved issues, and troubleshooting gotchas.
- **Rules (`rules/*.md`)**: Shared, scoped policies for git conventions, styling, testing, and other recurring behavior.
- **Root `AGENTS.md`**: A short project entry point that routes agents to relevant rules, skills, docs, and commands. Keep project facts in memory instead.

## 📝 Writing Effective Rules & Memory
- **Be Specific & Actionable:** Provide clear code snippets, folder targets, or command patterns. Avoid vague instructions (e.g., "be careful with database calls").
- **Maintain Token Economy:** Keep descriptions compact. Reference external documents for large checklists.
- **Merge, Don't Duplicate:** When adding new learnings, search the existing files first. Merge related points into one clean instruction.
- **Promote Deliberately:** A verified mistake repeated across projects may justify suggesting a shared rule or skill change. Keep one-project facts in that project's memory and make shared changes only as a separate, chosen workflow update.
- **Format Clearly:** Use lists, tables, code blocks, and markdown alerts (`[!NOTE]`, `[!WARNING]`) to highlight important rules.
