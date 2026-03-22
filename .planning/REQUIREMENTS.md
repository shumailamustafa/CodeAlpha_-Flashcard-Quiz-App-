# REQUIREMENTS.md

## High-Level Requirements

| ID | Requirement | Category | Priority |
|----|-------------|----------|----------|
| **F-01** | **3D Flashcard Flip** | Animation | P0 |
| **F-02** | **Add/Edit/Delete Cards** | CRUD | P0 |
| **F-03** | **Local Data Persistence** | Storage | P0 |
| **F-04** | **Deck Navigation** | UI/UX | P1 |
| **F-05** | **Real-time Search** | UI/UX | P1 |
| **A-01** | **MVVM + GetX Architecture** | Architecture | P0 |

---

## Detailed Requirements

### 1. Home / Quiz Feature
- Display one card at a time.
- Animated 3D flip on tap (Matrix4.rotationY).
- "Previous" and "Next" buttons with boundary checks (disable at ends).
- Card counter (e.g., "Card 3 of 10").
- Refresh state when returning from the Manage screen.

### 2. Manage Deck Feature
- Search bar to filter cards by question or answer.
- Scrollable list of all cards (limited question/answer preview).
- Swipe-to-delete with confirmation dialog.
- FAB to add new cards via Bottom Sheet.
- Pencil icon to edit existing cards via Bottom Sheet.

### 3. Data & Storage
- Model: `Flashcard` (id, question, answer, createdAt).
- Storage: `GetStorage` for JSON serialization of the deck.
- Repository: Abstracted CRUD layer.

### 4. UI/UX & Design
- **Typography**: Poppins (all weights).
- **Color Palette**: 
  - Primary: `#1565C0` (Blue)
  - Accent: `#42A5F5` (Light Blue)
  - Background: `#F5F7FA` (Cool Gray)
- **Constraint**: No file should exceed 160 lines of code.

---
## Verification Plan
- **Manual**: Test flip animation smoothness, verify CRUD persistence after app restart.
- **Automated**: Validate `Validators.dart` logic and `Flashcard` model serialization.
