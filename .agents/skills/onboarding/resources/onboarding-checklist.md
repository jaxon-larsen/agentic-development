# Onboarding Checklist

Follow this checklist when bootstrapping a repository for agent collaboration.

## 1. Directory Structure Scan
- Check for dependency manifests:
  - Frontend/JS: `package.json`, `pnpm-lock.yaml`, `yarn.lock`
  - Python: `requirements.txt`, `pyproject.toml`, `setup.py`
  - Rust: `Cargo.toml`
  - Go: `go.mod`
- Identify main code entry points:
  - Frontend: `src/main.tsx`, `pages/index.tsx`, `app/page.tsx`
  - Backend: `server.js`, `app.py`, `main.go`, `src/index.ts`
- Locate existing test runner & linters:
  - `tests/`, `__tests__/`, `src/**/*.test.ts`, `vitest.config.ts`, `jest.config.js`, `pytest.ini`

## 2. Rule & Context Setup (Placeholder Substitution)
- If `docs/` templates were copied or requested, replace their `{{...}}` tokens:
  - `docs/index.md` & `docs/architecture.md`: `{{PROJECT_NAME}}`, `{{DOMAIN_BOUNDARY_1}}`, `{{DOMAIN_BOUNDARY_2}}`
  - `docs/technical.md`: `{{PRIMARY_LANGUAGE}}`, `{{FRONTEND_FRAMEWORK}}`, `{{BACKEND_FRAMEWORK}}`, `{{TESTING_FRAMEWORK}}`
  - `docs/testing.md`: `{{TEST_COMMAND}}`, `{{LINT_COMMAND}}`, `{{TYPECHECK_COMMAND}}`
- Initialize `.agents/memory/context.md`:
  - Replace `{{PROJECT_NAME}}`, `{{DOMAIN_TERM_1}}`, `{{COMMON_GOTCHA}}`.
  - Populate domain glossary and tech stack pitfalls.
  - Keep only verified facts that will help future work and are hard to recover from source.
- Verify root `AGENTS.md`:
  - Merge with existing instructions if present; do not replace project-specific guidance.
  - Point only to files copied into the project and commands verified against its manifests.
  - Keep it short; place scoped rules in `.agents/rules/`.
- Seed `.agents/memory/tasks.md` with unfinished, actionable setup or discovery tasks only. Do not turn every README idea into a task.
