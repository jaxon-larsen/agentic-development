# Agent Skills

A collection of agent skills for engineering and workflow automation. Skills are organized into buckets under `skills/`.

## Language

**Skill**:
A directory with a `SKILL.md` file — instructions the agent follows when invoked. User-invoked skills fire only when typed; model-invoked skills can also be reached automatically when the task fits.

**Bucket**:
A grouping folder under `skills/` — `engineering/` for daily code work, `productivity/` for general workflow tools.

**Domain glossary**:
A project's `CONTEXT.md` at the repo root (or per-context in a monorepo). Skills like `domain-modeling`, `diagnosing-bugs`, and `tdd` read it when present to use the project's vocabulary.

## Relationships

- A **Bucket** contains many **Skills**
- A project may have one **Domain glossary** that skills read opportunistically
