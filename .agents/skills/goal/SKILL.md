---
name: goal
description: Decompose a complex, long-running goal into a task checklist and execute it in an iterative verification loop with loop protection.
disable-model-invocation: true
---

## Overview

Systematically execute a complex development goal using a task checklist, iterative tests, and execution loop protection boundaries.

## Instructions

### 1. Establish the Goal

- Grill user to map design tree if the goal is fuzzy.

### 2. Scaffold Checklist (`task.md`)

- Create/update `task.md` in agent brain directory with checkboxes (`[ ]` todo, `[/]` in-progress, `[x]` done).
- **Git Backup:** Before first code change, backup uncommitted state:
  - PowerShell: `$SHA = git stash create; if ($SHA) { git update-ref "refs/backup/pre-goal-$(Get-Date -UFormat %s)" $SHA }`
  - Bash: `SHA=$(git stash create); if [ -n "$SHA" ]; then git update-ref "refs/backup/pre-goal-$(date +%s)" "$SHA"; fi`

### 3. Iterative Implementation & Verification

For each task in `task.md`:

1. Mark as in-progress (`[/]`).
2. Implement change surgically and run verification tools (compilers, linters, tests) immediately.
3. **Background Watcher:** If waiting for background runs, execute sentinel loop and stop calling tools:
   - PowerShell: `while ($true) { Start-Sleep -Seconds 15; Write-Output "AGENT_LOOP_TICK_GoalVerify" }`
   - Bash: `while true; do sleep 15; echo "AGENT_LOOP_TICK_GoalVerify"; done`
     Configure terminal monitors for regex `^AGENT_LOOP_TICK_GoalVerify`. Terminate background task when done.

### 4. Loop Protection & Failure Escalation

- **CRITICAL:** If build/test fails **3 times in a row**, stop immediately.
- Append error details to `.agents/memory/context.md` (Troubleshooting section).
- Ask user for help via `ask_question` or chat. Do not guess.

### 5. Final Verification & Walkthrough

- Mark completed tasks (`[x]`). Run entire suite to confirm zero regressions.
- Create/update `walkthrough.md` summarizing technical changes.
- **Runtime Probe:** Run the app, exercise the user-facing boundary, and run at least one "probe" (intentional attempt to break the path).
- Print a Verification Report in chat covering: **Verdict** (PASS/FAIL/BLOCKED), **Claim**, **Method**, **Steps** (with 🔍 for probes), and **Findings**.

## Output

- Completed `task.md` checklist.
- Verified codebase changes.
- `walkthrough.md` summary file.
- Verification Report in chat.
