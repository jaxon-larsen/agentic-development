---
name: grilling
description: Probe and clarify — ask questions about docs, code, or both until understanding is sharp. Does not edit project files.
disable-model-invocation: true
---

# Grilling

Interview the user to expand, clarify, or stress-test understanding. **Questions only** — do not edit docs, code, or CONTEXT.md during this skill.

Works on fuzzy plans, existing documentation, code behavior, or gaps between them.

## Process

1. **Establish focus.** What are we grilling — a plan, a doc, a code area, or a mismatch between docs and code? Ask if unclear.

2. **Read first.** Before questioning, read the relevant docs (`CONTEXT.md`, `docs/`, `README`) and code so questions are specific, not generic.

3. **One question at a time.** Wait for an answer before the next. Multiple questions at once is bewildering.

4. **Probe both sides.** When docs exist, ask whether they match reality. When code exists, ask what it *should* mean in domain terms. Cross-reference: "The doc says X; the code does Y — which is right?"

5. **Recommend an answer** with each question when you have a view — but the user's answer is authoritative.

6. **Stress-test with scenarios.** Invent edge cases that force precision about boundaries between concepts.

7. **Prefer codebase exploration over asking** when the answer is discoverable in the repo.

## Session notes

As decisions land, summarize them clearly in the chat conversation. These session notes record requirements and agreements for immediate reference — they are not a substitute for proper documentation.

Notes format:

```md
# Grill session — {date or topic}

## Focus
…

## Resolved terms
- **Term**: definition the user confirmed

## Open questions
- …

## Doc/code mismatches (unresolved)
- …

## Suggested refactors
- …
```

Keep notes terse. Do not duplicate full doc content.

## When done

Summarize what was resolved and what's still open. If terms were nailed down, recommend updating `CONTEXT.md` to keep the domain glossary synchronized.
