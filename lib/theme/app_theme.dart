// lib/theme/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static const Color appBackground = Color(0xFF24272C); // Новый основной цвет
  static const Color textColor = Colors.white;
  static const Color disabledColor = Color.fromARGB(255, 137, 137, 137);

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: appBackground,
    canvasColor: appBackground,
    colorScheme: ColorScheme.dark(
      primary: textColor,
      secondary: textColor,
      background: appBackground,
      surface: appBackground,
      onPrimary: appBackground,
      onSecondary: appBackground,
    ),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appBackground, // Теперь #24272C
      selectedItemColor: textColor,
      unselectedItemColor: disabledColor,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: appBackground,
      elevation: 0,
      surfaceTintColor: appBackground,
    ),
  );
}
