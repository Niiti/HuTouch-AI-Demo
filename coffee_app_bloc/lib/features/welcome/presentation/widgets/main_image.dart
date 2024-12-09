// lib/features/welcome/presentation/widgets/main_image.dart
import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.55,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/coffee_background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
