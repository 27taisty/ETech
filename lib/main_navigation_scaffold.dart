// lib/main_navigation_scaffold.dart

import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/modules_page.dart';
import 'pages/task_page.dart';
import 'pages/profile_page.dart';
import 'widgets/bottom_nav_item.dart';

enum AppTab {
  home(Icons.home_rounded, 'Главная'),
  modules(Icons.article_rounded, 'Модули'),
  tasks(Icons.bookmark_rounded, 'Задачи'),
  profile(Icons.person_rounded, 'Профиль');

  const AppTab(this.icon, this.label);

  final IconData icon;
  final String label;
}

class MainNavigationScaffold extends StatefulWidget {
  const MainNavigationScaffold({super.key});

  @override
  State<MainNavigationScaffold> createState() => _MainNavigationScaffoldState();
}

class _MainNavigationScaffoldState extends State<MainNavigationScaffold> {
  AppTab _currentTab = AppTab.home;

  final Map<AppTab, Widget> _pages = {
    AppTab.home: const HomePage(key: PageStorageKey('home')),
    AppTab.modules: const ModulesPage(key: PageStorageKey('modules')),
    AppTab.tasks: const TaskPage(key: PageStorageKey('tasks')),
    AppTab.profile: const ProfilePage(key: PageStorageKey('profile')),
  };

  void _onTabSelected(AppTab tab) {
    if (tab != _currentTab) {
      setState(() {
        _currentTab = tab;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentTab],
      bottomNavigationBar: Container(
        height: 90,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          children: AppTab.values.map((tab) {
            return BottomNavItem(
              key: ValueKey(tab.name),
              icon: tab.icon,
              isSelected: tab == _currentTab,
              onSelected: () => _onTabSelected(tab),
            );
          }).toList(),
        ),
      ),
    );
  }
}
