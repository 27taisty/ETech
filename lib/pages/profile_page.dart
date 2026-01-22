// lib/pages/profile_page.dart

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Страница профиля',
      child: Center(
        child: Text(
          'Профиль',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
