import 'package:dating3/screens/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants/constants.dart';

void main() {
  runApp(FriendzyApp());
}

class FriendzyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friendzy',
      theme: ThemeData(
        fontFamily: 'Hellix',
      ),
      home: LoginScreen(),
    );
  }
}
