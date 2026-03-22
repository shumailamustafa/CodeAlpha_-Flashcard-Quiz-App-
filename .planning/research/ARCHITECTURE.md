# Research — Architecture

## Component Boundaries

- **View**: Flutter Widgets (Stateless/Stateful). Responsible for layout and animation triggers.
- **Controller (ViewModel)**: `GetxController`. Holds reactive state (`.obs`) and handles business logic.
- **Repository**: Abstraction layer that manages data fetching and persistence.
- **Services**: Low-level wrappers (e.g., `GetStorage` wrapper).

## Data Flow
1. **User Action**: Tap "Show Answer".
2. **View Call**: `controller.toggleFlip()`.
3. **Controller Action**: Updates `isFlipped.value`.
4. **Reactive Update**: `Obx` in View detects change and triggers `Matrix4` animation.

## Build Order
1. **Core Utilities**: Constants and Validators.
2. **Data Layer**: Models, Repositories, and Storage Services.
3. **Bindings/Routes**: Application wiring.
4. **Feature Modules**: Home/Quiz first (core value), then Manage Deck (CRUD).
