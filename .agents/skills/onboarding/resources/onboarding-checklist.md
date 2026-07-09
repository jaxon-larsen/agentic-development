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
- Locate existing tests:
  - `tests/`, `__tests__/`, `src/**/*.test.ts`, `vitest.config.ts`, `jest.config.js`

## 2. Rule & Context Setup
- Initialize `.agents/memory/context.md`:
  - List detected technologies and frameworks under `## 🛠️ Technology Stack`.
  - Populate initial concepts under `## 🗣️ Core Domain Vocabulary`.
  - Set default style/conventions in `## ⚙️ General Preferences`.
- Verify `.agents/AGENTS.mdc`:
  - Point to active project files and templates.
  - Set relevant glob mappings or paths.
- Seed `.agents/memory/tasks.md` with:
  - Initial codebase discovery tasks.
  - High-level backlog items found in root issue lists or readmes.
