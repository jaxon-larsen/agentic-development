# System Architecture: {{PROJECT_NAME}}

> [!NOTE]
> **Purpose:** Describe system boundaries, component relationships, and data flows with source evidence.

Cite the files or configuration that establish existing relationships, and label planned or uncertain relationships explicitly.
Add a Mermaid diagram when it makes a boundary, relationship, or data flow easier to understand. Keep it consistent with the text and source evidence.

---

## 🗺️ High-Level System Overview

Summarize meaningful components and relationships for {{PROJECT_NAME}}. Use prose by default and a diagram when it adds clarity.

**Evidence and limits:** Link the source for non-obvious components and relationships. Record any relationship that still depends on deployment configuration or another unverified fact.

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
