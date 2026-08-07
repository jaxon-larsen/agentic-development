---
name: improve-codebase-architecture
description: Scan a codebase for deepening opportunities, present them, then grill through whichever one you pick.
disable-model-invocation: true
---

# Improve Codebase Architecture

Surface codebase friction and propose **deepening opportunities**—refactors that turn shallow modules (large interfaces, thin implementations) into deep ones (small interfaces hiding rich behavior).

---

## 📐 Deep Module Design Vocabulary

Use these exact principles during analysis and discussions:
- **Deep Module:** Small interface + rich implementation. Gives callers high **leverage** (more capability per interface unit learned) and maintainers high **locality** (bugs and knowledge concentrate in one place).
- **Shallow Module:** Large interface + thin pass-through implementation (avoid).
- **Seam:** The location where a module's interface lives. One adapter = hypothetical seam; two adapters (e.g. prod + test) = real seam.
- **The Deletion Test:** Imagine deleting a module. If complexity vanishes, it was a pass-through. If complexity reappears across callers, it was earning its keep.
- **The Interface is the Test Surface:** Callers and tests cross the same seam. Tests assert on observable outcomes through the interface, not internal private state.

---

## Instructions

### 1. Explore & Scope
Read `.agents/memory/context.md` glossary and existing architecture docs. Scan hot spots in `git log --oneline` or user-specified paths:
- Where are modules **shallow** (interface nearly as complex as implementation)?
- Where does understanding one concept require jumping across 5+ small files (no **locality**)?
- Apply the **deletion test** to verify candidate value.

### 2. Present Candidate Report
Present each refactoring candidate in chat with markdown formatting:
- **Files Involved** | **Problem Statement** | **Proposed Deepening Solution**
- **Benefits** (explained in terms of leverage, locality, and testability)
- **Before / After Structure** (ASCII or Mermaid diagram)
- **Recommendation Strength Badge** (`Strong`, `Worth Exploring`, `Speculative`)

Ask user: *"Which candidate would you like to explore?"*

### 3. Design It Twice (Parallel Subagents) & Grilling
Once the user picks a candidate, run a **Design It Twice** pass:
- Spawn 2–3 parallel subagents using `invoke_subagent` (`research` or `self`) with different design constraints:
  - *Agent 1:* Minimalist interface (1–3 entry points max, maximum leverage).
  - *Agent 2:* High flexibility (adaptable configuration & extension points).
  - *Agent 3:* Optimized for common callers (default paths made trivial).
- Present competing designs side by side, compare their depth, locality, and seam placement, and give an opinionated recommendation.
- Run `/grill` to finalize design choices, and update `.agents/memory/context.md` vocabulary inline.

## Output

- Report presented to user.
- Glossary updates in `.agents/memory/context.md`.
- Codebase design improvements.

## References

- [architecture-patterns.md](./references/architecture-patterns.md) - Reference list of modular software design principles and common anti-patterns.
