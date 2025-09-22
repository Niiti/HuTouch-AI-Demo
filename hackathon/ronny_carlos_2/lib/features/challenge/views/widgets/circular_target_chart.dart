import 'package:flutter/material.dart';
import 'package:hackaton_end/core/constants/app_colors.dart';
import 'package:hackaton_end/core/extensions/context_extensions.dart';

class CircularTargetChart extends StatelessWidget {
  final double caloriesProgress;
  final String caloriesTextTop;

  const CircularTargetChart({
    super.key,
    required this.caloriesProgress,
    required this.caloriesTextTop,
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return CustomPaint(
      painter: _CaloriesPainter(progress: caloriesProgress),
      child: Center(
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.all(h * 1.2),
            child: Text(
              caloriesTextTop,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: h * 2.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CaloriesPainter extends CustomPainter {
  final double progress;
  _CaloriesPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.shortestSide * 0.12;
    final rect = Offset.zero & size;
    final bg = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = AppColors.primaryLight;
    final fg = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = stroke
      ..color = AppColors.primary;
    canvas.drawArc(rect.deflate(stroke / 2), -3.14 / 2, 2 * 3.14, false, bg);
    canvas.drawArc(rect.deflate(stroke / 2), -3.14 / 2, 2 * 3.14 * progress, false, fg);

    final shadowPaint = Paint()
      ..color = AppColors.accent.withOpacity(0.85)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);
    final c = rect.center;
    canvas.drawCircle(Offset(c.dx, c.dy + size.shortestSide * 0.15), size.shortestSide * 0.02, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant _CaloriesPainter oldDelegate) => oldDelegate.progress != progress;
}
