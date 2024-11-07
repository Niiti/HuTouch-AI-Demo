import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;

  ProfileScreen({this.userName = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement Profile Screen UI
      appBar: AppBar(
        title: Text(userName.isNotEmpty ? userName : 'Profile'),
      ),
      body: Center(
        child: Text(
          userName.isNotEmpty ? '$userName\'s Profile' : 'Profile Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
