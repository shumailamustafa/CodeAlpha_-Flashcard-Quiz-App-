# Research — Features

## Feature Analysis

### Table Stakes (Must-Have)
- **Flip Interaction**: Instant feedback on card flip. Users expect a physical feel.
- **CRUD Operations**: Ability to manage the card deck (Add, Edit, Delete).
- **Search**: Quick filtering as the deck grows.
- **Navigation**: Simple Next/Previous controls with a clear counter.

### Differentiators
- **3D Realism**: Using perspective and Matrix4 rotations to create a "wow" factor compared to simple fade/slide transitions.
- **Zero-Latency Persistence**: GetStorage provides synchronous feel, ensuring data is saved instantly.
- **Clean MVVM Structure**: Ensuring the app remains fast and modular even as features are added.

### Anti-Features (Deliberately Excluded)
- **Gamification/Streaks**: Focus for v1.0 is on the core utility and aesthetics, not psychological hooks.
- **Rich Text Editor**: Initial v1.0 will focus on plain text to maintain simplicity and performance.
