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
- Where does understanding one concept require jumping across files without a useful boundary (poor **locality**)?
- Apply the **deletion test** to verify candidate value.

### 2. Present Candidate Report
Present each refactoring candidate in chat with markdown formatting:
- **Files Involved** | **Problem Statement** | **Proposed Deepening Solution**
- **Benefits** (explained in terms of leverage, locality, and testability)
- **Before / After Structure:** Name the proposed seam and affected callers; add a small Mermaid diagram when it clarifies a complex relationship.
- **Recommendation Strength Badge** (`Strong`, `Worth Exploring`, `Speculative`)

Ask user: *"Which candidate would you like to explore?"*

### 3. Compare Viable Designs & Grill
Once the user picks a candidate, compare designs only when there are materially different viable seams or interface shapes. Otherwise, explain the single clear design and its trade-offs. When comparison helps, consider a minimalist interface, flexible extension points, or a shape optimized for common callers; do not force all three variants. If the user explicitly requests parallel design work and the environment supports it, assign independent variants to agents.
- Compare viable designs by depth, locality, seam placement, and caller impact; give an opinionated recommendation.
- Use targeted questions to settle design choices. Record durable vocabulary or architecture decisions in the appropriate project docs. Add milestones to `.agents/memory/tasks.md` only when the user asks for an execution plan.

## Output

- Candidate architectural report and a design comparison when meaningful, presented in chat.
- Durable design decisions recorded in the appropriate docs; milestones only when an execution plan is requested.
