import 'package:flutter/material.dart';
import '../widgets/triangular_clipper.dart';

class StatsTeamButton extends StatelessWidget {
  final String label;
  final bool isActive;

  const StatsTeamButton({
    Key? key,
    required this.label,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipper: TriangularClipper(),
        child: Container(
          height: 40, // Reduced height for the buttons
          color: isActive ? Colors.red : Colors.grey[300],
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 12, // Reduced font size to match button size
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
