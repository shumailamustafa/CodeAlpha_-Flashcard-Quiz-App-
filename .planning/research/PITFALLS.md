# Research — Pitfalls

## Potential Issues & Prevention

| Pitfall | Prevention Strategy |
|---------|---------------------|
| **Mirror Text on Back Face** | Apply an additional `math.pi` rotation to the back face widget's internal transform. |
| **Animation Jitter** | Use `AnimatedBuilder` to ensure efficient rebuilds; avoid heavy logic inside the build method. |
| **State Desync** | Re-read from repository when returning to the Home screen from Manage screen (using `.then()` callback). |
| **Storage Uninitialized** | Ensure `GetStorage.init()` is awaited in `main()` before `runApp()`. |
| **Matrix4 Perspective Flatness** | Ensure `setEntry(3, 2, 0.001)` is applied *after* identity matrix initialization. |
