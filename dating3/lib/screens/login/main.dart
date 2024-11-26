// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'constants.dart';

void main() => runApp(DatingApp());

class DatingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating App',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Hellix',
      ),
      home: LoginScreen(),
    );
  }
}
