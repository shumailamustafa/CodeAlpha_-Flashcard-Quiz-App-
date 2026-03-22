# Phase 2: App Config & Styling - Context

**Gathered:** 2026-03-22
**Status:** Ready for planning
**Source:** PRD Express Path (implementation_plan.md)

<domain>
## Phase Boundary

Phase 2 builds the application's configuration layer, ensuring consistent styling and navigation. It delivers:
1.  **Visual Identity**: Implementing the Poppins-based `AppTheme`.
2.  **Navigation System**: Setting up GetX `AppRoutes` and `AppPages`.
3.  **Dependency Injection**: Creating bindings for the `Home` and `Manage` features.
4.  **App Core**: Finalizing the `FlashMindApp` widget and the `main.dart` entry point.

</domain>

<decisions>
## Implementation Decisions

### [UI] Theme & Personalization
- **Typography**: Poppins for all text styles via `GoogleFonts`.
- **Colors**: Primary Blue (`0xFF1565C0`), Accent Light Blue (`0xFF42A5F5`), Background (`0xFFF5F7FA`).
- **Styles**: Rounded corners (12px) for buttons, cards, and input fields.

### [UX] Navigation & Routing
- Routes: `HOME` (`/`) and `MANAGE` (`/manage`).
- Page Registry: Map routes to screens with their respective bindings.
- Transitions: Use smooth fade-in transitions between screens.

### [Architecture] Dependency Management
- **`HomeBinding`**: Registers `StorageService`, `FlashcardRepository` (with singleton behavior), and `HomeController`.
- **`ManageBinding`**: Registers `ManageController`.

### the agent's Discretion
- Exact font weights and sizes for standard Material TextStyles (Headline, Title, Body).
- Theme configuration for `GetMaterialApp` (dialog theme, button padding, etc.).

</decisions>

<canonical_refs>
## Canonical References

### Project Specifications
- `implementation_plan.md` — Detailed file-by-file roadmap for Phase 2.
- `FlashMind_PRD.md` — Visual requirements §5.

### System Assets
- `lib/core/constants/app_constants.dart` — Used for titles and key strings.

</canonical_refs>

<specifics>
## Specific Ideas
- `FlashMindApp` should be a `StatelessWidget` returning `GetMaterialApp`.
- `main.dart` must initialize `GetStorage` before running the app.

</specifics>

<deferred>
## Deferred Ideas
- Screen-specific layouts (Phases 3 and 4).
- Controller logic for 3D animations and search filtering.

</deferred>

---

*Phase: 02-app-config-styling*
*Context gathered: 2026-03-22 via PRD Express Path*
