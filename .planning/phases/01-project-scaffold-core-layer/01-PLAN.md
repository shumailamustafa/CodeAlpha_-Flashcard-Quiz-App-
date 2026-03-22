# Phase 1: Project Scaffold & Core Layer - Plan

## Objective
Initialize the Flutter project, establish the directory structure, and implement the core data and utility layers according to the implementation plan.

## Requirements Addressed
- **F-02**: Add/Edit/Delete Cards (Basic Repository setup)
- **F-03**: Local Data Persistence (Storage Service)
- **A-01**: MVVM + GetX Architecture (Project scaffold)

---

## Technical Tasks

### Wave 1: Project Initialization & Scaffold

#### [Task] 1.1 Initialize Flutter Project
<read_first>
- `implementation_plan.md`
- `.planning/phases/01-project-scaffold-core-layer/01-CONTEXT.md`
</read_first>
<action>
Run `flutter create --org com.flashmind --project-name flashmind .` to initialize the project in the root directory. Remove boilerplate comments from `pubspec.yaml`.
</action>
<acceptance_criteria>
- `pubspec.yaml` exists in the root.
- `lib/main.dart` is created.
</acceptance_criteria>

#### [Task] 1.2 Add Dependencies
<read_first>
- `pubspec.yaml`
- `.planning/phases/01-project-scaffold-core-layer/01-RESEARCH.md`
</read_first>
<action>
Add `get`, `get_storage`, `uuid`, and `google_fonts` (for Poppins) to `dependencies` in `pubspec.yaml`.
</action>
<acceptance_criteria>
- `pubspec.yaml` contains `get`, `get_storage`, `uuid`, and `google_fonts`.
- `flutter pub get` runs successfully.
</acceptance_criteria>

#### [Task] 1.3 Create Directory Structure
<read_first>
- `.planning/phases/01-project-scaffold-core-layer/01-CONTEXT.md`
</read_first>
<action>
Delete the default `lib/main.dart` contents (keep as empty for now) and create the following directories:
- `lib/app/` (routes, theme, bindings)
- `lib/core/` (constants, utils)
- `lib/data/` (models, services, repositories)
- `lib/features/home/` (controllers, widgets, screens)
- `lib/features/manage/` (controllers, widgets, screens)
</action>
<acceptance_criteria>
- All listed directories exist under `lib/`.
</acceptance_criteria>

---

### Wave 2: Core Implementation

#### [Task] 2.1 Implement Core Utilities
<read_first>
- `implementation_plan.md`
</read_first>
<action>
Create:
- `lib/core/constants/app_constants.dart` with `storageKey`, `flipDuration`, etc.
- `lib/core/utils/validators.dart` with `validateQuestion` and `validateAnswer`.
</action>
<acceptance_criteria>
- `AppConstants.storageKey` equals `'flashcards'`.
- `Validators.validateQuestion` checks for empty and >300 chars.
</acceptance_criteria>

#### [Task] 2.2 Implement Flashcard Model
<read_first>
- `implementation_plan.md`
</read_first>
<action>
Create `lib/data/models/flashcard.dart` with `id`, `question`, `answer`, `createdAt` fields and `fromJson`/`toJson` methods.
</action>
<acceptance_criteria>
- `Flashcard` class implements `fromJson` and `toJson`.
</acceptance_criteria>

#### [Task] 2.3 Implement Persistence Layer
<read_first>
- `.planning/phases/01-project-scaffold-core-layer/01-RESEARCH.md`
</read_first>
<action>
Create:
- `lib/data/services/storage_service.dart` (interface and `GetStorage` implementation).
- `lib/data/repositories/flashcard_repository.dart` (interface and implementation using `StorageService` and `uuid`).
</action>
<acceptance_criteria>
- `StorageService` encapsulates `GetStorage` write/read.
- `FlashcardRepository` methods (`getAll`, `save`, `delete`) are implemented.
</acceptance_criteria>

---

## must_haves
- [ ] Working Flutter project structure.
- [ ] Validated `Flashcard` model with serialization.
- [ ] Abstracted repository layer for CRUD operations.

## Post-Execution Verification
- Run `flutter test` (if applicable) or verify file existence and basic code syntax using `dart analyze`.
