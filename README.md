# Agent Skills for Engineering Workspaces

A compact library of AI agent skills focused on keeping **code and documentation in sync**.

Works across Cursor and Antigravity (`SKILL.md` + slash commands).

## Drag and drop into a project

This library is structured to be copied directly into any target repository. 

To install, copy the `.agents/` and `docs/` folders from this repository directly to the root of your project:

```
your-project/
├── docs/                  <-- Project documentation
│   ├── index.md           <-- Central documentation index
│   ├── architecture.md    <-- System architecture & data flows
│   ├── technical.md       <-- Coding conventions & paradigms
│   └── testing.md         <-- Verification & evaluation standards
├── .agents/               <-- Copy this folder (rename to .cursor if using Cursor)
│   ├── skills/            <-- Workspace dynamic skills
│   ├── rules/             <-- Modular, glob-matched rule files
│   │   ├── artifact-rules.mdc
│   │   ├── collaboration.mdc
│   │   ├── docs-rules.mdc
│   │   ├── git-safety.mdc
│   │   └── testing-tdd.mdc
│   ├── memory/            <-- Persistent modular memory files
│   │   ├── context.md     <-- Living agent memory to avoid coding/doc mistakes
│   │   └── tasks.md       <-- Active tasks checklist/roadmap
│   └── AGENTS.mdc         <-- Agent entry point configuration
└── ...
```

*Note: If you are using Cursor instead of Antigravity, you can rename the copied `.agents/` directory to `.cursor/`. Alternatively, to support both editors with zero duplication, keep `.agents/` and create a symbolic link (PowerShell: `New-Item -ItemType SymbolicLink -Path .cursor -Target .agents`) or directory junction (PowerShell: `New-Item -ItemType Junction -Path .cursor -Target .agents`, which does not require Developer Mode).*

### After copying

1. Open your target project in Cursor or Antigravity.
2. Run the `/onboarding` command — this skill will scan your codebase and customize the copied `.agents/memory/context.md` and `.agents/AGENTS.mdc` templates for your stack.
3. Try `/grilling` on something fuzzy, then `/enhance-docs` to sync, or `/expand-from-docs` to build out new features.

## Workflow

```
/grilling  →  probe context, clarify design in chat
     ↓
/enhance-docs  →  audit doc-code drift, resolve ambiguities (Wiki Linter)
     ↓
/expand-from-docs  →  interview, plan, and execute feature expansion
```

## Skills

Skills live in `.agents/skills/`. Each skill is **user-invoked** (`disable-model-invocation: true`) or **model-invoked** (agent can reach when the task fits).

### User-invoked

| Skill                                                                                  | Purpose                                                     |
| -------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| [enhance-docs](./.agents/skills/enhance-docs/SKILL.md)                                 | Audit doc-code drift, identify ambiguities, and grill to clarify vision |
| [expand-from-docs](./.agents/skills/expand-from-docs/SKILL.md)                         | Identify gaps, interview user on next phase, and create execution plans |
| [goal](./.agents/skills/goal/SKILL.md)                                                 | Decompose a complex objective into checklist tasks and execute with loop protection |
| [grilling](./.agents/skills/grilling/SKILL.md)                                         | Ask questions; probe docs and code; capture session notes   |
| [handoff](./.agents/skills/handoff/SKILL.md)                                           | Compact conversation for another session                    |
| [improve-codebase-architecture](./.agents/skills/improve-codebase-architecture/SKILL.md) | Scan codebase for shallowness and refactoring opportunities |
| [learn](./.agents/skills/learn/SKILL.md)                                               | Audit session history to extract domain terms and coding rules, updating memory/context.md |
| [onboarding](./.agents/skills/onboarding/SKILL.md)                                     | Bootstrap a repository as an agentic workspace              |
| [prototype](./.agents/skills/prototype/SKILL.md)                                       | Build throwaway prototype code                              |

### Model-invoked

| Skill                                                    | Purpose                                             |
| -------------------------------------------------------- | --------------------------------------------------- |
| [review](./.agents/skills/review/SKILL.md)               | Two-axis review (Standards vs Spec) of commit diffs |

## Terms

| Term                | Meaning                                                  |
| ------------------- | -------------------------------------------------------- |
| **Skill**           | Folder with `SKILL.md` — agent instructions when invoked |
| **Grilling**        | Questions only; clarifies goals and design in the chat   |
| **context.md**      | Living agent memory containing vocabulary, preferences, and gotchas to avoid repeating mistakes |

## Maintaining this skill library

When adding or editing skills:

- Every skill in `.agents/skills/` must appear in this README with a link to its `SKILL.md`.
- Group under **User-invoked** and **Model-invoked**.
- **User-invoked:** set `disable-model-invocation: true`; human-facing `description`.
- **Model-invoked:** omit that flag; model-facing `description` with trigger phrasing.
- User-invoked skills may invoke model-invoked skills, not other user-invoked skills.
- Reach other skills via `/skill` prose, not cross-folder behavior links.
