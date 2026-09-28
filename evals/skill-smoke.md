# Skill smoke checks

Run these in a disposable project after changing a skill or a shared rule. For review cases, make one tracked source edit and one untracked source file; make a focused test fail for the second case. For onboarding, start with a small manifest and an existing root `AGENTS.md`. For spec-architect, include one prior design statement that a new user answer contradicts. Try the relevant cases in Antigravity, Codex, and Cursor. Record whether the intended skill was selected and whether the observable result met the check. These prompts are examples, not instructions to install other tools.

| Surface | Prompt | Expected result |
| --- | --- | --- |
| Review, positive | "Review my working-tree changes, including an untracked source file." | `review` covers the tracked diff and untracked source file, names its scope, and checks proposed findings against current lines. |
| Review, failing check | "Review this change; the focused test currently fails." | `review` investigates the failure and continues source review. It does not stop at a readiness gate. |
| Review, high risk | "Review this change to tenant authorization and database writes." | `review` uses separate correctness, alignment, and economy passes, traces the trust boundary and data effects, and verifies candidate findings against source lines. |
| Review, downstream consumer | "Review this shared response schema change; two clients consume it." | `review` checks a consequential assumption in each affected client with focused evidence, beyond listing direct callers. |
| Review, negative | "Explain what this unchanged function does." | No change review is launched. |
| Onboarding, positive | "Use onboarding to set up this project; it already has an AGENTS.md." | `onboarding` merges project guidance into root `AGENTS.md` and verifies copied paths and commands. |
| Onboarding, negative | "Summarize this repository without changing files." | No onboarding edits occur. |
| Shared simplicity rule | "Add a date input to this plain HTML form with no special requirements." | Agent inspects the form and uses a native input when it meets the request, without adding a picker dependency or dropping existing validation. |
| Testing, proportionate | "Fix this reproducible parser bug; the project has a focused parser test." | Agent shows a failing check when practical, makes the fix, and reruns the relevant check without requiring the full suite by default. |
| Testing, direct evidence | "Change this form's submit behavior and verify it." | Agent exercises the submit path when practical, states what was observed, and names any untested path without claiming the build alone proves behavior. |
| Testing, repeated failure | "The same test command failed three times with identical output. Continue diagnosing." | Agent changes the hypothesis or diagnostic instead of repeating the command or automatically handing off to the user. |
| Debugging, repeated pattern | "Fix this parser bug; a second parser uses the same helper." | `debug-systematically` checks the closely related path, fixes the shared cause, and reports unrelated matches without broadening the task. |
| Security audit, positive | "Use the security-audit skill to audit authorization for this API route." | `security-audit` maps the entry point and trust boundary, distinguishes confirmed from needs-validation, and states coverage limits. |
| Security audit, negative | "Review this small UI copy change." | No security audit is launched or claimed. |
| Spec architect, positive | "Use spec-architect to grill me about this project's architecture and contracts." | Agent asks successive, grounded question rounds, surfaces the contradictory answer, records a behavioral success case and verification seam, and updates living design docs without inventing a phased roadmap. |
| Spec architect, boundary | "Use spec-architect to decide whether this data flow crosses the service boundary." | Agent records the decided boundary, links existing source, and labels planned or uncertain relationships. It adds a diagram only if one clarifies the decision. |
| Spec architect, negative | "Fix this typo in the README." | No spec interview begins. |
| Expand from docs, positive | "Use expand-from-docs to plan the next implementation phase from these specs." | Agent identifies unimplemented specs and proposes phased work with verification criteria; it records milestones after approval. |
| Orchestrate, positive | "Use orchestrate to split this API and scoring engine across two agents. The repo already has shared types and focused tests." | Agent accepts prose input, assigns disjoint ownership, reuses existing types and checks, and gives each agent a ready-to-use prompt plus an integration check without unnecessary scaffolding. |
| Orchestrate, phased handoff | "Use orchestrate to split a data module and its consumer across separate agent checkouts; the repo forbids agent commits, has a tests/ directory, and has no isolated tests yet." | Agent names who transfers phase-one files, when the consumer may start, and the check at that point; it places needed scaffolding in the existing test layout without asking for a folder path. |
| Architecture, one viable seam | "Use improve-codebase-architecture to assess this shallow wrapper; the callers all need the same operation." | Agent presents the meaningful design and trade-offs without forcing three variants or spawning agents. |
| Learn, no durable lesson | "Use learn after this routine rename and passing tests; no new project fact or next action emerged." | `learn` explains why no memory or task file changed. |
| Learn, recurring mistake | "Use learn: this same agent error has happened in two projects; here is the verified cause in each." | `learn` records qualifying project facts and suggests a scoped shared rule or skill change without silently editing the framework. |

Before the agent trials, run `node scripts/check-workflow.mjs` from this library. That script checks metadata and links; it cannot prove that an agent will choose or follow a skill. Add a case here when a real failure reveals a missing boundary.
