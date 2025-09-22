import 'package:flutter/material.dart';
import 'package:hackaton_end/core/extensions/context_extensions.dart';

class LunchPreviewScreen extends StatelessWidget {
  const LunchPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Scaffold(
      appBar: AppBar(title: const Text('Lunch Preview')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(h * 2),
            child: const Text('Preview your lunch details here.'),
          ),
        ),
      ),
    );
  }
}
