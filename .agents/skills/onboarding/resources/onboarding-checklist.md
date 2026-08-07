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
- Replace `{{...}}` tokens across `docs/*.md`:
  - `docs/index.md` & `docs/architecture.md`: `{{PROJECT_NAME}}`, `{{DOMAIN_BOUNDARY_1}}`, `{{DOMAIN_BOUNDARY_2}}`
  - `docs/technical.md`: `{{PRIMARY_LANGUAGE}}`, `{{FRONTEND_FRAMEWORK}}`, `{{BACKEND_FRAMEWORK}}`, `{{TESTING_FRAMEWORK}}`
  - `docs/testing.md`: `{{TEST_COMMAND}}`, `{{LINT_COMMAND}}`, `{{TYPECHECK_COMMAND}}`
- Initialize `.agents/memory/context.md`:
  - Replace `{{PROJECT_NAME}}`, `{{DOMAIN_TERM_1}}`, `{{COMMON_GOTCHA}}`.
  - Populate domain glossary and tech stack pitfalls.
  - Confirm Memory Hygiene Policy (< 100 lines target).
- Verify `.agents/AGENTS.mdc`:
  - Point to active project files and templates.
  - Set relevant glob mappings or paths.
- Seed `.agents/memory/tasks.md` with:
  - Initial codebase discovery tasks.
  - High-level backlog items found in root issue lists or readmes.
