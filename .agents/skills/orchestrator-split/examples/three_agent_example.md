# Example: Three-Agent Phased Split (Claude + Gemini + Grok)

This example demonstrates a 3-agent decomposition with mixed parallelism:
two agents work concurrently in Group 1, a third depends on their output
in Group 2.

---

## Input

```
<AGENTS>
- Name: Claude
  Capabilities: Large context, careful implementation, strong at data modeling and validation logic
  Constraints: None

- Name: Gemini
  Capabilities: Tool access, large context, API integration, file I/O, testing
  Constraints: None

- Name: Grok
  Capabilities: Strong reasoning, algorithms, optimization, math-heavy logic
  Constraints: None
</AGENTS>

<TASK>
Build a recommendation engine service:
- Data layer: user profiles, item catalog, interaction history (in-memory)
- Scoring engine: collaborative filtering algorithm that scores items for a user
- REST API: endpoints to get recommendations, record interactions, manage profiles
- Success command: pytest
- Constraints: Python, FastAPI, no external databases
</TASK>

<CONFIG>
Contract Path: docs/contracts/
Scaffolding Path: tests/support/
Success Command: pytest
</CONFIG>
```

---

## Expected Output

### 1. Decomposition & Decision

- **Topology**: `PHASED`
- **Responsibilities**:

  | Responsibility | Owner | Parallel Group | Dependencies |
  |---|---|---|---|
  | Data layer (models, storage, queries) | Claude | 1 | None |
  | Scoring engine (collaborative filtering) | Grok | 1 | None |
  | REST API (routing, wiring, responses) | Gemini | 2 | Data layer, Scoring engine |

- **Seams**:
  - `DataStore` interface between data layer and both consumers.
    Contract: `docs/contracts/data_store_contract.py`
  - `ScoringEngine` interface between scoring engine and API.
    Contract: `docs/contracts/scoring_engine_contract.py`

- **Idle Agents**: None
- **Files Created on Disk**:
  - `docs/contracts/data_store_contract.py`
  - `docs/contracts/scoring_engine_contract.py`
  - `tests/support/fake_data_store.py`
  - `tests/support/fake_scoring_engine.py`
  - `tests/test_claude_data.py`
  - `tests/test_grok_scoring.py`
  - `tests/test_gemini_api.py`
  - `tests/test_integration.py`

### 2. Claude Prompt (Group 1)

```markdown
Implement the in-memory data layer in `src/data.py`.

You own ONLY: `src/data.py`

Implement the `DataStore` interface defined in
`docs/contracts/data_store_contract.py`. Read that file for all method
signatures, schemas, and invariants. Import all shared types
(`NotFoundError`, `UserProfile`, `Interaction`, etc.) from the contract.

Your data layer must:
- Store user profiles (id, name, preferences dict)
- Store item catalog (id, title, attributes dict)
- Record interactions (user_id, item_id, action, timestamp)
- Query interactions by user, by item, or by time range
- Raise `NotFoundError` (from the contract) for missing users/items

Run until green: `pytest tests/test_claude_data.py`

Constraints:
- Do not modify any file outside `src/data.py`
- Do not modify tests, contracts, or test doubles
- Do not import anything from `tests/support/`
- Do not touch `src/scoring.py` or `src/api.py`
- Do not modify `pyproject.toml` or any root config
```

### 3. Grok Prompt (Group 1)

```markdown
Implement the collaborative filtering scoring engine in `src/scoring.py`.

You own ONLY: `src/scoring.py`

Implement the `ScoringEngine` interface defined in
`docs/contracts/scoring_engine_contract.py`. Your engine receives a
`DataStore` via constructor injection (dependency injection) — import
the `DataStore` protocol and all shared types from
`docs/contracts/data_store_contract.py`. Do NOT import from `src/data.py`.

Your engine must:
- Compute user-item similarity scores using interaction co-occurrence
- Return top-N scored items for a given user, excluding already-interacted
- Handle cold-start users (no interactions) by returning popular items
- Accept a `min_score` threshold parameter

Run until green: `pytest tests/test_grok_scoring.py`

Constraints:
- Do not modify any file outside `src/scoring.py`
- Do not modify tests, contracts, or test doubles
- Do not import anything from `tests/support/`
- Do not touch `src/data.py` or `src/api.py`
- Do not modify `pyproject.toml` or any root config
```

### 4. Gemini Prompt (Group 2 — after Group 1 completes)

```markdown
Implement the FastAPI REST API in `src/api.py`.

You own ONLY: `src/api.py`

Wire routes to `DataStore` and `ScoringEngine`. Accept both as
constructor/factory parameters (dependency injection) — do NOT import
from `tests/support/`. The test suite injects fakes through these
parameters. Contracts:
`docs/contracts/data_store_contract.py` and
`docs/contracts/scoring_engine_contract.py`.

Routes:
- GET /recommendations/:user_id → top-N items
- POST /interactions → record a user-item interaction
- GET /profiles/:user_id → user profile
- POST /profiles → create user profile

Run until green: `pytest tests/test_gemini_api.py`

Constraints:
- Do not modify any file outside `src/api.py`
- Do not modify tests, contracts, or test doubles
- Do not import fakes in production code
- Do not touch `src/data.py` or `src/scoring.py`
- Do not modify `pyproject.toml` or any root config
```

### Final. Verification Command

```bash
pytest tests/test_integration.py && pytest
```
