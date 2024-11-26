import 'package:flutter/material.dart';

class BackButtonWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset('assets/icons/Back.png', width: 24, color: Colors.black),
        ),
        SizedBox(width: 8),
        Text(
          'Back',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
