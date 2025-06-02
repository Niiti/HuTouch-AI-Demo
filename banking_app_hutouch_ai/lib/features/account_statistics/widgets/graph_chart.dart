import 'package:flutter/material.dart';
import 'package:banking_app_hutouch_ai/core/constants/color_config.dart';

class GraphChart extends StatelessWidget {
  const GraphChart({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kOutlineColor, width: 1),
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              kPrimaryColor.withOpacity(0.078),
              kPrimaryColor.withOpacity(0),
            ],
          ),
        ),
        child: CustomPaint(painter: _GraphPainter()),
      ),
    );
  }
}

class _GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final path = Path()
      ..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.6,
          size.width * 0.5, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.9,
          size.width, size.height * 0.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
