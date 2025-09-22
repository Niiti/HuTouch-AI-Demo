import 'package:flutter/material.dart';
import 'package:hackaton_end/core/extensions/context_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(h * 2),
            child: const Text('Home'),
          ),
        ),
      ),
    );
  }
}
