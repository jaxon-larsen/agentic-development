---
name: security-audit
description: Audit code for exploitable trust-boundary failures when the user explicitly requests a security audit.
---

# Focused Security Audit

Use this skill only when the user explicitly requests a security audit. A routine code review may consider security, but it does not claim audit coverage. The audit is read-only unless the user also asks for fixes.

## Scope and coverage

1. Record the target paths, commit or worktree state, and any user-imposed limit. If none is given, select a bounded first pass around exposed entry points and say what is outside scope.
2. Map the relevant lower-trust inputs, trust boundaries, protected principals or resources, and controls. Inspect the code that enforces each control, not just its callers.
3. Keep a compact coverage table: surface and boundary, paths checked, attack class checked, and status (`covered`, `needs validation`, or `out of scope`). A checked file alone is not evidence that its boundary was checked.
4. Choose attack classes from the actual target: authorization and tenant isolation, injection, unsafe deserialization, secrets, supply chain, client-side trust, resource exhaustion, or other applicable paths. Do not run a generic checklist unrelated to this codebase.

## Finding discipline

For each candidate, identify the lower-trust principal, controllable input or action, intended control, source path to the sensitive operation, affected principal or resource, and concrete security result. Search for guards or deployment controls that could disprove the candidate. Combine duplicate symptoms of one root cause.

- **Confirmed:** The current source and, when needed, a bounded local check establish the boundary failure and its conditions. Assign severity from demonstrated impact and likelihood.
- **Needs validation:** A specific, source-grounded path remains plausible, but a decisive fact is unavailable. Name that fact and a safe way to check it. Do not assign severity.
- **Hardening:** A defense-in-depth improvement where an existing control prevents the proposed exploit. Do not call it a vulnerability.

For high-impact candidates, use an independent challenge pass when the active agent supports it and the user permits delegation. The challenger should try to disprove the source trace and impact before the finding is reported.

## Execution boundary

Prefer source inspection. Run unfamiliar target code, builds, fuzzers, or local repros only in an appropriate isolated environment without ambient credentials or external targets. Do not probe deployed services, production accounts, other users' data, or shared infrastructure. If safe local execution is unavailable, keep the dynamic claim under `Needs validation` and provide a bounded validation plan. Do not install dependencies solely to complete the audit.

## Report

State the exact source revision and scope. Report confirmed findings with file and line, trigger, boundary crossed, observed or source-proven result, conditions, severity rationale, and smallest effective fix. Separately list needs-validation leads, hardening notes, and the coverage table. Say which surfaces remain unreviewed. Never describe a scoped pass as a complete security assessment.
