# Agentic Development Workflow Library

A centralized repository of AI agent skills, rules, and documentation templates designed to keep **code and documentation in sync** across **Antigravity** and **Cursor**.

---

## 🏗️ Architecture & Delivery Model

This repository is the **single source of truth** for universal agentic workflow rules and skills.

```
agentic-development/                      ← Source of truth template repository
├── .agents/
│   ├── skills/  ─────────────────────────> Symlinked FROM ~/.gemini/config/skills/
│   └── rules/   ─────────────────────────> Symlinked FROM ~/.gemini/config/rules/
├── docs/                                 ← Documentation templates (index, architecture, technical, testing)
└── scripts/
    └── deploy.ps1                        ← PowerShell deploy script for Cursor projects
```

### 1. Antigravity Delivery (Zero Drift via Global Symlinks)
For Antigravity sessions, global directory junctions in `~/.gemini/config/` point directly to this repository:
- `~/.gemini/config/skills` → `agentic-development/.agents/skills`
- `~/.gemini/config/rules` → `agentic-development/.agents/rules`

**Benefit:** Edit a skill or rule once in `agentic-development`, and every Antigravity session across all projects gets the update instantly with **zero drift** and zero duplication.

**Lean Workspace `.agents/`**: In Antigravity-primary projects (e.g. `autograder_v1`), `.agents/` only needs project-specific domain rules (e.g. `backend-rules.mdc`), `AGENTS.mdc`, and `memory/context.md`. Framework skills and rules are served globally.

### 2. Cursor Delivery (Deploy Script for `.cursor/`)
Because Cursor reads project-level `.cursor/` directories and does not read `~/.gemini/config/`, use the PowerShell deploy script to update Cursor-primary projects (e.g. `wizard-game`):

```powershell
# Preview changes before applying
./scripts/deploy.ps1 -Target "C:\Users\Jaxon\coding\godot\wizard-game" -DryRun

# Deploy framework to target project (creates .cursor/ and seeds domain files if needed)
./scripts/deploy.ps1 -Target "C:\Users\Jaxon\coding\godot\wizard-game" -Init
```

**Deploy Script Behavior:**
- **Syncs (Overwrites)**: 11 framework skills + 5 framework rules (`collaboration.mdc`, `docs.mdc`, `git.mdc`, `styling.mdc`, `testing.mdc`).
- **Preserves (Never touches)**: Project-specific domain rules (e.g. `godot-rules.mdc`), custom skills (e.g. `handoff`), and `memory/context.md`.

---

## ⚙️ Global Antigravity Configurations (`~/.gemini/config/`)

- **`GEMINI.md`**: Global behavioral preferences (concise pacing, no time estimates, clickable `file:///` citations).
- **`hooks.json`**: Global lifecycle automation:
  - **Stop Guard** (`stop_guard.ps1`): Prevents the agent from stopping when task list has unfinished `[/]` items.
  - **Post-Edit Lint** (`post_edit_lint.ps1`): Ephemeral reminder after file edits.

---

## 🛠️ Universal Skills Reference

Skills live in `.agents/skills/`. Each skill includes a structured `SKILL.md` with supporting `references/`, `resources/`, or `scripts/`:

| Skill | Description | Invocation |
| :--- | :--- | :--- |
| [`debug-systematically`](./.agents/skills/debug-systematically/SKILL.md) | Hypothesis-driven systematic debugging | User / Slash |
| [`enhance-docs`](./.agents/skills/enhance-docs/SKILL.md) | Audit doc-code drift and clarify ambiguities | User / Slash |
| [`expand-from-docs`](./.agents/skills/expand-from-docs/SKILL.md) | Identify gap items and create phase plans | User / Slash |
| [`goal`](./.agents/skills/goal/SKILL.md) | Decompose complex objectives into task checklists | User / Slash |
| [`grill-me`](./.agents/skills/grill-me/SKILL.md) | Probe docs/code and clarify design decisions | User / Slash |
| [`improve-codebase-architecture`](./.agents/skills/improve-codebase-architecture/SKILL.md) | Scan codebase for shallowness and refactoring items | User / Slash |
| [`learn`](./.agents/skills/learn/SKILL.md) | Extract domain terms & rules into `memory/context.md` | User / Slash |
| [`onboarding`](./.agents/skills/onboarding/SKILL.md) | Bootstrap a repository as an agentic workspace | User / Slash |
| [`performance-audit`](./.agents/skills/performance-audit/SKILL.md) | Profile and optimize application performance | User / Slash |
| [`prototype`](./.agents/skills/prototype/SKILL.md) | Build throwaway prototype code | User / Slash |
| [`review`](./.agents/skills/review/SKILL.md) | Three-axis code review (Standards + Spec + Simplicity) + PR readiness | Model / User |

---

## 📏 Maintaining & Modifying the Configuration

When updating rules or skills:
1. **To modify a framework skill or rule globally**: Edit the file directly under `agentic-development/.agents/skills/` or `agentic-development/.agents/rules/`. All Antigravity projects receive the update immediately via global junctions.
2. **To push updates to Cursor projects**: Run `./scripts/deploy.ps1 -Target <project_path>`.
3. **To add a project-specific rule**: Add a domain-named file (e.g. `my-domain-rules.mdc`) inside that project's `.agents/rules/` or `.cursor/rules/`. The deploy script will preserve it.
