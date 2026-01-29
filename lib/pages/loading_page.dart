// lib/pages/loading_page.dart

import 'dart:async';
import 'package:flutter/material.dart';
import '../main_navigation_scaffold.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double _progress = 0.0;
  Timer? _timer;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _startInitialization();
  }

  void _startInitialization() {
    if (_isInitialized) return;
    _isInitialized = true;

    const totalSteps = 30;
    const stepDuration = Duration(milliseconds: 50);
    final step = 1.0 / totalSteps;
    int elapsedSteps = 0;

    _timer = Timer.periodic(stepDuration, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        elapsedSteps++;
        _progress = (step * elapsedSteps).clamp(0.0, 1.0);

        if (_progress >= 1.0) {
          timer.cancel();
          _completeLoading();
        }
      });
    });
  }

  void _completeLoading() {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (!mounted) return;
      _navigateToMain();
    });
  }

  void _navigateToMain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainNavigationScaffold()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Загрузка...', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.grey[300],
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text('${(_progress * 100).toInt()}%'),
          ],
        ),
      ),
    );
  }
}
