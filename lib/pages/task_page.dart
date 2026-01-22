// lib/pages/task_page.dart

import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Страница заданий',
      child: Center(
        child: Text(
          'Задания',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
