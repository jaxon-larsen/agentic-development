# Code Review & Security Checklist

Guidelines for PR Readiness, Standards, Spec, and Simplicity code reviews.

## 🚦 PR Readiness Criteria
- **Verification:** All automated tests, linters, and typechecks pass cleanly without ignored errors.
- **Git Hygiene:** No untracked secrets (`auth.json`, `.env`), build artifacts, or temporary scratch files.
- **Diff Focus:** No accidental edits, drive-by formatting changes, or orphaned code.

## 🛡️ Security Criteria
- **Input Sanitization:** External inputs validated and sanitized at trust boundaries.
- **Sensitive Data:** Credentials, API keys, or PII never printed in logs or hardcoded.
- **Access Control:** Security and role checks enforced on all server endpoints.
- **Resource Safety:** File handles, database connections, and locks properly released.

## 📏 Standards & Correctness Criteria
- **Error Handling:** Exceptions caught and handled gracefully; no silent swallowed errors.
- **Styling & Layout:** Compliance with `.agents/rules/` and glossary conventions in `context.md`.
- **Conventions:** Naming patterns, types, and module layouts match existing repository paradigms.

## 🎯 Spec Adherence Criteria
- **Requirement Completeness:** All tasks and PRD criteria fully implemented.
- **Scope Control:** No unrequested features, speculative extensions, or scope creep.
- **Edge Cases:** Boundary conditions and failure paths correctly handled.

## ✂️ Simplicity & Minimalism Criteria
- **YAGNI (You Aren't Gonna Need It):** No speculative features, unused parameters, dead code, or unrequested flexibility.
- **DRY (Don't Repeat Yourself):** No copy-pasted logic or redundant utility functions.
- **Shallow Abstractions:** No pass-through wrappers, single-use classes, or over-engineered interfaces.
- **Deletion Test:** Can any newly added class, helper, or layer be removed or merged into a deeper interface without losing functionality?

## 🏷️ Severity Level Definitions
- **Critical:** Security vulnerabilities, failing tests, severe performance regressions, data loss risks, or major logic bugs that block release.
- **Warn:** Deviations from standard practices, minor logic bugs, partial implementations, or maintenance debt.
- **Note:** Nits, minor readability suggestions, stylistic differences, or observations.

## 🔍 80% Verification Audit
Audit implementations beyond standard unit tests:
- Off-by-one errors, null/undefined edge cases, and boundary conditions.
- Race conditions or ordering assumptions in async/concurrent code.
- Implicit trust of external inputs that bypass validation.
