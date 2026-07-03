---
name: eval-builder
description: Scaffold a new evaluation suite or update an existing one for non-deterministic agentic features, recording it in docs/testing.md.
disable-model-invocation: true
---

# Eval Builder

Design, scaffold, and update evaluation suites for non-deterministic agent workflows, defining LLM judges, rubrics, and datasets to measure correctness.

## Process

### 1. Analyze and Scaffolding Focus
- Scan the target codebase and inspect the agent/feature to be evaluated.
- Check if `docs/testing.md` already exists to determine if we are creating a new test plan or updating the current one.

### 2. Interview
- Invoke the grilling protocol (questions one at a time) to clarify:
  - The core tasks, inputs, and expected outputs of the agent under test.
  - The dimensions of evaluation (e.g., task success, formatting correctness, trajectory compliance, hallucination checks).
  - Mock datasets and edge-case inputs to test.
- Summarize the resulting requirements directly in the chat.

### 3. Write or Update testing.md
- Write the final, compiled evaluation plan to a single file: **`docs/testing.md`** (create `docs/` folder if missing, or merge changes into the existing file if present).
- The specification must cover:
  - **Testing Strategy:** Deterministic unit/integration tests vs. non-deterministic evaluation runs.
  - **Eval Rubrics:** Explicit scoring dimensions (e.g., scale 1-5) and criteria for success.
  - **Judge Configuration:** Prompt guidelines for the LLM judge to grade transcripts and outputs.
  - **Test Dataset:** A list of test cases, input payloads, and target evaluation parameters.

### 4. Close Feedback Loop
- Present the updated `docs/testing.md` to the user in the chat for their manual review, staging, and commit.
