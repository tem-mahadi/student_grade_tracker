import 'package:flutter/material.dart';

/// Custom app themes — no default Material themes used.
/// All colors in the app must come from Theme.of(context).
class AppThemes {
  AppThemes._(); // prevent instantiation

  // ─── Light Theme ───────────────────────────────────────────────

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF4A6CF7),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFDBE1FF),
      onPrimaryContainer: Color(0xFF001452),
      secondary: Color(0xFF6C63FF),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFE4DFFF),
      onSecondaryContainer: Color(0xFF1B0261),
      tertiary: Color(0xFF00C9A7),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFC0F5E8),
      onTertiaryContainer: Color(0xFF003829),
      error: Color(0xFFE53935),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xFFF8F9FE),
      onSurface: Color(0xFF1A1C2E),
      surfaceContainerHighest: Color(0xFFE2E3EE),
      onSurfaceVariant: Color(0xFF45465F),
      outline: Color(0xFF767688),
      outlineVariant: Color(0xFFC6C6D8),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2F3042),
      onInverseSurface: Color(0xFFF1F0FB),
      inversePrimary: Color(0xFFB4C4FF),
      surfaceTint: Color(0xFF4A6CF7),
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F9FE),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF4A6CF7),
      foregroundColor: Color(0xFFFFFFFF),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFFFFFFFF),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: Color(0xFF4A6CF7),
      unselectedItemColor: Color(0xFF767688),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFFFFFFFF),
      elevation: 2,
      shadowColor: const Color(0xFF4A6CF7).withValues(alpha: 0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFFFFFFF),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFC6C6D8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFC6C6D8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF4A6CF7), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE53935)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE53935), width: 2),
      ),
      labelStyle: const TextStyle(color: Color(0xFF45465F)),
      hintStyle: const TextStyle(color: Color(0xFF767688)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4A6CF7),
        foregroundColor: const Color(0xFFFFFFFF),
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A1C2E),
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1A1C2E),
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1A1C2E),
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1A1C2E),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF1A1C2E),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF45465F),
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF4A6CF7),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFF2F3042),
      contentTextStyle: const TextStyle(color: Color(0xFFF1F0FB)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    ),
    iconTheme: const IconThemeData(color: Color(0xFF45465F)),
    dividerTheme: const DividerThemeData(color: Color(0xFFE2E3EE), thickness: 1),
  );

  // ─── Dark Theme ────────────────────────────────────────────────

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF7B8FFF),
      onPrimary: Color(0xFF002580),
      primaryContainer: Color(0xFF003AB5),
      onPrimaryContainer: Color(0xFFDBE1FF),
      secondary: Color(0xFFB4ADFF),
      onSecondary: Color(0xFF2D0098),
      secondaryContainer: Color(0xFF4400D4),
      onSecondaryContainer: Color(0xFFE4DFFF),
      tertiary: Color(0xFF5EFCDA),
      onTertiary: Color(0xFF003829),
      tertiaryContainer: Color(0xFF00513D),
      onTertiaryContainer: Color(0xFFC0F5E8),
      error: Color(0xFFFF6B6B),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF121326),
      onSurface: Color(0xFFE3E2F0),
      surfaceContainerHighest: Color(0xFF33344A),
      onSurfaceVariant: Color(0xFFC6C6D8),
      outline: Color(0xFF8F90A1),
      outlineVariant: Color(0xFF45465F),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE3E2F0),
      onInverseSurface: Color(0xFF2F3042),
      inversePrimary: Color(0xFF4A6CF7),
      surfaceTint: Color(0xFF7B8FFF),
    ),
    scaffoldBackgroundColor: const Color(0xFF121326),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1B30),
      foregroundColor: Color(0xFFE3E2F0),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE3E2F0),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1A1B30),
      selectedItemColor: Color(0xFF7B8FFF),
      unselectedItemColor: Color(0xFF8F90A1),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1E1F36),
      elevation: 2,
      shadowColor: const Color(0xFF000000).withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E1F36),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF45465F)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF45465F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF7B8FFF), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF6B6B)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF6B6B), width: 2),
      ),
      labelStyle: const TextStyle(color: Color(0xFFC6C6D8)),
      hintStyle: const TextStyle(color: Color(0xFF8F90A1)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7B8FFF),
        foregroundColor: const Color(0xFF002580),
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE3E2F0),
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE3E2F0),
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE3E2F0),
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFFE3E2F0),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFFE3E2F0),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFFC6C6D8),
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF7B8FFF),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFF33344A),
      contentTextStyle: const TextStyle(color: Color(0xFFE3E2F0)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    ),
    iconTheme: const IconThemeData(color: Color(0xFFC6C6D8)),
    dividerTheme: const DividerThemeData(color: Color(0xFF33344A), thickness: 1),
  );
}
