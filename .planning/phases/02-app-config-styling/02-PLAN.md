# Phase 2: App Config & Styling - Plan

## Objective
Implement the application's configuration layer, including global theming, routing, and dependency injection.

## Requirements Addressed
- **F-04**: Deck Navigation (Routing setup)
- **A-01**: MVVM + GetX Architecture (App configuration)

---

## Technical Tasks

### Wave 1: Theming & Routes

#### [Task] 1.1 Implement AppTheme
<read_first>
- `implementation_plan.md`
- `02-CONTEXT.md`
</read_first>
<action>
Create `lib/app/theme/app_theme.dart`. Implement a `ThemeData` that uses the Poppins font and the blue-themed color palette specified in the implementation plan. Configure `AppBarTheme`, `ElevatedButtonTheme`, and `InputDecorationTheme`.
</action>
<acceptance_criteria>
- `AppTheme.lightTheme` exists.
- `primaryColor` is `0xFF1565C0`.
- `google_fonts` (Poppins) is used in `textTheme`.
</acceptance_criteria>

#### [Task] 1.2 Implement Routes & Stub Pages
<read_first>
- `implementation_plan.md`
</read_first>
<action>
1. Create `lib/app/routes/app_routes.dart` with `HOME` and `MANAGE` constants.
2. Create stub screen files to avoid routing errors:
   - `lib/features/home/home_screen.dart` (Empty Scaffold with "Home")
   - `lib/features/manage/manage_screen.dart` (Empty Scaffold with "Manage Deck")
3. Create `lib/app/routes/app_pages.dart` to map these routes.
</action>
<acceptance_criteria>
- `AppRoutes.HOME` is `/`.
- `AppPages.routes` contains two `GetPage` entries.
</acceptance_criteria>

---

### Wave 2: Bindings & App Entry

#### [Task] 2.1 Implement Feature Bindings
<read_first>
- `02-CONTEXT.md`
</read_first>
<action>
1. Create `lib/app/bindings/home_binding.dart`. Register `StorageService`, `FlashcardRepository`, and a stub `HomeController`.
2. Create `lib/app/bindings/manage_binding.dart`. Register a stub `ManageController`.
</action>
<acceptance_criteria>
- `HomeBinding` and `ManageBinding` implement `Bindings`.
- `StorageService` is registered in `HomeBinding`.
</acceptance_criteria>

#### [Task] 2.2 Finalize App Widget and main.dart
<read_first>
- `02-CONTEXT.md`
</read_first>
<action>
1. Create `lib/app/app.dart` with `FlashMindApp` widget using `GetMaterialApp`.
2. Update `lib/main.dart` to initialize `GetStorage` and call `runApp(FlashMindApp())`.
</action>
<acceptance_criteria>
- `main.dart` contains `await GetStorage.init()`.
- `FlashMindApp` uses `AppTheme.lightTheme`.
</acceptance_criteria>

---

## must_haves
- [ ] Global styling with Poppins font and blue theme.
- [ ] Working routing system with FadeIn transitions.
- [ ] Automated dependency injection via GetX Bindings.

## Post-Execution Verification
- Run `dart analyze` to ensure no errors.
- Run `flutter test` (if applicable).
