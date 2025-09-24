// lib/features/welcome/presentation/widgets/main_image.dart
import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.55,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/coffee_background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
