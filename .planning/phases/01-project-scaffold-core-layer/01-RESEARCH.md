# Phase 1: Project Scaffold & Core Layer - Research

## Research Goal
Determine the optimal project structure, persistence pattern, and core utility implementation to provide a stable foundation for FlashMind.

## Key Findings

### 1. Architectural Pattern: Feature-First
- **Finding**: Industry consensus for 2025 Flutter apps favors a **feature-first** organization over a layer-first one.
- **Decision**: Initialize `lib/` with `features/`, `core/`, and `data/` root folders.
- **Benefit**: High modularity allows the `Home` and `Manage` features to be developed independently with minimal merge conflicts.

### 2. Persistence Layer: GetStorage Best Practices
- **Finding**: `GetStorage` is highly efficient for small/medium JSON lists but requires initialization in the `main` entry point.
- **Pattern**: 
  - `await GetStorage.init();` in `main.dart`.
  - Use a dedicated `StorageService` to abstract the `GetStorage` instance.
  - Store flashcards as a `List<dynamic>` which is then mapped to `List<Flashcard>` in the repository.

### 3. Validation & Core Utilities
- **Finding**: Standard `TextFormField` validation is sufficient for the 300/500 character limits.
- **Implementation**: Create a `Validators` class in `lib/core/utils/` to centralize regex and length checks.

## Technical Choices
| Component | Choice | Reason |
|-----------|--------|--------|
| Folder Structure | Feature-First | Scalability and isolation. |
| Model Serialization | manual `fromJson`/`toJson` | Simple for MVP, no code-gen dependency needed yet. |
| ID Generation | `uuid` package (v4) | Standard for unique local IDs. |

## Dependencies to Add
- `get: ^4.6.6` (State management)
- `get_storage: ^2.1.1` (Persistence)
- `uuid: ^4.3.3` (Unique IDs)

---
*Created: 2026-03-22*
