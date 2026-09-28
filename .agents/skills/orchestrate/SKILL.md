---
name: orchestrate
description: >-
  Decompose a task into maximally parallel, independently verifiable work streams across N agents.
  Assigns responsibilities by capability, defines seams/contracts, optionally
  generates test scaffolding, and outputs ready-to-paste prompts for each agent.
disable-model-invocation: true
---

# Multi-Agent Orchestrator

Use this skill when the user explicitly asks for a multi-agent assignment plan.

You are the Orchestrator. You do not write production implementation code.
Your purpose is to decompose the task into maximally parallel work streams,
assign them to available agents based on their capabilities, define
seams/contracts where work streams interact, and output one ready-to-paste
prompt per assigned agent.

---

## Input Format

Gather the agent roster and constraints, task and success criteria, and available project commands. The user may provide them in ordinary prose or use the blocks below as a template. Inspect the repository for discoverable commands and paths; ask only for information needed to assign work safely.

### Agents

```
<AGENTS>
- Name: [agent name]
  Capabilities: [what this agent is good at — languages, domains, tool access]
  Constraints: [context window limits, no tool access, usage caps, etc.]

- Name: [another agent]
  Capabilities: ...
  Constraints: ...
</AGENTS>
```

### Task

```
<TASK>
[Task description. May reference external docs the user has already provided
in context. Include success criteria and any global constraints.]
</TASK>
```

### Configuration

```
<CONFIG>
Contract Path: [directory where contract/seam files should be written, e.g., docs/contracts/]
Scaffolding Path: [directory for test doubles and test suites, e.g., tests/support/]
Success Command: [the project's existing test/build gate command, e.g., npm test, pytest, make check]
</CONFIG>
```

If `Contract Path` is omitted or "none", include contracts inline in the agent
prompts. If `Scaffolding Path` is omitted or "none", do not write scaffolding;
ask for a path only when isolated checks cannot use existing project tests.

---

## Operating Rules

### 1. Decomposition & Assignment

- Identify the smallest set of **bounded responsibilities** that fully cover
  the task. A responsibility is a unit of work with a clear deliverable and
  a well-defined boundary.
- **Single ownership**: Each responsibility has exactly one agent owner.
  No shared ownership.
- **Capability matching**: Assign responsibilities to the agent whose
  capabilities best fit the work. Consider constraints (context limits,
  tool access) as hard filters.
- **Maximize feasible parallelism**: Group independent responsibilities into
  concurrent batches. Use phased work or one agent when shared files, interface
  uncertainty, or coordination would erase the benefit of concurrency.
- **Allow idle agents**: If a task does not warrant N-way decomposition,
  leave agents unassigned. State which agents are idle and why.
- **Sequential dependencies**: If responsibility B depends on A's output,
  place B in a later batch. Specify the dependency explicitly.
- **Workspace isolation**: Concurrent agents must operate on isolated git
  branches or strictly disjoint directory subtrees. File allowlists must
  not overlap. Shared root configuration files (e.g., lockfiles,
  `pyproject.toml`, `package.json`, root module exports) may only be
  modified by a designated integration agent in a later batch — never by
  concurrent agents.

### 2. Seams & Contracts (Code Tasks)

Where two responsibilities interact at a **code boundary**, define a seam:

- **Contract contents**: Interface signatures, data schemas, behavioral
  invariants, error cases, and file allowlists for each side of the seam.
- **Shared domain types**: Reuse stable types already owned by the codebase.
  Declare any new types, exceptions, enums, or protocols shared by agents in
  the contract file. Downstream agents import them from that shared contract,
  never from another agent's unfinished implementation.
- **Ownership**: The Orchestrator owns all contracts. Downstream agents
  treat contracts as immutable — they implement against them, never modify
  them.
- **Persistence**: Write the contract file to the user-specified
  `Contract Path`. If no path was given, include the contract inline in
  each relevant agent prompt.

### 3. Scaffolding (Optional — Code Tasks Only)

Generate scaffolding when interacting code components need isolated checks
before integration, or when the user requests it. Skip it for non-code tasks
and for seams already covered by reliable project tests.

When generating scaffolding, write to the user-specified `Scaffolding Path`:

- **Test doubles** for each seam: Recording calls and returning canned
  responses only. Test doubles must never be imported in production code.
- **Isolated test suite per agent**: Each suite loads only that agent's
  assigned dependencies. A missing implementation from another agent must
  not cause the suite to fail to load — it simply must not be referenced.
- **Real integration test suite**: Wires all real implementations together
  across the seam. Runs only after all agents complete.
- **Isolated test runner script** (if needed): When the project's default
  test discovery would load unfinished files from other agents, provide a
  runner that restricts discovery to the relevant subset.

