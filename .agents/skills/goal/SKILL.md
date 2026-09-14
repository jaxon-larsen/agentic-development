---
name: goal
description: Decompose a complex goal into tasks and execute with iterative verification and loop protection.
disable-model-invocation: true
---

## Overview

Systematically execute a complex development goal using a task checklist, iterative tests, and execution loop protection boundaries.

## Instructions

### 1. Establish the Goal

- Follow the grill-me protocol to map the design tree if the goal is fuzzy.

### 2. Scaffold Checklist (`.agents/memory/tasks.md`)

- Record the goal's broken-down checklist directly in `.agents/memory/tasks.md` under a `## 🎯 Active Goal` section with checkboxes (`[ ]` todo, `[/]` in-progress, `[x]` done).
- **Git Backup:** Before first code change, backup uncommitted state (including untracked files):
  - PowerShell: `$SHA = git stash create --include-untracked; if ($SHA) { git update-ref "refs/backup/pre-goal-$(Get-Date -UFormat %s)" $SHA }`
  - Bash: `SHA=$(git stash create -u); if [ -n "$SHA" ]; then git update-ref "refs/backup/pre-goal-$(date +%s)" "$SHA"; fi`

### 3. Iterative Implementation & Verification

For each task in `.agents/memory/tasks.md`:

1. Mark as in-progress (`[/]`).
2. Implement change surgically and run verification commands (compilers, linters, tests) immediately.
3. Once green, mark as completed (`[x]`).

### 4. Loop Protection & Failure Escalation

- **CRITICAL:** If build/test fails **3 times in a row**, stop immediately.
- Append error details to `.agents/memory/context.md` (Troubleshooting section).
- Ask user for guidance directly in chat (or use an interactive question tool if available). Do not guess.

### 5. Final Verification & Walkthrough

- Confirm all goal tasks are marked completed (`[x]`). Run entire suite to confirm zero regressions.
- Create or present a walkthrough summarizing technical changes.
- **Runtime Probe:** Run the app, exercise the user-facing boundary, and run at least one "probe" (intentional attempt to break the path).
- Print a Verification Report in chat covering: **Verdict** (PASS/FAIL/BLOCKED), **Claim**, **Method**, **Steps** (with 🔍 for probes), and **Findings**.

## Output

- Updated `.agents/memory/tasks.md` checklist.
- Verified codebase changes.
- Technical walkthrough and Verification Report in chat.
