# Research — Stack

## Recommended Stack (2025)

| Layer | Technology | Rationale | Confidence |
|-------|------------|-----------|------------|
| Framework | Flutter 3.22+ | Cross-platform, high performance, robust animation support. | High |
| State Management | GetX | Minimal boilerplate, integrated DI, and high-performance reactive state. | High |
| Storage | GetStorage | Synchronous operations, ultra-lightweight, and perfect for simple key-value flashcard data. | High |
| Typography | Google Fonts (Poppins) | Modern, readable, and aesthetic for educational apps. | High |
| ID Generation | UUID v4 | Standard for unique identifier generation without collisions. | High |

## Alternatives Considered

- **Hive**: Faster for very large datasets and binary storage. Dismissed for v1.0 as `GetStorage` is simpler and matches PRD requirements.
- **Provider/Bloc**: Alternative state management. Dismissed to align with PRD's GetX requirement.

## What NOT to Use
- **Shared Preferences**: Too slow for frequent updates/reads compared to GetStorage.
- **SQLite**: Overkill for a simple flashcard app; introduces unnecessary complexity.
