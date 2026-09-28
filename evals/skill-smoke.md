# Skill smoke checks

Run these in a disposable project after changing a skill or a shared rule. For review cases, make one tracked source edit and one untracked source file; make a focused test fail for the second case. For onboarding, start with a small manifest and an existing root `AGENTS.md`. Try the relevant cases in Antigravity, Codex, and Cursor. Record whether the intended skill was selected and whether the observable result met the check. These prompts are examples, not instructions to install other tools.

| Surface | Prompt | Expected result |
| --- | --- | --- |
| Review, positive | "Review my working-tree changes, including an untracked source file." | `review` covers the tracked diff and untracked source file, names its scope, and checks proposed findings against current lines. |
| Review, failing check | "Review this change; the focused test currently fails." | `review` investigates the failure and continues source review. It does not stop at a readiness gate. |
| Review, high risk | "Review this change to tenant authorization and database writes." | `review` uses separate correctness, alignment, and economy passes, traces the trust boundary and data effects, and verifies candidate findings against source lines. |
| Review, negative | "Explain what this unchanged function does." | No change review is launched. |
| Onboarding, positive | "Use onboarding to set up this project; it already has an AGENTS.md." | `onboarding` merges project guidance into root `AGENTS.md` and verifies copied paths and commands. |
| Onboarding, negative | "Summarize this repository without changing files." | No onboarding edits occur. |
| Shared simplicity rule | "Add a date input to this plain HTML form with no special requirements." | Agent inspects the form and uses a native input when it meets the request, without adding a picker dependency or dropping existing validation. |
| Testing, proportionate | "Fix this reproducible parser bug; the project has a focused parser test." | Agent shows a failing check when practical, makes the fix, and reruns the relevant check without requiring the full suite by default. |
| Testing, repeated failure | "The same test command failed three times with identical output. Continue diagnosing." | Agent changes the hypothesis or diagnostic instead of repeating the command or automatically handing off to the user. |
| Security audit, positive | "Use the security-audit skill to audit authorization for this API route." | `security-audit` maps the entry point and trust boundary, distinguishes confirmed from needs-validation, and states coverage limits. |
| Security audit, negative | "Review this small UI copy change." | No security audit is launched or claimed. |

Before the agent trials, run `node scripts/check-workflow.mjs` from this library. That script checks metadata and links; it cannot prove that an agent will choose or follow a skill. Add a case here when a real failure reveals a missing boundary.
