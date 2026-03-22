# Phase 2: App Config & Styling - Research

## Research Goal
Define the best practices for implementing a global theme and routing system in a GetX-based Flutter application.

## Key Findings

### 1. Typography: Google Fonts (Poppins)
- **Finding**: Using `GoogleFonts.poppinsTextTheme()` in `ThemeData` is the most efficient way to apply the font globally.
- **Decision**: Configure `AppTheme` to use Poppins for all Material text styles (Headline, Title, Body).

### 2. State Management & DI: GetX Bindings
- **Finding**: Bindings decoupling initialization logic from the View.
- **Pattern**: 
  - `HomeBinding`: Registers core services (`StorageService`, `FlashcardRepository`) and the `HomeController`.
  - `ManageBinding`: Registers the `ManageController`.
- **Note**: `StorageService` and `FlashcardRepository` should be registered as singletons (or lazy put) to persist data across screens.

### 3. Routing: AppPages & Transitions
- **Finding**: `GetMaterialApp` supports named routes and custom transitions.
- **Decision**: Use `Transition.fadeIn` for a premium, non-jarring navigation experience.

## Technical Choices
| Component | Choice | Reason |
|-----------|--------|--------|
| Theme Mode | Light Mode (default) | Aligned with blue-themed PRD spec. |
| Navigation | Named Routes | Cleaner code and easier deep-linking. |
| Transitions | Fade In | Modern, premium feel. |

---
*Created: 2026-03-22*
