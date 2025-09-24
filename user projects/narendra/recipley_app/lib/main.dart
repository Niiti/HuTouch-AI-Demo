import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipley_app/core/theme/app_theme.dart';
import 'package:recipley_app/modules/shell/presentation/shell_screen.dart';

void main() {
  runApp(const ProviderScope(child: RecipleyApp()));
}

class RecipleyApp extends StatelessWidget {
  const RecipleyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipely',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const ShellScreen(),
    );
  }
}
