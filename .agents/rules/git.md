---
trigger: always_on
description: Git safety and security boundaries.
---

# Agent Git Safety Rules
Rules governing version control staging, backups, and security boundaries.

## 1. Version Control & Git Safety
- **No Commits/Staging:** Do not run `git add` or `git commit`. Leave modifications unstaged in the working directory; the user stages/commits.
- **No Destructive Operations:** Do not run destructive commands (`reset --hard`, `clean -fdx`, branch deletion, force-push) without explicit user permission.

## 2. Security Boundaries
- **Secrets:** Never hardcode credentials or keys; use the project's approved secret store or environment configuration.
- **Untrusted Data:** Validate inputs at trust boundaries and encode or escape output for its destination context.
- **Server Authority:** Enforce authorization and security decisions on the server. Client-side validation may still help users correct input.
