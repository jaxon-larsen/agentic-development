# Grilling Question Bank

Use these questions as templates during requirement gathering and design clarification sessions. Ask them one at a time.

## 🏗️ Architecture & High-Level Design
- **Stack & Tooling**: "Are we using any specific library or framework for this feature, or should I stick to what is currently package-configured?"
- **Data Flow & Seams**: "Where should the boundary of this new feature sit? Should we wrap this logic in a new module or expand an existing one?"
- **Database & State**: "Does this feature require persisting state? If so, what database schema or state shape are you envisioning?"

## 📋 Requirements & Scope
- **Success Criteria**: "What does a successful implementation of this feature look like? Are there specific inputs and outputs we must support?"
- **Edge Cases**: "How should the system handle invalid inputs or external service failures?"
- **Scope Control**: "What is the absolute minimal set of features we need for the first version? What should we postpone to a later iteration?"

## 👤 User Experience & Interactions
- **User Interface**: "What are the primary UI components required? Are there styling choices (e.g. colors, layouts) I should prioritize?"
- **Feedback Loops**: "How should errors or status updates be reported back to the user?"
