import 'package:flutter/material.dart';

class TriangularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(20, 0); // Left triangle start
    path.lineTo(0, size.height / 2); // Left triangle point
    path.lineTo(20, size.height); // Left triangle end
    path.lineTo(size.width - 20, size.height); // Bottom-right corner
    path.lineTo(size.width, size.height / 2); // Right triangle point
    path.lineTo(size.width - 20, 0); // Right triangle end
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
