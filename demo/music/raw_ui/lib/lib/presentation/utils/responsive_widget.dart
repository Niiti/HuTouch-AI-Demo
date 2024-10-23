import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, Size size) builder;

  ResponsiveWidget({required this.builder});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return builder(context, size);
  }
}