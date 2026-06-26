import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/subject_provider.dart';
import 'providers/theme_provider.dart';
import 'themes/app_themes.dart';
import 'screens/add_subject_screen.dart';
import 'screens/subject_list_screen.dart';
import 'screens/summary_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubjectProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const StudentGradeTrackerApp(),
    ),
  );
}

/// Root widget. Theme is driven by [ThemeProvider] — no setState anywhere.
class StudentGradeTrackerApp extends StatelessWidget {
  const StudentGradeTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'Student Grade Tracker',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const HomeShell(),
        );
      },
    );
  }
}

/// App shell with BottomNavigationBar.
///
/// Navigation index is managed via a dedicated [_NavProvider] so we can
/// avoid setState entirely.
class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavProvider(),
      child: Consumer<_NavProvider>(
        builder: (context, nav, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Grade Tracker'),
              actions: [
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, _) {
                    return IconButton(
                      icon: Icon(
                        themeProvider.isDarkMode
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined,
                      ),
                      tooltip: themeProvider.isDarkMode
                          ? 'Switch to Light Mode'
                          : 'Switch to Dark Mode',
                      onPressed: () => themeProvider.toggleTheme(),
                    );
                  },
                ),
              ],
            ),
            body: IndexedStack(
              index: nav.currentIndex,
              children: const [
                AddSubjectScreen(),
                SubjectListScreen(),
                SummaryScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: nav.currentIndex,
              onTap: nav.setIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline),
                  activeIcon: Icon(Icons.add_circle),
                  label: 'Add',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined),
                  activeIcon: Icon(Icons.list_alt),
                  label: 'Subjects',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.analytics_outlined),
                  activeIcon: Icon(Icons.analytics),
                  label: 'Summary',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Tiny ChangeNotifier to hold the bottom nav index — avoids setState.
class _NavProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}