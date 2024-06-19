import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/app_icon.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(18.75),
      ),
    );
  }
}
