import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;

  NextButton({
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.all(16.0),
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Colors.blue : Colors.grey,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        textStyle: TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        'Next',
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        ),
      ),
      ),
    );
}
}