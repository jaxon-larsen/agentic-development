---
name: grilling
description: Probe and clarify — ask questions about docs, code, or both until understanding is sharp. Does not edit project files.
disable-model-invocation: true
---

# Grilling

Interview the user to expand, clarify, or stress-test understanding. **Questions only** — do not edit docs, code, or `.agents/memory/context.md` during this skill.

Works on fuzzy plans, existing documentation, code behavior, or gaps between them.

## Process

1. **Establish focus & map the design tree.** What are we grilling — a plan, a doc, a code area, or a mismatch? Map out the logical choices as a hierarchical "design tree" (resolve high-level core dependencies first, then move to details).

2. **Read first.** Before questioning, read the relevant docs (`.agents/memory/context.md`, `docs/`, `README`) and code so questions are specific, not generic.

3. **One question at a time.** Walk down the design tree asking questions one by one. Do not overwhelm the user with multiple concurrent questions.
   * **Agent-Neutral Tooling:** 
     * *Interactive Clients (e.g. Antigravity):* If the environment provides an interactive choice tool (such as the `ask_question` tool), you **must** use it to ask questions and present multiple-choice options. This keeps the chat clean and blocks execution until the user submits feedback.
     * *Text-Based Clients (e.g. Cursor, standard chat):* Write questions directly in the chat window, formatting options as numbered lists, and pause execution until the user replies.

4. **Probe both sides.** When docs exist, ask whether they match reality. When code exists, ask what it *should* mean in domain terms. Cross-reference: "The doc says X; the code does Y — which is right?"

5. **Recommend an answer.** 
   * When calling `ask_question` or listing options in chat, always place your recommended option **first** in the list.
   * Prefix the option text with `(Recommended)` and explain why it is recommended.

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

Summarize what was resolved and what's still open. If terms were nailed down, recommend updating `.agents/memory/context.md` to keep the domain glossary synchronized.
