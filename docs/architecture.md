# System Architecture: {{PROJECT_NAME}}

> [!NOTE]
> **Purpose:** Reference diagrams and maps detailing system layout, component relationships, and data flows.

Add a Mermaid diagram only when it clarifies a real architectural boundary or data flow. Cite the files or configuration that establish existing relationships, and label planned or uncertain links explicitly.

---

## 🗺️ High-Level System Overview

Summarize meaningful components and relationships for {{PROJECT_NAME}}. Add a diagram here when it makes those relationships easier to understand.

**Evidence and limits:** Link the source for non-obvious nodes and connections. Record any relationship that still depends on deployment configuration or another unverified fact.

---

## 📦 Core Domain Boundaries

Identify the core domains, services, or modules that make up {{PROJECT_NAME}}:
- **{{DOMAIN_BOUNDARY_1}}:** {{DOMAIN_BOUNDARY_1_DESCRIPTION}}
- **{{DOMAIN_BOUNDARY_2}}:** {{DOMAIN_BOUNDARY_2_DESCRIPTION}}

---

## 🔄 Data Flow & State Transitions

Describe how data moves through the system during a key transaction or action:
1. **Step 1:** User triggers an event.
2. **Step 2:** State transitions or API triggers occur.
3. **Step 3:** Persistent changes are saved to storage.

---

## ❓ Open Questions

- [ ] Question 1: {{ARCHITECTURAL_QUESTION_1}}
