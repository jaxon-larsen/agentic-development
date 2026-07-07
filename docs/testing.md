# Verification Guidelines & Evaluation Suite

> [!NOTE]
> **Purpose:** Reference instructions for test commands, environment configurations, and non-deterministic behavior rubrics.

---

## 🧪 Testing Standards

- **Unit Testing:** [e.g., Target components, utilities, and helper functions in isolation]
- **Integration Testing:** [e.g., Test endpoint integrations, database workflows, and multi-component pipelines]
- **End-to-End (E2E) Testing:** [e.g., Crucial user paths and full UI workflows]

---

## 💻 Verification Commands

List the commands required to run tests, format code, and lint the workspace:
* **Run Tests:** `[command]`
* **Run Linter:** `[command]`
* **Typecheck Code:** `[command]`

---

## 🤖 Evaluation Rubric (Agent Evals)

For projects implementing LLMs or agentic workflows, define the criteria and evaluation rubrics for testing non-deterministic behavior:
- **[Task/Flow Name]:**
  - *Input Scenario:* [Description of test input]
  - *Evaluation Criteria:* [What constitutes a success or failure, constraints, model guidelines]
  - *Evaluation Commands:* `[command]`

---

## ❓ Open Questions

- *What test coverage gaps or testing framework bottlenecks exist?*
- [ ] Question 1: [Short description of testing issue]

---

## 🚀 Next Steps

- *Planned test coverage additions or evaluation suite build-outs.*
- [ ] Task 1: [Short description of testing roadmap task]
