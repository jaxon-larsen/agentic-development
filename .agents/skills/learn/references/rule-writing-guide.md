# Agentic Rule Writing Guide

Best practices for extracting learnings and codifying them as workspace memory or active rules.

## 🧠 Memory vs. Rules
- **Memory (`context.md`)**: Lives as dynamic context. Ideal for project description, tech stacks, developer preferences, glossary terms, resolved issues, and troubleshooting gotchas.
- **Rules (`rules/*.mdc` or `AGENTS.mdc`)**: Lives as static policies. Enforces strict guidelines that must be applied across sessions (e.g., git conventions, artifact requirements, styling constraints, testing workflows).

## 📝 Writing Effective Rules & Memory
- **Be Specific & Actionable:** Provide clear code snippets, folder targets, or command patterns. Avoid vague instructions (e.g., "be careful with database calls").
- **Maintain Token Economy:** Keep descriptions compact. Reference external documents for large checklists.
- **Merge, Don't Duplicate:** When adding new learnings, search the existing files first. Merge related points into one clean instruction.
- **Format Clearly:** Use lists, tables, code blocks, and markdown alerts (`[!NOTE]`, `[!WARNING]`) to highlight important rules.
