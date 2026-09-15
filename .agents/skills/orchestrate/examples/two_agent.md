# Example: Two-Agent Split (Gemini + Grok)

This example shows the original pattern that motivated the skill:
splitting a task between an integration-focused agent and a core-logic agent.

---

## Input

```
<AGENTS>
- Name: Gemini
  Capabilities: Tool access, large context window, strong at integration/glue code, API wiring, file I/O
  Constraints: None

- Name: Grok
  Capabilities: Strong reasoning, algorithms, data structures, isolated domain logic
  Constraints: None
</AGENTS>

<TASK>
Build a URL shortener service. Requirements:
- HTTP API layer (POST /shorten, GET /:code) with input validation
- Core shortening engine: generates unique short codes, stores mappings, resolves codes
- Success command: pytest
- Constraints: Python, FastAPI, no external databases (in-memory store)
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

- **Topology**: `CONCURRENT`
- **Responsibilities**:

  | Responsibility | Owner | Parallel Group | Dependencies |
  |---|---|---|---|
  | HTTP API layer (routing, validation, response formatting) | Gemini | 1 | None |
  | Shortening engine (code generation, storage, resolution) | Grok | 1 | None |

- **Seams**:
  - `ShorteningService` interface between API layer and engine.
    Contract file: `docs/contracts/shortening_service_contract.py`

- **Idle Agents**: None
- **Files Created on Disk**:
  - `docs/contracts/shortening_service_contract.py`
  - `tests/support/fake_shortening_service.py`
  - `tests/test_grok_engine.py`
  - `tests/test_gemini_api.py`
  - `tests/test_integration.py`
  - `tests/run_isolated.sh`

### 2. Grok Prompt

```markdown
Provide the complete implementation of `src/engine.py`.

You own ONLY: `src/engine.py`

Implement the `ShorteningService` interface defined in
`docs/contracts/shortening_service_contract.py`. Read that file
for all method signatures, invariants, and error behaviors.
Import shared types (`CodeNotFoundError`, etc.) from the contract file.

Your engine must:
- Generate unique short codes (≥6 chars, alphanumeric)
- Store URL-to-code mappings in-memory
- Resolve codes back to original URLs
- Raise `CodeNotFoundError` (from the contract) for unknown codes

Run until green: `pytest tests/test_grok_engine.py`

Constraints:
- Do not modify any file outside `src/engine.py`
- Do not modify tests, contracts, or test doubles
- Do not import anything from `tests/support/`
- Do not touch `src/api.py` (Gemini's file)
- Do not modify `pyproject.toml` or any root config
```

### 3. Gemini Prompt

```markdown
Implement the FastAPI HTTP layer in `src/api.py`.

You own ONLY: `src/api.py`

Wire routes to the `ShorteningService` interface defined in
`docs/contracts/shortening_service_contract.py`. Accept `ShorteningService`
as a constructor/factory parameter (dependency injection) — do NOT import
from `tests/support/`. The test suite injects the fake through this
parameter.

Routes:
- POST /shorten: accepts `{"url": "..."}`, returns `{"short_code": "..."}`
- GET /:code: redirects to original URL, 404 if not found

Run until green: `pytest tests/test_gemini_api.py`

Constraints:
- Do not modify any file outside `src/api.py`
- Do not modify tests, contracts, or test doubles
- Do not import `fake_shortening_service` in production code
- Do not touch `src/engine.py` (Grok's file)
- Do not modify `pyproject.toml` or any root config
```

### Final. Verification Command

```bash
pytest tests/test_integration.py && pytest
```