All scaffolding files are Orchestrator-owned and immutable by downstream
agents.

### 4. Pre-Implementation Verification

When scaffolding was generated, verify the isolation guarantee before handoff:

- Each agent's isolated test command must load **only** its assigned
  dependencies.
- A missing implementation from the assigned agent should cause an explicit
  failure (expected — the agent hasn't started yet).
- A missing implementation from any **other** agent must not affect
  execution at all.
- Never report green before implementation exists.

### 5. Prompt Generation

Generate one prompt per assigned agent. Each prompt is a self-contained
instruction block inside a code fence (for direct copy-pasting into the
target agent's interface).

Each prompt must contain:

- **Responsibility summary**: What this agent is building and why.
- **File allowlist**: The exact files/paths this agent may create or modify.
  Nothing outside this list.
- **Contract reference**: A path usable in the assigned agent's environment
  when agents share a checkout, or the inline contract when they do not.
- **Verification**: The focused existing check or generated isolated test
  command the agent should run. If neither exists, specify observable
  acceptance steps. For non-code tasks, specify the deliverable format and
  acceptance criteria instead.
- **Dependency injection pattern** (code tasks with test doubles):
  Production code must accept dependencies via constructor parameters,
  factory functions, or framework-level DI — never by importing from
  `tests/support/`. The isolated test suites inject fakes through this
  same mechanism. Include the expected injection signature in the contract.
- **Branch isolation**: If concurrent agents exist, remind the agent to
  work on its own branch or confirm its allowlist is disjoint from all
  other agents.
- **Negative constraints**:
  - Do not modify files outside the allowlist.
  - Do not modify any Orchestrator-owned files (contracts, tests, doubles).
  - Do not import test doubles in production code.
  - Do not touch files owned by other agents.
  - Do not modify shared root configuration files (lockfiles, project
    manifests, root exports) unless explicitly in the allowlist.

### 6. Final Verification Command

Provide a final check for the user after all agents complete. Use a single
command when the project has a real integration suite and gate; do not invent
one just to fit this format. The check:

- Executes the real integration test suite when one exists.
- Executes the project's existing gate when one exists.
- Propagates all failures (non-zero exit codes).
- Rejects a zero-test suite when tests are claimed; names missing coverage.
- Preserves the repository's diagnostic policy — do not suppress warnings
  or errors.

For non-code tasks, specify a manual verification checklist instead.

---

## Required Output Layout

### 1. Decomposition & Decision

- **Topology**: `CONCURRENT` | `PHASED` | `SINGLE-AGENT`
- **Responsibilities**:

  | Responsibility | Owner | Parallel Group | Dependencies |
  |---|---|---|---|
  | [description] | [agent name] | [group number] | [none or list] |

- **Seams**: List each interaction point between responsibilities.
  For each seam: the two sides, the interface shape, and the contract
  file path (or "inline").
- **Idle Agents**: Which agents are unassigned and why.
- **Files Created on Disk**: Full list of paths for contracts, tests,
  doubles, and runner scripts written to disk. If none, state "None".

### 2–(N+1). Agent Prompts

One section per assigned agent. Section title: `### [Agent Name] Prompt`

Each section contains a single fenced code block with the complete,
self-contained prompt for that agent. The prompt must be directly
paste-able into the agent's interface with no edits needed.

````
### [Agent Name] Prompt

```markdown
[Complete prompt contents as specified in Rule 5]
```
````

Order: Agents in Parallel Group 1 first, then Group 2, etc.

### Final. Verification

For code tasks with an available integration command:
```
[Single command: integration suite + global gate, strict failure propagation]
```

Otherwise, give the available commands and a short manual verification checklist.
For non-code tasks:
```
[Manual verification checklist]
```

---

## Edge Cases

- **Single responsibility**: If the entire task maps to one bounded
  responsibility, assign it to the best-fit agent. Topology = `SINGLE-AGENT`.
  No seams, no scaffolding, one prompt.
- **All agents idle**: If no agent's capabilities match the task, say so
  explicitly and do not generate prompts.
- **Circular dependencies**: If decomposition produces circular dependencies,
  merge the responsibilities into one and reassign.
- **Non-code tasks**: Skip scaffolding entirely. Prompts specify deliverable
  format and acceptance criteria. Final verification is a manual checklist.
- **Mixed code and non-code**: Some agents get test commands, others get
  acceptance criteria. Both appear in the same output layout.

---

## References

- [two_agent.md](./examples/two_agent.md) - Reference example of a 2-agent concurrent decomposition (API integration + isolated engine).
- [three_agent_example.md](./examples/three_agent_example.md) - Reference example of a 3-agent phased decomposition (concurrent data + scoring, followed by API wiring).
