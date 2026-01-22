// lib/pages/home_page.dart

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Главная страница',
      child: Center(
        child: Text(
          'Главная',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
