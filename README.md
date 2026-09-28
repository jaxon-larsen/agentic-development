# Agentic Development Workflow Library

A centralized, platform-agnostic repository of skills, rules, and documentation templates designed to facilitate robust spec- and test-driven development with agentic LLM assistants

---

## 🏗️ Architecture & Delivery Model

This repository is the **single source of truth** for my agentic workflow tools.

```
agentic-development/
├── AGENTS.md                            ← Short cross-agent entry point
├── .agents/
│   ├── memory/                           ← Living project memory
│   ├── rules/                            ← Universal policies
│   ├── scratch/                          ← For temporary files
│   └── skills/                           ← Reusable workflows
└── docs/                                 ← Documentation templates
```

### 1. Zero-Drift Global Sync (Antigravity)
Global directory junctions in `~/.gemini/config/` point directly to this repository:
- `~/.gemini/config/skills` → `agentic-development/.agents/skills`
- `~/.gemini/config/rules` → `agentic-development/.agents/rules`

Edit a skill or rule once in `agentic-development`, and any connected session gets the update instantly with **zero drift**.

### 2. Project Bootstrapping (Universal)
To equip any new repository with the workflow framework:
1. **Copy** the short root [`AGENTS.md`](./AGENTS.md) and `.agents/` (and optionally `docs/`) into the project root. Merge with an existing `AGENTS.md` instead of overwriting it.
2. **Bootstrap with Onboarding**: In Antigravity, Codex, or Cursor, run the [`onboarding`](./.agents/skills/onboarding/SKILL.md) skill. The agent will scan the tech stack, tailor the entry point and copied templates, and seed initial tasks in `.agents/memory/tasks.md`.

`AGENTS.md` gives all three agents a small entry point. Antigravity also loads `.agents/rules/*.md` using their `trigger` frontmatter; in Codex and Cursor, the root file directs the agent to the relevant rules. The shared skills remain in `.agents/skills/`. The [smoke checks](./evals/skill-smoke.md) are for verifying actual behavior in each agent.

---

## ⚙️ Global Antigravity Preferences (`~/.gemini/config/`)

- **`GEMINI.md`**: Global behavioral preferences (concise pacing, no time estimates, clickable `file:///` citations).
- **`hooks.json`**: The post-edit hook remains; the stop guard is disabled so a stale `[/]` task cannot prevent an agent from finishing.

---

## 🛠️ Skills Reference

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
| [`orchestrate`](./.agents/skills/orchestrate/SKILL.md) | Decompose tasks into parallel agent prompts with contracts | User / Slash |
| [`performance-audit`](./.agents/skills/performance-audit/SKILL.md) | Profile and optimize application performance | User / Slash |
| [`prototype`](./.agents/skills/prototype/SKILL.md) | Build throwaway prototype code | User / Slash |
| [`review`](./.agents/skills/review/SKILL.md) | Risk-based review of correctness, alignment, and economy | Model / User |
| [`security-audit`](./.agents/skills/security-audit/SKILL.md) | Explicit, source-backed audit of trust boundaries | User / Slash |
| [`spec-architect`](./.agents/skills/spec-architect/SKILL.md) | Interview to refine the living project specification | User / Slash |

---

## 📏 Maintaining & Modifying the Configuration

When updating rules or skills:
1. **To modify a framework skill or rule**: Edit the file directly under `agentic-development/.agents/skills/` or `agentic-development/.agents/rules/`.
2. **To customize a specific project**: Add project-specific rules directly in that project's `.agents/rules/` (e.g. `backend-rules.md` or `game-rules.md`) with Antigravity `trigger` frontmatter.
3. **To check the library**: Run `node scripts/check-workflow.mjs`, then try the relevant positive and negative prompts in [`evals/skill-smoke.md`](./evals/skill-smoke.md) in the agents you use. The script checks structure and links; the prompt cases check actual skill selection and behavior.
