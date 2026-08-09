# Agent Memory: Agentic Development Template & Library

> [!NOTE]
> **Purpose:** Living agent memory storing domain vocabulary, architecture decisions, deploy script contracts, and global configuration rules for maintaining this skill library.

---

## 🗣️ Core Domain Vocabulary & Architecture

- **Single Source of Truth:** `agentic-development` repo is the master library for universal skills (`.agents/skills/`) and framework rules (`.agents/rules/`).
- **Global Antigravity Junctions:** `C:\Users\Jaxon\.gemini\config\skills` and `rules` are Windows directory junctions pointing directly to `.agents/skills` and `.agents/rules` in this repo.
- **Framework Rules:** Five core rule files (`collaboration.mdc`, `docs.mdc`, `git.mdc`, `styling.mdc`, `testing.mdc`). Overwritten when deploy script runs.
- **Domain Rules:** Project-specific rule files (e.g. `godot-rules.mdc`, `backend-rules.mdc`, `workflow.mdc`). Preserved by deploy script.
- **Cursor Deploy Script:** `scripts/deploy.ps1` syncs framework skills and rules into a target project's `.cursor/` directory. Supports `-DryRun` and `-Init`.
- **Global Preferences (`GEMINI.md`):** Located at `C:\Users\Jaxon\.gemini\config\GEMINI.md` for machine-wide personal pacing and citation rules.
- **Global Hooks (`hooks.json`):** Located at `C:\Users\Jaxon\.gemini\config\hooks.json` with helper scripts in `C:\Users\Jaxon\.gemini\config\scripts\stop_guard.ps1` and `post_edit_lint.ps1`.

---

## 📋 Maintenance Guidelines

- **Editing Universal Skills/Rules:** Always edit in `agentic-development/.agents/`. Never edit global junction contents directly to avoid breaking git tracking in this repository.
- **Adding New Skills:** Create a directory under `.agents/skills/<name>/` with a standard 4-section `SKILL.md` (`Overview`, `Instructions`, `Output`, `References`) and update `README.md`.
- **Deploying to Cursor Projects:** Run `./scripts/deploy.ps1 -Target "C:\path\to\cursor-project"`.
- **Antigravity Workspaces:** Do not duplicate framework skills or rules into `.agents/` of Antigravity-primary projects — global junctions handle them automatically.

---

## ⚠️ Pitfalls & Troubleshooting

- **Junction Breakage:** If `agentic-development` is moved on disk, recreate global junctions using:
  `New-Item -ItemType Junction -Path "C:\Users\Jaxon\.gemini\config\skills" -Target "C:\new\path\.agents\skills"`
- **Cursor Parity:** Remember that Cursor does not read `~/.gemini/config/`. Cursor projects MUST use `.cursor/` populated via `deploy.ps1`.
