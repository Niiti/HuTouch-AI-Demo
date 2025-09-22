import 'package:flutter/material.dart';
import 'package:hackaton_end/core/extensions/context_extensions.dart';

class LunchBreakdownScreen extends StatelessWidget {
  const LunchBreakdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Scaffold(
      appBar: AppBar(title: const Text('Lunch Breakdown')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(h * 2),
            child: const Text('Macro and calorie breakdown for lunch.'),
          ),
        ),
      ),
    );
  }
}
