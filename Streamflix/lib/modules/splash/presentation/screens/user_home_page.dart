import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  final String userName;
  const UserHomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$userName\'s Home')),
      body: Center(child: Text('Welcome to $userName\'s homepage!')),
    );
  }
}
