# Code Review & Security Checklist

This document details guidelines for conducting Standards & Spec code reviews.

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
- **Critical:** Security vulnerabilities, severe performance degradations, data loss risks, or major logic bugs that block release.
- **Warn:** Deviations from standard practices, minor logical bugs, partial implementations, or potential maintenance issues.
- **Note:** Nits, minor readability suggestions, stylistic differences, or general observations.
