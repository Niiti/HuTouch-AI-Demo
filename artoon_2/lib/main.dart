import 'package:flutter/material.dart';
import 'language_selection_screen.dart';

void main() {
  runApp(LanguageSelectionApp());
}

class LanguageSelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARToon AI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageSelectionScreen(),
    );
  }
}
