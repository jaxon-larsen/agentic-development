# Verification Guidelines & Evaluation Suite: {{PROJECT_NAME}}

> [!NOTE]
> **Purpose:** Reference instructions for test commands, environment configurations, and non-deterministic behavior rubrics.

---

## 🧪 Testing Standards

- **Unit Testing:** {{UNIT_TESTING_STANDARD}}
- **Integration Testing:** {{INTEGRATION_TESTING_STANDARD}}
- **End-to-End (E2E) Testing:** {{E2E_TESTING_STANDARD}}

---

## 💻 Verification Commands

List the commands required to run tests, format code, and lint the workspace:
* **Run Tests:** `{{TEST_COMMAND}}`
* **Run Linter:** `{{LINT_COMMAND}}`
* **Typecheck Code:** `{{TYPECHECK_COMMAND}}`

---

## ❓ Open Questions

- [ ] Question 1: [Short description of testing issue]

---

## 📊 Deterministic Tests vs. Trajectory Evals

- **Deterministic Tests:** Use standard unit/integration tests to verify deterministic input/output logic.
- **Trajectory Evals:** For non-deterministic or agentic behavior, write evaluation rubrics (eval suites) that score outputs on correctness, completeness, and adherence to constraints rather than exact string matching.
