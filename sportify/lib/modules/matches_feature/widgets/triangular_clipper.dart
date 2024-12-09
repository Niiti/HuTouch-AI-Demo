import 'package:flutter/material.dart';

class TriangularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height / 2); // Start at the left center
    path.lineTo(size.width * 0.1, 0); // Top-left triangle edge
    path.lineTo(size.width * 0.9, 0); // Top-right triangle edge
    path.lineTo(size.width, size.height / 2); // Right center
    path.lineTo(size.width * 0.9, size.height); // Bottom-right triangle edge
    path.lineTo(size.width * 0.1, size.height); // Bottom-left triangle edge
    path.close(); // Complete the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
