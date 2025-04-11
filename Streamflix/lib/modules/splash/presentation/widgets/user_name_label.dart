import 'package:flutter/material.dart';

class UserNameLabel extends StatelessWidget {
  final String userName;
  const UserNameLabel({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Text(
      userName,
      style: TextStyle(
        fontSize: screenHeight * 0.025,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
