import 'package:flutter/material.dart';
import 'views/language_selection_screen.dart';
import 'resources/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Selector',
      theme: AppTheme.theme,
      home: LanguageSelectionScreen(),
    );
  }
}
