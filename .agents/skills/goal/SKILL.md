---
name: goal
description: Decompose a complex goal into tasks and execute with iterative verification and loop protection.
disable-model-invocation: true
---

## Overview

Systematically execute a complex development goal using a task checklist, iterative tests, and execution loop protection boundaries.

## Instructions

### 1. Establish the Goal

- Inspect the repository and existing decisions first. If the goal still has choices that materially change implementation, use the relevant questions from grill-me to resolve them.

### 2. Scaffold Checklist (`.agents/memory/tasks.md`)

- Record the goal's broken-down checklist directly in `.agents/memory/tasks.md` under a `## 🎯 Active Goal` section with checkboxes (`[ ]` todo, `[/]` in-progress, `[x]` done).
- **Existing work:** Check `git status` before editing and preserve any pre-existing changes. If the goal risks overwriting them, isolate the work or make a targeted, non-destructive backup first. Do not use `git stash create -u` as an untracked-file backup; `stash create` does not accept the untracked option.

### 3. Iterative Implementation & Verification

For each task in `.agents/memory/tasks.md`:

1. Mark as in-progress (`[/]`).
2. Implement change surgically and run verification commands (compilers, linters, tests) immediately.
3. Once the relevant check passes, mark as completed (`[x]`).

### 4. Loop Protection & Failure Escalation

- If the same build/test failure repeats three times without new evidence, stop repeating that command. Inspect the cause and choose a different, targeted diagnostic or fix.
- If no meaningful next step is available without user input, append the blocker to `.agents/memory/context.md` (Troubleshooting section) and ask for the missing information. Do not retry blindly.

### 5. Final Verification & Walkthrough

- Confirm all goal tasks are marked completed (`[x]`). Run the relevant checks; broaden to the full suite when the change crosses components or the project's release gate requires it.
- Create or present a walkthrough summarizing technical changes.
- **Runtime Probe:** For a runnable user-facing change, exercise the changed path and one meaningful edge case. Record why a runtime probe was not relevant or available for other work.
- For a claimed bug fix or measurable improvement, compare the same check before and after the change when a valid baseline is available. State `INCONCLUSIVE` rather than claiming verification when the baseline or environment makes that comparison unreliable.
- Print a Verification Report in chat covering: **Verdict** (PASS/FAIL/BLOCKED), **Claim**, **Method**, **Steps** (with 🔍 for probes), and **Findings**.

## Output

- Updated `.agents/memory/tasks.md` checklist.
- Verified codebase changes.
- Technical walkthrough and Verification Report in chat.
