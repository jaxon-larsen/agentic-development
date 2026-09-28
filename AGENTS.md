# Agent Workspace Instructions

This file routes agents to the shared workflow. Tailor it and the living memory when bootstrapping an application repository.

## Working in this workspace

- Follow [collaboration](.agents/rules/collaboration.md) and [git safety](.agents/rules/git.md) before changing the repository. Load [testing](.agents/rules/testing.md), [documentation](.agents/rules/docs.md), and [styling](.agents/rules/styling.md) rules only when the task touches their scope.
- Treat `.agents/rules/*.md` as shared framework policies. Change them only when the user asks to change the workflow. Keep project facts and preferences in `.agents/memory/` in bootstrapped projects.
- Use the relevant skill under `.agents/skills/` for a named workflow. Keep skills focused; do not load unrelated skill files.
- In the workflow library, files in `docs/` and `.agents/memory/` are templates; preserve their `{{...}}` placeholders. In a bootstrapped project, populate them from project source and decisions.

## Project knowledge

- [Architecture](docs/architecture.md): boundaries and data flow.
- [Technical](docs/technical.md): stack and conventions.
- [Testing](docs/testing.md): verification commands and evaluation guidance.
- [Memory](.agents/memory/context.md): durable project facts, preferences, and pitfalls after onboarding.
- [Tasks](.agents/memory/tasks.md): active work after onboarding.

Read only the documents relevant to the current task. In a bootstrapped project, update living memory when a reusable fact or decision changes.
