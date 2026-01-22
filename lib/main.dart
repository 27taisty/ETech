// main.dart

import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'main_navigation_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETech',
      theme: AppTheme.darkTheme, // Подключаем тему
      home: const MainNavigationScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}
