# Code Review & Security Checklist

This document details guidelines for conducting PR Readiness, Standards, and Spec code reviews.

## 🚦 PR Readiness Criteria
- **Verification Commands:** Have all automated tests, linters, and typechecks passed cleanly without ignored errors?
- **Git Hygiene:** Are there untracked secret files (`auth.json`, `.env`), untracked build artifacts, or temporary scratch files?
- **Diff Focus:** Does the diff contain accidental edits, drive-by formatting changes, or orphan unused code?

## 🛡️ Security Review Criteria
- **Input Validation:** Are all external inputs properly validated and sanitized?
- **Sensitive Data Handling:** Are credentials, API keys, or private user data printed in logs or hardcoded in configurations?
- **Authentication & Authorization:** Are security checks enforced on all access points?
- **Memory & Resource Safety:** Are resources (file handles, database connections, locks) properly released?

## 📋 Standards & Correctness Criteria
- **Error Handling:** Are exceptions and errors caught and handled gracefully, or do they silently fail?
- **Code Style & Duplication:** Does the change follow the repository's styling guidelines? Are there opportunities to simplify or eliminate duplicated code?
- **Conventions:** Are the naming patterns, types, and module layouts matching existing paradigms?

## 🎯 Spec Adherence Criteria
- **Requirement Completeness:** Are all requirements from the task/PRD fully implemented?
- **Scope Control:** Does the code contain unnecessary additions or scope creep?
- **Edge Cases:** Are boundaries and failure paths accounted for in the implementation?

## 🏷️ Severity Level Definitions
- **Critical:** Security vulnerabilities, failing automated tests, severe performance degradations, data loss risks, or major logic bugs that block release.
- **Warn:** Deviations from standard practices, minor logical bugs, partial implementations, or potential maintenance issues.
- **Note:** Nits, minor readability suggestions, stylistic differences, or general observations.

## 🔍 80% Verification Audit
Beyond automated tests, audit implementations for conceptual bugs, edge cases, and security vulnerabilities that standard test suites might miss. Check for:
- Off-by-one errors, null/undefined edge cases, and boundary conditions.
- Race conditions or ordering assumptions in async code.
- Implicit trust of external inputs that bypass validation.
