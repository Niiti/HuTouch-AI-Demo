// lib/main.dart
import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';
import 'features/welcome/presentation/screens/generated_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: AppTheme.themeData,
      home: GeneratedUI(),
    );
  }
}
