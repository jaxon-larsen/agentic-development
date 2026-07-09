# Architecture & Refactoring Patterns

Guidelines for improving codebase structure, separation of concerns, and system depth.

## 📐 Key Design Concepts
- **Module Depth:** Deep modules have simple interfaces but hide significant complexity and logic. Shallow modules have interfaces that are nearly as complex as their implementations.
- **Locality:** Keep related code together. Avoid separating logic across many tiny files if it hurts readability and navigation.
- **Interfaces and Seams:** Use interfaces to define testable boundaries (seams) where different parts of the system interact. Avoid creating multiple mock adapters for a single seam unless multiple real implementations exist.

## ⚠️ Anti-Patterns to Flag
- **God Objects:** Classes or modules that assume too many responsibilities.
- **Circular Dependencies:** Modules that import/require each other, leading to tight coupling and import errors.
- **Leaky Abstractions:** Modules that expose internal details (e.g. database cursors, raw network responses) through their interfaces.

## 🛠️ Refactoring Tactics
- **Extract Module:** Split a large module into smaller, focused modules hidden behind a clean interface.
- **Deletion Test:** Assess if a module is shallow: "Would deleting this module concentrate complexity elsewhere or just move it?" If it just moves it, the module is likely shallow and should be inlined.
