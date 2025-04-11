import 'package:flutter/material.dart';

class BirdIllustration extends StatelessWidget {
  const BirdIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final double illustrationHeight = MediaQuery.of(context).size.height * 0.3;
    return SizedBox(
      height: illustrationHeight,
      child: Padding(
        padding: const EdgeInsets.only(left: 30), // 👈 shift right by 30 pixels
        child: Image.asset('assets/images/owls.png', fit: BoxFit.contain),
      ),
    );
  }
}
