# Student Grade Tracker

A Flutter application where students can add subjects with marks, view computed letter grades, and see a real-time result summary.

## Features

- **Add Subject** — Enter a subject name and mark (0–100). The app validates input and computes the grade automatically.
- **Subject List** — View all added subjects in a scrollable list showing name, mark, and letter grade. Swipe left on any item to delete it.
- **Result Summary** — See total subjects, average mark, overall grade, and counts of passing vs. failing subjects. Updates live as you add or remove subjects.
- **Light / Dark Theme** — Toggle between custom light and dark themes using the icon in the AppBar.

## Grading Scale

| Grade | Mark Range |
|-------|-----------|
| A     | 80 – 100  |
| B     | 65 – 79   |
| C     | 50 – 64   |
| F     | 0 – 49    |

## Tech Stack

- **Flutter** & **Dart**
- **Provider** for state management (zero `setState` calls)
- Custom `ThemeData` for both light and dark mode — no hardcoded colors

## Project Structure

```
lib/
├── main.dart                          # App entry, MultiProvider, navigation shell
├── models/
│   └── subject.dart                   # Subject class with private _mark & grade getter
├── providers/
│   ├── subject_provider.dart          # Subject list state + computed stats
│   └── theme_provider.dart            # Light/dark theme toggle
├── screens/
│   ├── add_subject_screen.dart        # Form with validation
│   ├── subject_list_screen.dart       # ListView.builder + Dismissible
│   └── summary_screen.dart            # Live result summary
└── themes/
    └── app_themes.dart                # Custom light & dark ThemeData
```

## How to Run

1. **Prerequisites** — Install [Flutter](https://docs.flutter.dev/get-started/install) (SDK 3.12+).

2. **Clone the repo**
   ```bash
   git clone https://github.com/tem-mahadi/student_grade_tracker.git
   cd student_grade_tracker
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```
   Choose a connected device or emulator when prompted.

## License

This project is for academic purposes.
