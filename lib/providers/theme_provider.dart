import 'package:flutter/foundation.dart';

/// Manages the app's theme mode (light or dark).
///
/// Toggle via [toggleTheme]. All UI reads [isDarkMode] through Provider.
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  /// Whether the app is currently in dark mode.
  bool get isDarkMode => _isDarkMode;

  /// Toggles between light and dark mode.
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
