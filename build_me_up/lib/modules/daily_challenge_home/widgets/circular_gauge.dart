import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';

class CircularGauge extends StatelessWidget {
  final double size;
  final double thickness;
  final double progress;
  final Widget center;
  final Color trackColor;
  final Color progressColor;

  const CircularGauge({
    super.key,
    required this.size,
    required this.thickness,
    required this.progress,
    required this.center,
    this.trackColor = AppColors.lightMint,
    this.progressColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RingPainter(
          progress: progress,
          thickness: thickness,
          trackColor: trackColor,
          progressColor: progressColor,
        ),
        child: Center(child: center),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final double thickness;
  final Color trackColor;
  final Color progressColor;

  _RingPainter({
    required this.progress,
    required this.thickness,
    required this.trackColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = math.min(size.width, size.height) / 2;

    final trackPaint =
        Paint()
          ..color = trackColor
          ..strokeWidth = thickness
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final progressPaint =
        Paint()
          ..color = progressColor
          ..strokeWidth = thickness
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2,
      false,
      trackPaint,
    );

    final sweep = math.pi * 2 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweep,
      false,
      progressPaint,
    );

    if (progress > 0) {
      final angle = -math.pi / 2 + sweep;
      final knobRadius = thickness * 0.55;
      final knobCenter = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      final knobPaint = Paint()..color = progressColor;
      canvas.drawCircle(knobCenter, knobRadius, knobPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        thickness != oldDelegate.thickness ||
        trackColor != oldDelegate.trackColor ||
        progressColor != oldDelegate.progressColor;
  }
}
