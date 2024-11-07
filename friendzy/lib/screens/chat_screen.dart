import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String userName;

  ChatScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement Chat Screen UI
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Center(
        child: Text(
          'Chat with $userName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
