# Agent Memory: {{PROJECT_NAME}}

> [!NOTE]
> **Purpose:** Living agent memory storing domain vocabulary, user preferences, corrections, out-of-scope boundaries, and memory hygiene rules.

---

## 🗣️ Core Domain Vocabulary

Define project-specific terminology and naming rules here (use explicit Avoid/Use mappings):
- **{{DOMAIN_TERM_1}}:** [Canonical definition and usage rules]
  - *Avoid:* [Deprecated, ambiguous, or confusing terms to avoid]
- **{{DOMAIN_TERM_2}}:** [Canonical definition and usage rules]
  - *Avoid:* [Deprecated, ambiguous, or confusing terms to avoid]

---

## 🚫 Out of Scope & Non-Goals

Define hard architectural boundaries, unrequested features, and design non-goals here to prevent speculative complexity:
- **{{NON_GOAL_1}}:** [Description of what this project explicitly does NOT do or support]
- **{{NON_GOAL_2}}:** [Description of architecture/design anti-patterns to avoid]

---

## 📋 Preferences & Corrections

### General Preferences
- **Pacing:** Be concise, direct, and factual. Focus on problem-solving without emotional validation.

### Past Corrections
- *[Record corrected mistakes here so future agent runs do not repeat them]*

---

## ⚠️ Pitfalls & Troubleshooting

Record stack-specific gotchas, common error resolutions, and local developer setup tips here:
- **{{COMMON_GOTCHA}}:** [How to resolve / work around it]

---

## 🧼 Memory Hygiene Policy

- **Target Size:** Keep this document focused, high-density, and under ~100 lines.
- **Pruning & Summarization:** Stale corrections or resolved one-off setup issues should be pruned or consolidated during `/learn` or `/onboarding`.
- **High-Signal Knowledge:** Only record rules, preferences, and gotchas that apply across sessions. Avoid recording transient task details (use `tasks.md` for task state).
