---
trigger: glob
description: Project documentation guidance.
globs: "docs/**/*.md"
---

# Documentation Rules
Rules governing the maintenance and editing of files in `docs/`.

## 1. Templates & Living Docs
- In this workflow library, preserve `{{...}}` placeholders in templates. In a bootstrapped project, replace them with verified project facts and decisions; do not add new placeholders to living docs.

## 2. Integrity & Dependencies
- **Links:** Verify cross-document markdown links resolve correctly after structure edits.
- **Grounding:** Check the relevant code and configuration before stating project facts or changing template placeholders.
