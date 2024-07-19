import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      hintColor: Colors.blueAccent,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: const Color.fromARGB(255, 255, 255, 255),
        // elevation: 12,
        titleTextStyle: TextStyle(
          fontFamily: 'Arial',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 44, 44, 44),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
    );
  }
}
