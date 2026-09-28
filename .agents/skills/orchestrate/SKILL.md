---
name: orchestrate
description: >-
  Split a requested task across available agents with clear ownership,
  interface contracts, independent checks, and ready-to-paste prompts.
disable-model-invocation: true
---

# Multi-Agent Orchestrator

Use when the user explicitly asks for a multi-agent assignment plan. Produce the assignments and prompts; do not implement production code. Inspect the repository for paths and commands before asking for information it already contains.

## Inputs

Gather the task and success criteria, the available agents' capabilities and constraints, and any user-specified contract or scaffolding paths. Use existing project checks and commands. If no contract path is given, put contracts in the prompts. If new scaffolding is needed and no path was given, place it in the project's existing test layout; use `tests/` when no test layout exists.

## Split the Work

- Choose the smallest set of bounded responsibilities that covers the task. Assign one owner to each based on capability and tool access. Leave agents idle when another split would add coordination cost.
- Run independent responsibilities concurrently. Put dependent work in later phases. Merge responsibilities when circular dependencies or shared-file contention defeat a clean split.
- For phased work, name the integration owner, the order and method for bringing completed artifacts into the next phase's checkout, and the check that must pass before dependent agents start. If agents cannot commit or merge, specify an authorized patch, file-transfer, or user integration handoff instead.
- Concurrent agents need isolated branches or disjoint file ownership. Give each an exact file allowlist with no overlap. Reserve shared manifests, lockfiles, root exports, and integration wiring for one later owner.
- If no agent can safely own the work, say so and stop. For one responsibility, provide one prompt and no invented seams.

## Define Code Seams

For each boundary between agents, specify the interface signatures, data shapes, invariants, error behavior, ownership, and file allowlists. Reuse stable project types. Put new shared types in an orchestrator-owned contract, rather than an agent's unfinished implementation. Write contracts to the user-specified path or repeat the relevant contract inline in each prompt. Downstream agents treat contracts as immutable.

## Add Scaffolding Only When Needed

Use existing focused checks when they isolate each responsibility. Generate scaffolding only when interacting code needs isolated checks before integration or the user requests it. Skip it for non-code work.

If generated, keep test doubles, isolated suites, integration checks, and any discovery-restricting runner orchestrator-owned. Doubles return canned responses or record calls; production code receives dependencies through a constructor, factory, or framework injection point and never imports test doubles. Each isolated suite must load only its owner's dependencies. Verify before handoff that another agent's missing implementation cannot break suite loading, while the owner's missing implementation produces an explicit expected failure. Never report a pre-implementation suite as green.

## Produce the Handoff

Summarize topology (`CONCURRENT`, `PHASED`, or `SINGLE-AGENT`), ownership, dependencies and handoffs, seams, idle agents, and any files created. Then give one fenced, directly pasteable prompt per assigned agent, ordered by phase. Each prompt includes:

- Responsibility and acceptance criteria.
- Exact editable file allowlist and immutable contract reference or inline contract.
- Focused verification command or observable acceptance steps.
- Branch or workspace isolation instructions for concurrent work.
- Where applicable, the dependency injection signature and a reminder that production code cannot import test doubles.

State once that agents may not edit outside their allowlist, modify orchestrator-owned contracts or scaffolding, or touch another agent's files. Shared root files belong to the designated integration owner only.

End with the real integration check and existing project gate, preserving nonzero failures and warnings. If tests are claimed, reject a zero-test run. Do not invent a single command when the project has none; give available commands or a short manual checklist. For non-code work, use deliverable acceptance criteria instead of test scaffolding.

See [two_agent.md](./examples/two_agent.md) for a compact concurrent example.
