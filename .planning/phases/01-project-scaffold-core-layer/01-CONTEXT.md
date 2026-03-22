# Phase 1: Project Scaffold & Core Layer - Context

**Gathered:** 2026-03-22
**Status:** Ready for planning
**Source:** PRD Express Path (implementation_plan.md)

<domain>
## Phase Boundary

This phase establishes the foundational project structure and the core data layer for FlashMind. It delivers:
1.  **Project Scaffold**: Correct folder hierarchy following a feature-first pattern.
2.  **Core Utilities**: Essential constants and form validators.
3.  **Data Layer**: Initial data model (`Flashcard`) and the persistence layer (Storage Service and Repository).

</domain>

<decisions>
## Implementation Decisions

### [Scaffold] Project Organization
- Use **feature-first** organization: `lib/features/home/`, `lib/features/manage/`, `lib/core/`, `lib/data/`.
- All screens managed by GetX bindings for DI.

### [Core] Constants & Logic
- **`AppConstants`**: Key `storageKey = 'flashcards'`, max characters 300/500, flip duration 400ms.
- **`Validators`**: Static validation methods for question/answer length and presence.

### [Data] Persistence & Modeling
- **`Flashcard` Model**: `id` (UUID), `question`, `answer`, `createdAt`.
- **`StorageService`**: Abstraction over `GetStorage` for sync JSON list persistence.
- **`FlashcardRepository`**: Abstract CRUD provider utilizing `uuid` for new card generation.

### the agent's Discretion
- Specific file naming for helper functions in `lib/core/utils/`.
- Exact package versions (targeting late-2024 stable versions as per research: `get: ^4.6.6`, `uuid: ^4.3.3`, etc.).

</decisions>

<canonical_refs>
## Canonical References

**Downstream agents MUST read these before planning or implementing.**

### Project Specifications
- `FlashMind_PRD.md` — Core application requirements.
- `implementation_plan.md` — Detailed technical roadmap and file list.

### Domain Research
- `.planning/research/SUMMARY.md` — Summary of Flutter 3D and GetX best practices.
- `.planning/research/STACK.md` — Versioned recommendations for the tech stack.

</canonical_refs>

<specifics>
## Specific Ideas
- The folder structure should follow the specific layout in `implementation_plan.md` (§ Phase 1).
- `FlashcardRepositoryImpl` should depend on the `StorageService` interface.

</specifics>

<deferred>
## Deferred Ideas
- UI/UX implementation beyond basic scaffold (Phases 3 and 4).
- Advanced state synchronization between features (Phase 5).

</deferred>

---

*Phase: 01-project-scaffold-core-layer*
*Context gathered: 2026-03-22 via PRD Express Path*
