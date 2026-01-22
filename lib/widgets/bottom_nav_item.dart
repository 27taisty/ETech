// lib/widgets/bottom_nav_item.dart

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Элемент нижней навигации с масштаб-анимацией.
class BottomNavItem extends StatefulWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onSelected; // ← Вызов при выборе вкладки

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..value = 1.0;

    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onTapDown() {
    controller
      ..reset()
      ..animateTo(0.85, duration: const Duration(milliseconds: 100));
  }

  void _onTapUp() {
    controller.animateTo(1.0);
    widget.onSelected(); // Уведомляем родителя
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = widget.isSelected
        ? Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white
        : AppTheme.disabledColor;

    return Expanded(
      child: GestureDetector(
        onTapDown: (_) => _onTapDown(),
        onTapUp: (_) => _onTapUp(),
        onTapCancel: () => controller.animateTo(1.0),
        behavior: HitTestBehavior.opaque,
        child: Container(
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: scaleAnimation,
            builder: (context, child) {
              return Transform.scale(scale: scaleAnimation.value, child: child);
            },
            child: Icon(widget.icon, color: iconColor, size: 30),
          ),
        ),
      ),
    );
  }
}
