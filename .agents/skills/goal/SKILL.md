---
name: goal
description: Decompose a complex goal into tasks and execute with iterative verification and loop protection.
disable-model-invocation: true
---

## Overview

Execute a complex development goal with visible progress and proportional verification.

## Instructions

### 1. Establish the Goal

- Inspect the repository and existing decisions first. If the goal still has choices that materially change implementation, use the relevant questions from grill-me to resolve them.

### 2. Track the Work

- Break the goal into verifiable steps. Use `.agents/memory/tasks.md` when work spans sessions or the checklist will help future agents; otherwise track progress in the conversation.
- **Existing work:** Check `git status` before editing and preserve any pre-existing changes. If the goal risks overwriting them, isolate the work or make a targeted, non-destructive backup first. Do not use `git stash create -u` as an untracked-file backup; `stash create` does not accept the untracked option.

### 3. Iterative Implementation & Verification

For each step, make the change and run a focused check. Update a persistent checklist when one is in use.

### 4. Loop Protection & Failure Escalation

- If the same build/test failure repeats three times without new evidence, stop repeating that command. Inspect the cause and choose a different, targeted diagnostic or fix.
- If no meaningful next step is available without user input, append the blocker to `.agents/memory/context.md` (Troubleshooting section) and ask for the missing information. Do not retry blindly.

### 5. Final Verification & Walkthrough

- Confirm all goal steps are complete. Run the relevant checks; broaden to the full suite when the change crosses components or the project's release gate requires it.
- For a runnable user-facing change, exercise the changed path directly when practical and add an edge probe when risk warrants it.
- For a claimed bug fix or measurable improvement, compare the same check before and after the change when a valid baseline is available. State `INCONCLUSIVE` rather than claiming verification when the baseline or environment makes that comparison unreliable.
- Summarize the changes, checks actually run, observed results, and material limits in the final response.

## Output

- Updated `.agents/memory/tasks.md` checklist when persistent tracking was useful.
- Verified codebase changes.
- Concise walkthrough and verification evidence in chat.
