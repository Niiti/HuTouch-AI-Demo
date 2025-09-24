import 'package:flutter/material.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Discover', style: TextStyle(fontSize: context.heightUnit * 2.4)),
        ),
      ),
    );
  }
}
