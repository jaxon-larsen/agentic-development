---
name: goal
description: Decompose a complex, long-running goal into a task checklist and execute it in an iterative verification loop with loop protection.
disable-model-invocation: true
---

# Goal (Iterative Goal Execution)

Systematically execute a complex development goal by breaking it down into modular steps, running iterative tests, and maintaining strict execution loop boundaries.

## Process

### 1. Establish the Goal
* If the user's objective is fuzzy or underspecified, invoke the `/grilling` skill first to map out the design tree.
* Clearly state the high-level objective before starting.

### 2. Scaffold the Checklist (`task.md`)
* Create or update the **`task.md`** checklist file (normally located in the agent's brain directory).
* Break the goal down into specific, component-level tasks.
* Format:
  ```markdown
  - [ ] uncompleted task
  - [/] in-progress task
  - [x] completed task
  ```
* **Defensive Git Backup:** Before applying the first code change of the checklist, inspect the current git status and create a recoverable git stash reference to ensure any uncommitted changes are safe:
  * **Unix/Bash**:
    ```bash
    SHA=$(git stash create "pre-goal-change")
    if [ -n "$SHA" ]; then
      git update-ref "refs/backup/pre-goal-$(date +%s)" "$SHA"
    fi
    ```
  * **PowerShell**:
    ```powershell
    $SHA = git stash create "pre-goal-change"
    if ($SHA) {
        git update-ref "refs/backup/pre-goal-$(Get-Date -UFormat %s)" $SHA
    }
    ```

### 3. Iterative Implementation & Verification
For each task in `task.md`:
1. Mark the item as in-progress (`[/]`).
2. Implement code changes surgically, adhering to layout and typing guidelines.
3. Run verification tools immediately after the change (e.g. compilers, linters, and unit/integration test suites).
4. **Self-Paced Loop Watchers:** If the client supports terminal monitoring and a task requires waiting for background runs (like long compilations, large test suites, or Docker builds), start a background watcher. Do not actively poll in chat.
   * **Unix/Bash Loop**:
     ```bash
     while true; do
       sleep 15
       echo "AGENT_LOOP_TICK_GoalVerify"
     done
     ```
   * **PowerShell Loop**:
     ```powershell
     while ($true) {
         Start-Sleep -Seconds 15
         Write-Output "AGENT_LOOP_TICK_GoalVerify"
     }
     ```
   Configure terminal monitors matching the regex `^AGENT_LOOP_TICK_GoalVerify`. Stop your execution turn, and let the sentinel ticks wake you up. Terminate the background loop task once the operation concludes.

### 4. Loop Protection & Failure Escalation
* **CRITICAL Failure Rule:** If a build command or test suite fails **3 times in a row**, you must stop immediately. Do not keep repeating the same changes or guessing.
* **Auto-Document the Blocker:** Append the blocker details, error message, or compiler output under `## 🛠️ Troubleshooting` in `.agents/memory/context.md` or `## ❓ Open Questions` in `docs/technical.md`.
* **Escalate to User:** Present the failure to the user. If available, use the `ask_question` tool to offer trade-off paths or clarify requirements; otherwise, ask in standard chat. Wait for user instruction before resuming.

### 5. Final Verification & Walkthrough
* Mark completed tasks as finished (`[x]`).
* Run the entire suite of checks (typechecks, linter, tests) to confirm zero regressions.
* Create/update a `walkthrough.md` file summarizing changes, verification outputs, and manual UI flows.
* **True Runtime Verification & Probing:** 
  1. Identify the user-facing "surface" (CLI, Server API, GUI/Pixels, or Package Export) where the change ultimately takes effect.
  2. Run the application and drive it to this surface to observe the behavior first-hand. Do not rely solely on unit tests.
  3. Execute at least one **"probe"** — an intentional attempt to break the changed path at the surface boundary (e.g. passing malformed input, missing/conflicting flags, or escaping mid-operation).
* **Verification Report in Chat:** Present your final results directly in the chat using this structured format:
  ```markdown
  ## Verification: <what changed>
  
  **Verdict:** PASS | FAIL | BLOCKED | SKIP (docs/types only)
  
  **Claim:** <what the changes were supposed to accomplish>
  
  **Method:** <how you got a handle on the app - recipe/script used to run it>
  
  ### Steps
  1. ✅/❌/🔍 <action taken on running app> ➔ <observation details>
     *(Use 🔍 to mark step-off-path probes attempting to break it)*
  
  ### Findings
  - <friction points, bugs, or surprises noticed during manual runs; list successful probes here too>
  ```
