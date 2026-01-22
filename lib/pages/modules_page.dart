// lib/pages/modules_page.dart

import 'package:flutter/material.dart';

class ModulesPage extends StatelessWidget {
  const ModulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Страница модулей',
      child: Center(
        child: Text('Модули', style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
