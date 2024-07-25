import 'package:flutter/material.dart';

class AdPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      color: Colors.grey[200],
      child: Center(
        child: Text(
          'Loading...',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
