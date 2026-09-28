# Example: Two Independent Agents

Task: Add `POST /score` around a scoring engine. Codex owns `src/scoring/`; Cursor owns `src/api/`. This example project already has `ScoreRequest` and `ScoreResult` in `src/contracts/scoring.ts` and focused test commands. Codex will update root exports after both agents finish.

## Decomposition

| Responsibility | Owner | Phase | Editable files |
| --- | --- | --- | --- |
| Score and explain a request | Codex | 1 | `src/scoring/**` |
| Validate HTTP input and map the result | Cursor | 1 | `src/api/**` |
| Wire root exports and run integration checks | Codex | 2 | `src/index.ts`, `tests/integration/scoring-api.test.ts` |

The seam is `score(request: ScoreRequest): ScoreResult`. The API validates JSON before calling it: malformed input returns 400; a valid result returns 200; an unexpected scoring error returns 500. Neither phase-one agent edits the shared types or root configuration. No new scaffolding is needed because the existing focused suites isolate the packages. Before phase two, the integration owner brings Cursor's completed API files into Codex's integration checkout, confirms both focused suites pass there, and then lets Codex wire exports. In a repository where agents cannot commit or merge, the handoff assigns that transfer to the user or another authorized owner before phase two begins.

## Prompt: Codex

```markdown
Implement `score(request: ScoreRequest): ScoreResult` in `src/scoring/**` using types from `src/contracts/scoring.ts`. The API validates JSON before calling you; produce a `ScoreResult` for valid requests and let unexpected failures propagate for the API to map to 500. During phase one, edit only `src/scoring/**`; do not change shared types, `src/index.ts`, API files, or another agent's tests. Work on an isolated branch or disjoint checkout. Run `npm run test:scoring` and report the result. After Cursor's work is ready, phase two lets you edit `src/index.ts` and `tests/integration/scoring-api.test.ts`; wire exports, then run `npm run test:integration` and `npm run check`.
```

## Prompt: Cursor

```markdown
Implement `POST /score` in `src/api/**`. Validate JSON and return 400 for malformed input. Call `score(request: ScoreRequest): ScoreResult` using types from `src/contracts/scoring.ts`; map a valid result to 200 and an unexpected scoring error to 500. Edit only `src/api/**`; do not change shared types, `src/index.ts`, scoring files, or another agent's tests. Work on an isolated branch or disjoint checkout. Run `npm run test:api` and report the result.
```

If the project has no integration check, the handoff names a concrete manual API request and expected result instead.
