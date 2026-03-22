# FlashMind

## What This Is

FlashMind is a cross-platform Flutter mobile flashcard quiz application designed for students and professionals. It provides a focused, high-performance study experience using 3D card flip animations and local data persistence.

## Core Value

Intuitive, distraction-free flashcard studying with a premium 3D interface.

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] 3D Card Flip Animation with Matrix4 transformation
- [ ] Local persistence with GetStorage
- [ ] MVVM + GetX architecture integration
- [ ] Manage Deck screen with CRUD operations (Add, Edit, Delete, Search)
- [ ] Home/Quiz screen with card navigation and progress counter
- [ ] Professional UI/UX using Poppins typography and a curated blue-themed palette

### Out of Scope

- Cloud synchronization (Sync v2 consideration)
- Multiple decks (Single deck for v1.0)
- Detailed analytics/SRS (Simple quiz for v1.0)

## Context

- **Ecosystem**: Flutter 3.22+ / Dart 3.3.0+
- **Architecture**: MVVM + GetX + Repository Pattern
- **Storage**: GetStorage (lightweight key-value pair)

## Constraints

- **Tech Stack**: GetX, GetStorage, Google Fonts, UUID
- **Design**: Poppins (400, 500, 600, 700), Blue primary (#1565C0)
- **Code Quality**: File size target < 150 lines of code

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| GetX for DI/State | PRD requirement; lightweight and integrated | — Pending |
| GetStorage | Performance and simplicity over Hive for v1.0 | — Pending |

---
## Evolution

This document evolves at phase transitions and milestone boundaries.

**After each phase transition** (via `/gsd-transition`):
1. Requirements invalidated? → Move to Out of Scope with reason
2. Requirements validated? → Move to Validated with phase reference
3. New requirements emerged? → Add to Active
4. Decisions to log? → Add to Key Decisions
5. "What This Is" still accurate? → Update if drifted

**After each milestone** (via `/gsd-complete-milestone`):
1. Full review of all sections
2. Core Value check — still the right priority?
3. Audit Out of Scope — reasons still valid?
4. Update Context with current state

---
*Last updated: 2026-03-22 after initialization*
