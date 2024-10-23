import 'package:flutter/material.dart';

class libHeaderSection extends StatelessWidget {
  final String title;

  const libHeaderSection({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
            height: 1.1667,
            color: Colors.white.withOpacity(0.75),
          ),
        ),
      ),
    );
  }
}